<?php $__env->startSection('title', $judul.' - Pemerintah Kota Manado'); ?>

<?php $__env->startSection('content'); ?>
<main class="inner-page">
  <?php if (isset($component)) { $__componentOriginalb00c7f6baf7ea834a0251f4153d10b8b = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalb00c7f6baf7ea834a0251f4153d10b8b = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.page-banner','data' => ['title' => $judul,'crumbs' => [['Halaman', null], [$judul, null]]]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page-banner'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($judul),'crumbs' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute([['Halaman', null], [$judul, null]])]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginalb00c7f6baf7ea834a0251f4153d10b8b)): ?>
<?php $attributes = $__attributesOriginalb00c7f6baf7ea834a0251f4153d10b8b; ?>
<?php unset($__attributesOriginalb00c7f6baf7ea834a0251f4153d10b8b); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalb00c7f6baf7ea834a0251f4153d10b8b)): ?>
<?php $component = $__componentOriginalb00c7f6baf7ea834a0251f4153d10b8b; ?>
<?php unset($__componentOriginalb00c7f6baf7ea834a0251f4153d10b8b); ?>
<?php endif; ?>
  <div class="container inner-container">
    <div class="top-grid">
      <div class="panel">
        <div class="panel-title"><?php echo e($row ? $judul : 'Halaman Tidak Ditemukan'); ?></div>
        <div class="panel-body">
          <?php if($row): ?>
            <div class="article-content"><?php echo $row->isi; ?></div>
          <?php else: ?>
            <p><strong>Halaman belum tersedia.</strong></p>
            <p>Konten untuk halaman ini belum dipublikasikan. Silakan kembali lagi nanti.</p>
          <?php endif; ?>
        </div>
      </div>
      <?php echo $__env->make('partials.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    </div>
  </div>
</main>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\laragon\www\diskominfo\resources\views/public/page.blade.php ENDPATH**/ ?>