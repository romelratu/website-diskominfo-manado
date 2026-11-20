@extends('layouts.public')
@section('title', $judul.' - Pemerintah Kota Manado')

@section('content')
<main class="inner-page">
  <x-page-banner :title="$judul" :crumbs="[['Halaman', null], [$judul, null]]" />
  <div class="container inner-container">
    <div class="top-grid">
      <div class="panel">
        <div class="panel-title">{{ $row ? $judul : 'Halaman Tidak Ditemukan' }}</div>
        <div class="panel-body">
          @if($row)
            <div class="article-content">{!! $row->isi !!}</div>
          @else
            <p><strong>Halaman belum tersedia.</strong></p>
            <p>Konten untuk halaman ini belum dipublikasikan. Silakan kembali lagi nanti.</p>
          @endif
        </div>
      </div>
      @include('partials.sidebar')
    </div>
  </div>
</main>
@endsection
