<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Anak extends Model
{
    use HasFactory;
    protected $table = "anak";

    public function orangtua()
    {
    	return $this->belongsTo(Orangtua::class);
    }
    public function rujukans()
    {
        return $this->hasMany(Rujukan::class);
    }
    public function pemeriksaans()
    {
        return $this->hasMany(Pemeriksaan::class);
    }
    public function penimbangans()
    {
        return $this->hasMany(Penimbangan::class);
    }

}
