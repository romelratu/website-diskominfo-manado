<?php

namespace App\Http\Controllers;

use App\Models\Content;
use App\Models\Setting;

class PageController extends Controller
{
    /** Halaman dinamis dari admin > Konten > Halaman (alamat: /halaman/{slug}). */
    public function show(string $slug)
    {
        $slug = preg_replace('/[^a-z0-9\-]/', '', strtolower($slug));
        // Cocokkan persis dulu; toleransi perbedaan kata "dan" (visi-misi = visi-dan-misi).
        $loose = str_replace('-dan-', '-', $slug);

        $row = Content::ofType('halaman')->published()
            ->where(fn ($q) => $q->where('slug', $slug)->orWhereRaw("REPLACE(slug, '-dan-', '-') = ?", [$loose]))
            ->orderByRaw('CASE WHEN slug = ? THEN 0 ELSE 1 END', [$slug])
            ->orderByDesc('id')
            ->first();

        return response()->view('public.page', [
            'row' => $row,
            'judul' => $row->judul ?? 'Halaman',
        ], $row ? 200 : 404);
    }

    public function profil()
    {
        $row = Content::ofType('halaman')->published()->whereIn('slug', ['profil-instansi', 'profil'])
            ->orderByRaw("CASE WHEN slug = 'profil-instansi' THEN 0 ELSE 1 END")->orderByDesc('id')->first();

        return view('public.profil', ['row' => $row, 'judul' => $row->judul ?? 'Profil Instansi']);
    }

    public function tentang()
    {
        $row = Content::ofType('halaman')->published()->where('slug', 'tentang-kami')->orderByDesc('id')->first();

        return view('public.tentang', ['row' => $row, 'judul' => $row->judul ?? 'Tentang Kami']);
    }

    public function kontak()
    {
        $set = Setting::allKeyed();

        return view('public.kontak', [
            'alamat' => ($set['alamat'] ?? '') ?: 'Jl. Balai Kota No. 1. Kota Manado, Provinsi Sulawesi Utara',
            'email' => ($set['email'] ?? '') ?: 'diskominfo@manadokota.go.id',
            'telepon' => $set['telepon'] ?? '',
            'fax' => $set['fax'] ?? '',
        ]);
    }
}
