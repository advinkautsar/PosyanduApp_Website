<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tips_kesehatan extends Model
{
    use HasFactory;
    protected $table = "tips_kesehatan";

    public function bidan()
    {
    	return $this->belongsTo(Bidan::class);
    }
}
