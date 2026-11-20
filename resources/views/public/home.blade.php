@extends('layouts.public')
@section('title', 'Beranda - DISKOMINFO Kota Manado')

@section('content')
@php $feat = $slides->first(); $side = $latest->take(3);  @endphp
@php
  $heroImgs = $bg->filter()->values();
  if ($heroImgs->isEmpty() && file_exists(public_path('assets/login-bg.jpg'))) { $heroImgs = collect([asset('assets/login-bg.jpg')]); }
@endphp
<div class="pt-wrap pt-herowrap">
<section class="hs" id="heroSlider" aria-label="Sorotan">
  <div class="hs-bgs">@foreach($heroImgs as $img)<i @if($loop->first) class="on" @endif style="background-image:url('{{ $img }}')"></i>@endforeach</div>
  <div class="hs-shade"></div><div class="hs-stripe a"></div><div class="hs-stripe b"></div>
  <div class="hs-text">
    <h1>Sistem Informasi <b>DISKOMINFO<br>Kota Manado</b></h1>
    <p>Akses Informasi Lebih Mudah,<br>Untuk Manado yang Lebih Maju</p>
  </div>
  <div class="hs-logo"><span>Manado<br>Maju</span><svg viewBox="0 0 60 60" width="64" height="64" fill="#fff" aria-hidden="true"><path d="M8 54C10 30 26 10 54 6c-8 10-12 18-14 26 6-6 11-9 16-10-4 12-14 22-30 26 6 0 11-1 14-3-6 8-18 11-32 9z"/></svg></div>
  @if($heroImgs->count() > 1)
  <button class="hs-arw prev" type="button" aria-label="Sebelumnya"><i class="bi bi-chevron-left"></i></button>
  <button class="hs-arw next" type="button" aria-label="Berikutnya"><i class="bi bi-chevron-right"></i></button>
  <div class="hs-dots">@foreach($heroImgs as $img)<button type="button" aria-label="Slide {{ $loop->iteration }}" @if($loop->first) class="on" @endif></button>@endforeach</div>
  @endif
</section>
</div>

<div class="pt-wrap">
  <section class="pt-news">
    @if($slides->isNotEmpty())
    <div class="pt-slider" id="beritaSlider" role="region" aria-roledescription="carousel" aria-label="Berita Utama">
      <div class="pt-track">
        @foreach($slides as $s)
        <article class="pt-slide" @if($s->image_url) style="background-image:url('{{ $s->image_url }}')" @endif aria-hidden="{{ $loop->first ? 'false' : 'true' }}">
          <div><span class="pt-tag">{{ $loop->first ? 'Berita Utama' : ($s->category->nama ?? 'Berita') }}</span>
            <h3><a href="{{ route('berita.show', $s->slug) }}">{{ $s->title }}</a></h3>
            <small><span><i class="bi bi-calendar3"></i> {{ $s->created_at->translatedFormat('d F Y') }}</span><a href="{{ route('berita.show', $s->slug) }}">Baca Selengkapnya <i class="bi bi-arrow-right"></i></a></small></div>
        </article>
        @endforeach
      </div>
      @if($slides->count() > 1)
      <button class="pt-arw prev" type="button" aria-label="Sebelumnya"><i class="bi bi-chevron-left"></i></button>
      <button class="pt-arw next" type="button" aria-label="Berikutnya"><i class="bi bi-chevron-right"></i></button>
      <div class="pt-sdots">@foreach($slides as $s)<button type="button" aria-label="Berita {{ $loop->iteration }}" @if($loop->first) class="on" @endif></button>@endforeach</div>
      @endif
    </div>
    @endif
    <div>
      <div class="pt-sec"><h2>Berita Terbaru</h2><a href="{{ route('berita.index') }}">Lihat Semua <i class="bi bi-arrow-right"></i></a></div>
      @foreach($side as $a)
        <article class="pt-item">
          @if($a->image_url)<img src="{{ $a->image_url }}" alt="" loading="lazy">@else<div class="ph"></div>@endif
          <div><h3><a href="{{ route('berita.show', $a->slug) }}">{{ $a->title }}</a></h3><small><i class="bi bi-calendar3"></i> {{ $a->created_at->translatedFormat('d F Y') }}</small></div>
        </article>
      @endforeach
      @if($side->isEmpty())<p class="text-muted">Belum ada berita terbaru.</p>@endif
    </div>
  </section>

  <div class="pt-sec"><h2>Layanan Informasi</h2><a href="{{ route('berita.index') }}">Lihat Semua <i class="bi bi-arrow-right"></i></a></div>
  <section class="pt-svc">
  @foreach($services as $it)
    <a href="{{ \App\Support\MenuLink::href($it->url) }}" @if(preg_match('#^https?://#i', (string) $it->url)) target="_blank" rel="noopener noreferrer" @endif><i class="bi {{ preg_match('/^bi-[a-z0-9-]+$/', (string) $it->ikon) ? $it->ikon : 'bi-file-earmark-text' }}"></i>{{ $it->title }}</a>
  @endforeach
