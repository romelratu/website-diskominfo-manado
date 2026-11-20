# Sistem Informasi DISKOMINFO Kota Manado (Laravel)

Port dari proyek PHP native (`system-informasi` v17) ke **Laravel 13** (PHP 8.4.1+). Seluruh fitur dipertahankan.

## Fitur

**Website publik**
- Beranda: slider Berita Utama, Berita Terbaru, Layanan Informasi, Tentang Kami
- Berita (daftar + detail), Halaman dinamis (`/halaman/{slug}`), Profil Instansi, Tentang Kami, Kontak
- Navbar dari Menu Manager (submenu bertingkat), footer 4 kolom, statistik pengunjung otomatis

**Panel admin (`/admin`)**
- Dashboard (statistik + grafik 7 hari), CRUD Berita dengan editor rich-text & cover, Berita Utama
- Kategori, Konten (Dokumen, Halaman, Pengumuman, Slider, Sumber)
- Menu Manager drag & drop (Menu Utama, Menu Footer, Layanan Informasi)
- Pengaturan situs dan Manajemen Pengguna (khusus admin; peran: `admin`, `operator`)

**REST API (`/api?resource=...`)** — sama dengan API lama: `login`, `me`, `articles`, `categories`, `users`, `featured`, `stats` (token Bearer).

## Asisten Virtual (tombol "AI")

Tombol "AI" melayang di semua halaman publik. Pengunjung bisa bertanya seputar berita, halaman, layanan informasi, dan kontak. Asisten **hanya menjawab dari konten yang sudah tampil di situs publik** (draft tidak ikut) dan selalu menampilkan tautan sumber.

| Mode | Syarat | Cara kerja |
|---|---|---|
| Pencarian konten | tanpa kunci API (bawaan, gratis) | menampilkan cuplikan halaman paling relevan |

- Aktif/nonaktif: **Admin → Pengaturan → Asisten virtual**.
- Pembatasan per IP: `AI_PER_MINUTE` (8) dan `AI_PER_DAY` (60) pesan, untuk mencegah penyalahgunaan dan biaya membengkak.
- Jika API gagal atau kunci kosong, asisten otomatis memakai mode pencarian.
- Percakapan **tidak disimpan** di server. Pengunjung diingatkan untuk tidak mengirim data pribadi.
- Kode: `app/Services/SiteAssistant.php`, `app/Http/Controllers/ChatController.php`, `public/assets/js/ai.js`.

## Instalasi

```bash
composer install
cp .env.example .env
php artisan key:generate
```

1. Buat database MySQL kosong `db_diskominfo_manado` (atau ubah `DB_*` di `.env`).
2. Jalankan:

```bash
php artisan migrate --seed
php artisan storage:link        # agar gambar/berkas unggahan dapat diakses
php artisan serve               # http://127.0.0.1:8000
```

Admin: **http://127.0.0.1:8000/login** — username `admin`, password `password` (**segera ganti** setelah login pertama).

> Tanpa MySQL: set `DB_CONNECTION=sqlite` di `.env`, hapus baris `DB_HOST` s/d `DB_PASSWORD`, lalu `touch database/database.sqlite`.

## Migrasi data dari versi PHP native

Struktur tabel (`users`, `categories`, `articles`, `menus`, `contents`, `settings`, `visit_log`) mengikuti versi lama; migrasi hanya menambahkan kolom `updated_at` / `remember_token` bila tabel sudah ada, sehingga database lama dapat dipakai langsung (impor `database.sql` lama lebih dulu, lalu `php artisan migrate`). Gambar lama berpola `assets/uploads/...` tetap tampil bila foldernya disalin ke `public/assets/uploads/`. Kata sandi yang sudah di-hash dengan `password_hash` (bcrypt) tetap berlaku.

## Keamanan

- CSRF di semua form, pembatasan percobaan login, hapus data via metode `DELETE` (bukan tautan GET).
- HTML dari editor dibersihkan dengan sanitizer berbasis DOM (atribut seperti `onclick`/`onerror` dan URL `javascript:` dibuang).
- Kunci API AI hanya ada di server (`.env`), tidak pernah dikirim ke browser; teks jawaban ditampilkan sebagai teks biasa (bukan HTML).
- Token API ditandatangani dengan `API_TOKEN_SECRET` (atau `APP_KEY` bila kosong) — set nilai unik di produksi.

## Pengujian

```bash
php artisan test
```

## Hosting / Produksi

Lihat **[PANDUAN-HOSTING.md](PANDUAN-HOSTING.md)** (cPanel & VPS), template `.env.production.example`, dan skrip `deploy.sh`.
Ringkas: `APP_ENV=production`, `APP_DEBUG=false`, document root ke folder `public`, isi `ADMIN_PASSWORD` (atau catat password acak yang ditampilkan saat `migrate --seed`), lalu `php artisan config:cache route:cache view:cache`.
