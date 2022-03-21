<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jadwal_Imunisasi extends Model
{
    use HasFactory;
    protected $table = "jadwal_imunisasi";
    protected $fillable = [
        'id',
        'bidan_id',
        'nik_anak',
        'imunisasi_id',
        'tanggal_imunisasi',
    ];

    public function bidan()
    {
    	return $this->belongsTo(Bidan::class);
    }
     public function anak()
    {
    	return $this->belongsTo(Anak::class);
    }
     public function imunisasi()
    {
    	return $this->belongsTo(Imunisasi::class);
    }
}
