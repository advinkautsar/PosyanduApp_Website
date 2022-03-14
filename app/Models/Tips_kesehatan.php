<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tips_kesehatan extends Model
{
    use HasFactory;
    protected $table = "tips_kesehatan";
     protected $fillable = [
        'bidan_id',
        'judul_tips',
        'gambar_tips',
        'keterangan',
    ];

    public function bidan()
    {
    	return $this->belongsTo(Bidan::class);
    }
}
