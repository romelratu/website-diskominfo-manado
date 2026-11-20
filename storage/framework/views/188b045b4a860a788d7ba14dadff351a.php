<?php $__env->startSection('title', 'Dashboard'); ?>

<?php $__env->startSection('content'); ?>
<h2 class="h4 fw-bold mb-0">Dashboard</h2>
<p class="text-muted mb-3">Selamat datang, <?php echo e(explode(' ', trim($userName))[0] ?: 'Admin'); ?>!</p>
<div class="ad-stats">
  <div class="ad-stat s1"><i class="bi bi-file-earmark-text-fill"></i><div><small>Total Artikel</small><b><?php echo e($articleCount); ?></b><em>↑ 12%</em></div></div>
  <div class="ad-stat s2"><i class="bi bi-people-fill"></i><div><small>Total Pengguna</small><b><?php echo e($userCount); ?></b><em>↑ 8%</em></div></div>
  <div class="ad-stat s3"><i class="bi bi-info-circle-fill"></i><div><small>Total Layanan</small><b><?php echo e($serviceCount); ?></b><em>↑ 0%</em></div></div>
</div>
<div class="ad-grid">
  <section class="ad-card"><h3>Statistik Publikasi Artikel <span class="float-end small fw-normal text-muted">12 Bulan</span></h3>
    <div style="height:260px"><canvas id="newsChart"></canvas></div></section>
  <section class="ad-card"><h3>Aktivitas Terbaru</h3>
    <?php $__currentLoopData = $activity; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $a): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
      <div class="ad-act"><i class="bi <?php echo e($a['icon']); ?>"></i><div><p><?php echo e($a['text']); ?></p><small><?php echo e($a['when']); ?></small></div></div>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
  </section>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.4/dist/chart.umd.min.js"></script>
<script>
new Chart(document.getElementById('newsChart'),{type:'line',data:{labels:<?php echo json_encode($days, 15, 512) ?>,datasets:[{data:<?php echo json_encode($counts, 15, 512) ?>,borderColor:'#1b5fd8',backgroundColor:'rgba(27,95,216,.12)',fill:true,tension:.35,pointRadius:4,pointBackgroundColor:'#1b5fd8',borderWidth:2.5}]},options:{responsive:true,maintainAspectRatio:false,plugins:{legend:{display:false}},scales:{x:{grid:{display:false}},y:{beginAtZero:true,ticks:{precision:0},grid:{color:'#edf0f4'}}}}});
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\laragon\www\diskominfo\resources\views/admin/dashboard.blade.php ENDPATH**/ ?>