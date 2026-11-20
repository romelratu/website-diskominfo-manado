<?php $__env->startSection('title', $label); ?>

<?php $__env->startSection('content'); ?>
<div class="crumb">Menu Manager &rsaquo; <b><?php echo e($label); ?></b> &nbsp;·&nbsp; <i class="bi bi-arrows-move"></i> <?php echo e($flat ? 'Seret baris untuk mengubah urutan daftar.' : 'Seret baris untuk mengubah urutan, atau geser ke dalam menu lain untuk menjadikannya submenu.'); ?></div>
<div class="row g-4">
  <div class="col-xl-8">
    <div class="tree-card">
      <div class="tree-head"><div>Title</div><div class="hu">URL</div><div></div></div>
      <div id="menuTree"><?php echo $__env->make('admin.partials.menu-tree', ['by' => $by, 'pid' => 0, 'lv' => 0, 'jenis' => $jenis], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?></div>
      <?php if($rows->isEmpty()): ?><div class="tree-row"><div class="t" style="--lv:0">Belum ada menu.</div></div><?php endif; ?>
    </div>
  </div>
  <div class="col-xl-4">
    <div class="card shadow-sm"><div class="card-body p-4 pn-form">
      <h5 class="fw-bold mb-3"><?php echo e($edit ? 'Edit Menu' : 'Tambah Menu'); ?></h5>
      <form method="post" action="<?php echo e($edit ? route('admin.menu.update', [$jenis, $edit]) : route('admin.menu.store', $jenis)); ?>">
        <?php echo csrf_field(); ?> <?php if($edit): ?> <?php echo method_field('PUT'); ?> <?php endif; ?>
        <label>Judul</label><input class="form-control mb-3" name="title" maxlength="120" value="<?php echo e(old('title', $edit->title ?? '')); ?>" required>
        <label>URL</label><input class="form-control mb-3" name="url" maxlength="255" placeholder="halaman/visi-dan-misi atau https://..." value="<?php echo e(old('url', $edit->url ?? '')); ?>">
        <?php if($flat): ?>
          <label>Ikon</label>
          <select class="form-select mb-3" name="ikon"><?php $__currentLoopData = $icons; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $v): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?><option value="<?php echo e($k); ?>" <?php if(old('ikon', $edit->ikon ?? 'bi-file-earmark-text') === $k): echo 'selected'; endif; ?>><?php echo e($v); ?></option><?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?></select>
        <?php else: ?>
          <label>Menu induk</label>
          <select class="form-select mb-3" name="parent_id"><option value="0">— Menu teratas —</option>
            <?php $__currentLoopData = $flatTree; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $n): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
              <?php if(in_array((int) $n['menu']->id, $skip, true)) continue; ?>
              <option value="<?php echo e($n['menu']->id); ?>" <?php if((int) old('parent_id', $edit->parent_id ?? 0) === (int) $n['menu']->id): echo 'selected'; endif; ?>><?php echo e(str_repeat('— ', $n['lv'])); ?><?php echo e($n['menu']->title); ?></option>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
          </select>
        <?php endif; ?>
        <div class="row g-3 mb-3"><div class="col-6"><label>Urutan</label><input type="number" class="form-control" name="urutan" value="<?php echo e(old('urutan', $edit->urutan ?? $rows->count() + 1)); ?>"></div>
        <div class="col-6 d-flex align-items-end"><div class="form-check mb-2"><input class="form-check-input" type="checkbox" name="aktif" id="aktif" value="1" <?php if(session()->hasOldInput() ? old('aktif') : ($edit->aktif ?? true)): echo 'checked'; endif; ?>><label class="form-check-label" for="aktif">Aktif</label></div></div></div>
        <button class="btn btn-primary"><?php echo e($edit ? 'Simpan Perubahan' : 'Tambah Menu'); ?></button>
        <?php if($edit): ?><a href="<?php echo e(route('admin.menu.index', $jenis)); ?>" class="btn btn-light border">Batal</a><?php endif; ?>
      </form>
    </div></div>
  </div>
</div>
<div id="pnToast" class="pn-toast"></div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
<script src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.2/Sortable.min.js"></script>
<script>
(function(){
  var root=document.querySelector('#menuTree > .tree-list'); if(!root||!window.Sortable) return;
  var csrf=<?php echo json_encode(csrf_token(), 15, 512) ?>, url=<?php echo json_encode(route('admin.menu.reorder', $jenis), 512) ?>, toastEl=document.getElementById('pnToast'), tm;
  function toast(msg,ok){toastEl.textContent=msg;toastEl.className='pn-toast show '+(ok?'ok':'err');clearTimeout(tm);tm=setTimeout(function(){toastEl.className='pn-toast'},2200);}
  function sub(li){return li.querySelector(':scope > .tree-list');}
  function ser(ul){return Array.prototype.filter.call(ul.children,function(l){return l.tagName==='LI'}).map(function(l){return {id:+l.dataset.id,children:ser(sub(l))}});}
  function relevel(ul,lv){Array.prototype.forEach.call(ul.children,function(l){
    if(l.tagName!=='LI') return;
    var row=l.querySelector(':scope > .tree-row'); row.className='tree-row lv'+Math.min(lv,1);
    row.querySelector('.t').style.setProperty('--lv',lv);
    row.querySelector('.ti').className='bi ti '+(lv?'bi-arrow-return-right':'bi-grip-vertical');
    relevel(sub(l),lv+1);});}
  function save(){
    document.body.classList.remove('dragging'); relevel(root,0);
    fetch(url,{method:'POST',headers:{'Content-Type':'application/x-www-form-urlencoded','Accept':'application/json','X-CSRF-TOKEN':csrf},body:new URLSearchParams({tree:JSON.stringify(ser(root))})})
      .then(function(r){return r.json()})
      .then(function(j){ if(j.ok) toast('Urutan menu tersimpan',true); else {toast('Gagal menyimpan, memuat ulang…',false); setTimeout(function(){location.reload()},1200);} })
      .catch(function(){toast('Gagal menyimpan, memuat ulang…',false); setTimeout(function(){location.reload()},1200);});
  }
  var FLAT=<?php echo json_encode($flat, 15, 512) ?>;
  (FLAT?[root]:document.querySelectorAll('#menuTree .tree-list')).forEach(function(ul){
    new Sortable(ul,{group:'menu',animation:150,fallbackOnBody:true,swapThreshold:.65,emptyInsertThreshold:14,filter:'.act',preventOnFilter:false,delay:120,delayOnTouchOnly:true,ghostClass:'sortable-ghost',onStart:function(){document.body.classList.add('dragging')},onEnd:save});
  });
})();
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\laragon\www\diskominfo\resources\views/admin/menus.blade.php ENDPATH**/ ?>