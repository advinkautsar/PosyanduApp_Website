<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Penimbangan extends Model
{
    use HasFactory;
    protected $table = "penimbangan";
     protected $fillable = [
        'nik_anak',
        'berat_badan',
        'tinggi_badan',
        'lingkar_kepala',
        'status_bb/u',
        'status_tb/u',
        'status_lk/u',
        'status_bb/tb',
        'status_imt/u',
    ];

    public function anak()
    {
    	return $this->belongsTo(Anak::class);
    }
}
