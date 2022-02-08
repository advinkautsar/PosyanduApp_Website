<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pemeriksaan extends Model
{
    use HasFactory;
    protected $table = "pemeriksaan";

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
