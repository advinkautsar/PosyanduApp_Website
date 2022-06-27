<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Penimbangan;

class GrafikController extends Controller
{
    public function bb_pb($nik)
    {
        $data = Penimbangan::where('nik_anak', $nik)->get();
        return view('grafik.bb_pb');
    }

}
