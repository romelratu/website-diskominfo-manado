<ul class="tree-list">
<?php $__currentLoopData = $by[$pid] ?? []; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $r): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
  <?php $id = (int) $r->id; ?>
  <li data-id="<?php echo e($id); ?>"><div class="tree-row lv<?php echo e(min($lv, 1)); ?>">
    <div class="t" style="--lv:<?php echo e($lv); ?>"><i class="bi <?php echo e($lv ? 'bi-arrow-return-right' : 'bi-grip-vertical'); ?> ti"></i><?php if(!empty($r->ikon) && preg_match('/^bi-[a-z0-9-]+$/', $r->ikon)): ?><i class="bi <?php echo e($r->ikon); ?> ico"></i><?php endif; ?><span class="<?php echo e($r->aktif ? '' : 'off'); ?>"><?php echo e($r->title); ?></span><?php if (! ($r->aktif)): ?><em class="tag">Nonaktif</em><?php endif; ?></div>
    <div class="u" title="<?php echo e($r->url); ?>"><?php echo e($r->url); ?></div>
    <div class="act">
      <a class="ic-btn" href="<?php echo e(route('admin.menu.index', [$jenis, 'edit' => $id])); ?>" title="Edit"><i class="bi bi-pencil"></i></a>
      <form method="post" action="<?php echo e(route('admin.menu.destroy', [$jenis, $r])); ?>" onsubmit="return confirm('Hapus menu ini beserta submenunya?')"><?php echo csrf_field(); ?> <?php echo method_field('DELETE'); ?><button class="ic-btn" title="Hapus"><i class="bi bi-trash"></i></button></form>
    </div>
  </div>
  <?php echo $__env->make('admin.partials.menu-tree', ['by' => $by, 'pid' => $id, 'lv' => $lv + 1, 'jenis' => $jenis], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
  </li>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
</ul>
<?php /**PATH D:\laragon\www\diskominfo\resources\views/admin/partials/menu-tree.blade.php ENDPATH**/ ?>