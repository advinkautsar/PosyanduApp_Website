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
        'tanggal_pemeriksaan',


    ];

    public function anak()
    {
    	return $this->belongsTo(Anak::class,'nik_anak');
    }
    public function bidan()
    {
    	return $this->belongsTo(Bidan::class,'bidan_id');
    }
    public function imunisasi1()
    {
    	return $this->belongsTo(Imunisasi::class,'imunisasi_id_1');
    }
    public function imunisasi2()
    {
    	return $this->belongsTo(Imunisasi::class,'imunisasi_id_2');
    }public function imunisasi3()
    {
    	return $this->belongsTo(Imunisasi::class,'imunisasi_id_3');
    }

}
