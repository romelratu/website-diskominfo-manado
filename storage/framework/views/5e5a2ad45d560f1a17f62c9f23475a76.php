<?php $__env->startSection('title', 'Kelola Artikel'); ?>

<?php $__env->startSection('content'); ?>
<div class="d-flex justify-content-between align-items-start mb-3"><div><h2 class="h4 fw-bold mb-0">Kelola Artikel</h2><p class="text-muted mb-0">Tambah, edit dan kelola artikel berita</p></div><a href="<?php echo e(route('admin.artikel.create')); ?>" class="btn btn-primary"><i class="bi bi-plus-lg"></i> Tambah Artikel</a></div>
<div class="ad-card p-0 overflow-hidden"><div class="table-responsive"><table class="ad-tbl"><thead><tr><th>No</th><th>Judul Artikel</th><th>Kategori</th><th>Tanggal</th><th>Aksi</th></tr></thead><tbody>
<?php $__empty_1 = true; $__currentLoopData = $articles; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $a): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
  <tr>
    <td><?php echo e($articles->firstItem() + $loop->index); ?></td>
    <td><?php echo e($a->title); ?></td>
    <td><span class="ad-cat"><?php echo e($a->category->nama ?? '-'); ?></span></td>
    <td><?php echo e($a->created_at->translatedFormat('d M Y')); ?></td>
    <td class="text-nowrap"><a class="ad-ic e" href="<?php echo e(route('admin.artikel.edit', $a)); ?>" aria-label="Edit"><i class="bi bi-pencil-fill"></i></a>
      <form method="post" action="<?php echo e(route('admin.artikel.destroy', $a)); ?>" class="d-inline" onsubmit="return confirm('Hapus artikel ini?')"><?php echo csrf_field(); ?> <?php echo method_field('DELETE'); ?><button class="ad-ic d" aria-label="Hapus"><i class="bi bi-trash-fill"></i></button></form></td>
  </tr>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
  <tr><td colspan="5" class="text-center text-muted py-4">Belum ada artikel.</td></tr>
<?php endif; ?>
</tbody></table></div>
<div class="d-flex justify-content-between align-items-center p-3 small">
  <span>Menampilkan <?php echo e($articles->count() ? $articles->firstItem() : 0); ?>-<?php echo e($articles->count() ? $articles->lastItem() : 0); ?> dari <?php echo e($articles->total()); ?> data</span>
  <?php if($articles->hasPages()): ?><?php echo e($articles->links()); ?><?php endif; ?>
</div></div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\laragon\www\diskominfo\resources\views/admin/articles/index.blade.php ENDPATH**/ ?>