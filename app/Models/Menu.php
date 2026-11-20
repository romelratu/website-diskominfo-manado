<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Menu extends Model
{
    public $timestamps = false;

    protected $fillable = ['jenis', 'ikon', 'parent_id', 'title', 'url', 'urutan', 'aktif'];

    protected function casts(): array
    {
        return ['aktif' => 'boolean', 'urutan' => 'integer'];
    }

    public const JENIS = [
        'utama' => 'Menu Utama',
        'footer' => 'Menu Footer',
        'layanan' => 'Layanan Informasi',
    ];

    /** Ikon yang dapat dipilih untuk "Layanan Informasi" (kelas Bootstrap Icons => label). */
    public const IKON = [
        'bi-file-earmark-text' => 'Dokumen', 'bi-newspaper' => 'Berita', 'bi-broadcast' => 'Siaran',
        'bi-building' => 'Gedung', 'bi-headset' => 'Layanan', 'bi-info-circle' => 'Informasi',
        'bi-megaphone' => 'Pengumuman', 'bi-folder2-open' => 'Folder', 'bi-people' => 'Orang',
        'bi-globe2' => 'Web', 'bi-telephone' => 'Telepon', 'bi-envelope' => 'Surel',
        'bi-calendar-event' => 'Agenda', 'bi-shield-check' => 'Keamanan',
        'bi-bar-chart-line' => 'Data', 'bi-link-45deg' => 'Tautan',
        'bi-geo-alt' => 'Lokasi',
    ];

    public function children(): HasMany
    {
        return $this->hasMany(Menu::class, 'parent_id')->orderBy('urutan')->orderBy('id');
    }

    /**
     * Kelompokkan baris menu menjadi [parent_id => [menu, ...]] (akar memakai kunci 0).
     *
     * @param  iterable<Menu>  $rows
     * @return array<int, array<int, Menu>>
     */
    public static function groupByParent(iterable $rows): array
    {
        $by = [];
        foreach ($rows as $m) {
            $by[(int) $m->parent_id][] = $m;
        }

        return $by;
    }

    /** @return array<int, int> id seluruh turunan dari $id */
    public static function descendantIds(array $by, int $id): array
    {
        $ids = [];
        foreach ($by[$id] ?? [] as $c) {
            $ids[] = (int) $c->id;
            $ids = array_merge($ids, static::descendantIds($by, (int) $c->id));
        }

        return $ids;
    }
}
