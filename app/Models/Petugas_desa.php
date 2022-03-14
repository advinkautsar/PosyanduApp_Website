<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Petugas_desa extends Model
{
    use HasFactory;
    protected $table = "petugas_desa";
     protected $fillable = [
        'nama',
        'alamat',
        'user_id',
        'desa_kelurahan_id',
    ];

    public function desa_kelurahan()
    {
    	return $this->belongsTo(Desa_Kelurahan::class);
    }
    public function user()
    {
    	return $this->belongsTo(User::class);
    }
}
