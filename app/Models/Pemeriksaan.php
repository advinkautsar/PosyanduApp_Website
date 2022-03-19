<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pemeriksaan extends Model
{
    use HasFactory;
    protected $table = "pemeriksaan";
     protected $fillable = [
        'bidan_id',
        'nik_anak',
        'imunisasi_id_1',
        'imunisasi_id_2',
        'imunisasi_id_3',
        'vitA_merah',
        'vitA_biru',
        'Fe_1',
        'Fe_2',
        'PMT',
        'asi_ekslusif',
        'oralit',
        'obat_cacing',

    ];

    public function anak()
    {
    	return $this->belongsTo(Anak::class);
    }
    public function bidan()
    {
    	return $this->belongsTo(Bidan::class);
    }
    public function imunisasi()
    {
    	return $this->belongsTo(Imunisasi::class);
    }

}