</section>
</div>
@endsection

@push('scripts')
<script>
(function(){
  var r=document.getElementById('heroSlider'); if(!r) return;
  var im=r.querySelectorAll('.hs-bgs i'), ds=r.querySelectorAll('.hs-dots button'), n=im.length, i=0, tm;
  if(n<2) return;
  function go(k){ i=(k+n)%n; im.forEach(function(e,j){e.classList.toggle('on',j===i);}); ds.forEach(function(e,j){e.classList.toggle('on',j===i);}); }
  function play(){ clearInterval(tm); if(!matchMedia('(prefers-reduced-motion:reduce)').matches) tm=setInterval(function(){go(i+1);},6000); }
  r.querySelector('.prev').onclick=function(){go(i-1);play();};
  r.querySelector('.next').onclick=function(){go(i+1);play();};
  ds.forEach(function(d,j){d.onclick=function(){go(j);play();};});
  play();
})();
</script>
<script>
(function(){
  var r=document.getElementById('beritaSlider'); if(!r) return;
  var t=r.querySelector('.pt-track'), sl=r.querySelectorAll('.pt-slide'), dots=r.querySelectorAll('.pt-sdots button'), i=0, n=sl.length, timer, x0=null;
  function go(k){ i=(k+n)%n; t.style.transform='translateX(-'+(i*100)+'%)';
    sl.forEach(function(e,j){e.setAttribute('aria-hidden',j===i?'false':'true');});
    dots.forEach(function(d,j){d.classList.toggle('on',j===i);}); }
  function play(){ stop(); if(n>1 && !matchMedia('(prefers-reduced-motion:reduce)').matches) timer=setInterval(function(){go(i+1);},5000); }
  function stop(){ clearInterval(timer); }
  var p=r.querySelector('.prev'), q=r.querySelector('.next');
  if(p) p.addEventListener('click',function(){go(i-1);play();});
  if(q) q.addEventListener('click',function(){go(i+1);play();});
  dots.forEach(function(d,j){d.addEventListener('click',function(){go(j);play();});});
  r.addEventListener('mouseenter',stop); r.addEventListener('mouseleave',play);
  r.addEventListener('touchstart',function(e){x0=e.touches[0].clientX;stop();},{passive:true});
  r.addEventListener('touchend',function(e){ if(x0!==null){var d=e.changedTouches[0].clientX-x0; if(Math.abs(d)>40) go(i+(d<0?1:-1)); x0=null;} play(); });
  r.setAttribute('tabindex','0');
  r.addEventListener('keydown',function(e){ if(e.key==='ArrowLeft') go(i-1); if(e.key==='ArrowRight') go(i+1); });
  play();
})();
</script>
@endpush
