<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Imunisasi extends Model
{
    use HasFactory;
    protected $table = "imunisasi";


    public function pemeriksaan()
    {
        return $this->hasOne(Pemeriksaan::class);
    }
}
