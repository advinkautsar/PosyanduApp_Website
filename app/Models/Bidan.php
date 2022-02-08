<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bidan extends Model
{
    use HasFactory;
    protected $table = "bidan";

    public function user()
    {
    	return $this->belongsTo(User::class);
    }
    public function posyandu()
    {
    	return $this->belongsTo(Posyandu::class);
    }
    public function puskesmas()
    {
    	return $this->belongsTo(Puskesmas::class);
    }
    public function tips_kesehatans()
    {
        return $this->hasMany(Tips_kesehatan::class);
    }
    public function rujukans()
    {
        return $this->hasMany(Rujukan::class);
    }
    public function pemeriksaans()
    {
        return $this->hasMany(Pemeriksaan::class);
    }
}
