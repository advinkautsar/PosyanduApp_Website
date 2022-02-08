<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rujukan extends Model
{
    use HasFactory;
    protected $table = "rujukan";

    public function anak()
    {
    	return $this->belongsTo(Anak::class);
    }
    public function bidan()
    {
    	return $this->belongsTo(Bidan::class);
    }
    public function puskesmas()
    {
    	return $this->belongsTo(Puskesmas::class);
    }
}
