<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Puskesmas extends Model
{
    use HasFactory;
    protected $table = "puskesmas";

    public function petugas_puskesmas()
    {
        return $this->hasMany(Petugas_puskesmas::class);
    }
    public function bidans()
    {
        return $this->hasMany(Bidan::class);
    }
    public function rujukans()
    {
        return $this->hasMany(Rujukan::class);
    }
    public function kecamatan()
    {
    	return $this->belongsTo(Kecamatan::class);
    }
}
