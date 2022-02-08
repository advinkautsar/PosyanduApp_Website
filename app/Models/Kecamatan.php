<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kecamatan extends Model
{
    use HasFactory;
    protected $table = "kecamatan";


    public function desa_kelurahans()
    {
        return $this->hasMany(Desa_Kelurahan::class);
    }
    public function orangtuas()
    {
        return $this->hasMany(Orangtua::class);
    }
    public function puskesmas()
    {
        return $this->hasMany(Puskesmas::class);
    }
}
