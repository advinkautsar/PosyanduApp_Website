<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Imunisasi extends Model
{
    use HasFactory;
    protected $table = "imunisasi";
    protected $fillable = ['waktu_imunisasi','jenis_imunisasi','token'];


    public function pemeriksaan()
    {
        return $this->hasOne(Pemeriksaan::class);
    }
}
