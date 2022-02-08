<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Desa_kelurahan extends Model
{
    use HasFactory;
    protected $table = "desa_kelurahan";

    public function kecamatan()
    {
    	return $this->belongsTo(Kecamatan::class);
    }
    public function petugas_desas()
    {
        return $this->hasMany(Petugas_desa::class);
    }
    public function posyandus()
    {
        return $this->hasMany(Posyandu::class);
    }
    public function orangtuas()
    {
        return $this->hasMany(Orangtua::class);
    }
}
