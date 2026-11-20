<?php

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote');

Artisan::command('menu:cek', function () {
    foreach (App\Models\Menu::where('jenis', 'layanan')->get(['id', 'title', 'url']) as $m) {
        $this->line($m->id.' | '.$m->title.' | '.$m->url);
    }
})->purpose('Cek menu layanan');
