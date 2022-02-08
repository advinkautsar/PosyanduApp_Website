<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = "user";
    protected $fillable = [
        'nama_pengguna',
        'kata_sandi',
        'no_hp',
        'role',
        'token',
    ];

    public function orangtua()
    {
        return $this->hasOne(Orangtua::class);
    }
    public function bidan()
    {
        return $this->hasOne(Bidan::class);
    }
    public function kader()
    {
        return $this->hasOne(Kader::class);
    }
    public function petugas_desa()
    {
        return $this->hasOne(Petugas_desa::class);
    }
    public function petugas_puskesmas()
    {
        return $this->hasOne(Petugas_puskesmas::class);
    }

}
