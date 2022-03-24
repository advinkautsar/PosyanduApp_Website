<?php

namespace App\Http\Controllers;

use App\Models\Anak;
use App\Models\Orangtua;
use Illuminate\Http\Request;

class testcontroller extends Controller
{
    //
    public function listanak(Request $request){

        $anak = Anak::where('nama_anak', 'like', "%" . $request->anak . "%")
        ->get();
     
        if($anak){
            return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $anak
            ], 200);
        } else {
            return response()->json([
                'status'    => 'failed',
                'message'   => 'Data tidak tersedia',
                'data'      => []
            ], 404);
        }
    }

    public function searchListOrtu(Request $request){

        $ortu = Orangtua::where('nama_ibu', 'like', "%" . $request->orangtua . "%")
        ->get();
     
        if($ortu){
            return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $ortu
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
