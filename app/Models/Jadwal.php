<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jadwal extends Model
{
    use HasFactory;
    protected $table = "jadwal";
    

    public function posyandu()
    {
    	return $this->belongsTo(Posyandu::class);
    }
    public function kader()
    {
    	return $this->belongsTo(Kader::class);
    }
}
