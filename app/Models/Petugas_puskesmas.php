<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Petugas_puskesmas extends Model
{
    use HasFactory;
    protected $table = "petugas_puskesmas";
     protected $fillable = [
        'nama',
        'alamat',
        'user_id',
        'puskesmas_id',
    ];

    public function puskesmas()
    {
    	return $this->belongsTo(Puskesmas::class);
    }
    public function user()
    {
    	return $this->belongsTo(User::class);
    }
}
