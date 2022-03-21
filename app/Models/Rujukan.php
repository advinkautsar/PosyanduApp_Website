<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rujukan extends Model
{
    use HasFactory;
    protected $table = "rujukan";
     protected $fillable = [
        'nik_anak',
        'bidan_id',
        'puskesmas_id',
        'tanggal_rujukan',
        'keluhan_anak',
        'tempat_pelayanan',
    ];

    public function anak()
    {
    	return $this->belongsTo(Anak::class,'nik_anak');
    }
    public function bidan()
    {
    	return $this->belongsTo(Bidan::class,'bidan_id');
    }
    public function puskesmas()
    {
    	return $this->belongsTo(Puskesmas::class,'puskesmas_id');
    }
    public function posyandu()
    {
    	return $this->belongsTo(Posyandu::class,'tempat_pelayanan');
    }
}
