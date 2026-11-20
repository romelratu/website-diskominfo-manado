@php
  $tel = ($site['telepon'] ?? '') ?: '(0431) 867052';
  $mail = ($site['email'] ?? '') ?: 'diskominfo@manadokota.go.id';
  $addr = ($site['alamat'] ?? '') ?: 'Jl. Balai Kota No.1, Manado';
@endphp
<footer class="pt-foot">
  <div class="pt-wrap pt-fg">
    <div><a class="pt-brand" style="color:#fff" href="{{ route('home') }}"><img src="{{ asset('assets/logo-header.png') }}" alt="Logo"><span>Diskominfo<br>Kota Manado</span></a>
      <p class="mt-3">Dinas Komunikasi dan Informatika Kota Manado, selalu berkomitmen memberikan informasi terbaik untuk masyarakat.</p></div>
    <div><h4>Kontak Kami</h4><p><i class="bi bi-telephone-fill me-2"></i>{{ $tel }}</p><p><i class="bi bi-envelope-fill me-2"></i>{{ $mail }}</p><p><i class="bi bi-geo-alt-fill me-2"></i>{{ $addr }}</p></div>
    <div><h4>Tautan Cepat</h4>
      <a href="{{ route('profil') }}">› Profil</a><a href="{{ route('tentang') }}">› Tentang Kami</a><a href="{{ route('berita.index') }}">› Layanan Informasi</a><a href="{{ route('berita.index') }}">› Berita</a></div>
    <div><h4>Ikuti Kami</h4><div class="soc"><a href="#" aria-label="Facebook"><i class="bi bi-facebook"></i></a><a href="#" aria-label="YouTube"><i class="bi bi-youtube"></i></a><a href="#" aria-label="Instagram"><i class="bi bi-instagram"></i></a><a href="#" aria-label="X"><i class="bi bi-twitter-x"></i></a></div></div>
  </div>
  <div class="pt-copy"><span>© {{ date('Y') }} Dinas Komunikasi dan Informatika Kota Manado. All Rights Reserved.</span><span>Manado, Sulawesi Utara</span></div>
</footer>
