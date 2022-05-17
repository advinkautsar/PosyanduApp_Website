<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Orangtua extends Model
{
    use HasFactory;
    protected $table = "orangtua";
     protected $fillable = [
        'nik_ayah',
        'nama_ayah',
        'nik_ibu',
        'nama_ibu',
        'alamat',
        'rt',
        'rw',
        'status_persetujuan',
        'user_id',
        'posyandu_id',
        'desa_kelurahan_id',
        'kecamatan_id',
    ];

    public function user()
    {
    	return $this->belongsTo(User::class);
    }
    public function posyandu()
    {
    	return $this->belongsTo(Posyandu::class);
    }
    public function kecamatan()
    {
    	return $this->belongsTo(Kecamatan::class);
    }
    public function desa_kelurahan()
    {
    	return $this->belongsTo(Desa_kelurahan::class);
    }
    public function anaks()
    {
        return $this->hasMany(Anak::class);
    }
}
