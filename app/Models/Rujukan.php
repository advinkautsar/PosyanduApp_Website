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
    	return $this->belongsTo(Anak::class);
    }
    public function bidan()
    {
    	return $this->belongsTo(Bidan::class);
    }
    public function puskesmas()
    {
    	return $this->belongsTo(Puskesmas::class);
    }
    public function posyandu()
    {
    	return $this->belongsTo(Posyandu::class);
    }
}
