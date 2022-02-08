<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kader extends Model
{
    use HasFactory;
    protected $table = "kader";

    public function user()
    {
    	return $this->belongsTo(User::class);
    }
    public function posyandus()
    {
    	return $this->belongsTo(Posyandu::class);
    }
    public function jadwals()
    {
        return $this->hasMany(Jadwal::class);
    }
}
