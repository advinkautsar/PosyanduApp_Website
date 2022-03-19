<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Anak extends Model
{
    use HasFactory;
    protected $table = "anak";
    protected $fillable = [
        'orangtua_id',
        'no_kartu',
        'nama_anak',
        'jenis_kelamin',
        'tanggal_lahir',
        'berat_lahir',
        'panjang_lahir',
    ];

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
    public function jadwal_imunisasis()
    {
        return $this->hasMany(Jadwal_Imunisasi::class);
    }

}
