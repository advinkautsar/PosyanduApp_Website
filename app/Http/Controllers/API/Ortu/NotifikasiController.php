<?php

namespace App\Http\Controllers\API\Ortu;

use App\Http\Controllers\Controller;
use App\Models\Imunisasi;
use App\Models\Jadwal;
use Illuminate\Http\Request;

class NotifikasiController extends Controller
{
    //
    public function index(){
        $jadwal = Jadwal::all();
        $imunisasi = Imunisasi::all();

        $collection = collect($jadwal);
        $zippediteraray = $collection->zip($imunisasi);
        $zippediteraray->toArray();


        if($jadwal&&$imunisasi){
            return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $zippediteraray,
                // 'data2'=>$imunisasi
            ], 200);
        } else {
            return response()->json([
                'status'    => 'failed',
                'message'   => 'Data tidak tersedia',
                'data'      => []
            ], 404);
        }

    }
}
