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
        'status_bb_u',
        'status_tb_u',
        'status_lk_u',
        'status_bb_tb',
        'status_imt_u',
    ];

    public function anak()
    {
    	return $this->belongsTo(Anak::class);
    }
}
