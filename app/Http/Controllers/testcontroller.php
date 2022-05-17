<?php

namespace App\Http\Controllers;

use App\Models\Anak;
use App\Models\Orangtua;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class testcontroller extends Controller
{
    //
    public function listanak(Request $request){
                  
        $anak = DB::table('anak')        
            ->join('orangtua','anak.orangtua_id','orangtua.id')
            ->join('posyandu', 'orangtua.posyandu_id','=','posyandu.id')
            ->select('orangtua.nama_ibu','orangtua.status_persetujuan','posyandu.nama_posyandu','anak.*')
            ->where('status_persetujuan','=','disetujui')
            ->where('nama_anak', 'like', "%" . $request->anak . "%")
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

        // $ortu = Orangtua::where('nama_ibu', 'like', "%" . $request->orangtua . "%")
        // ->get();

        $ortu = DB::table('orangtua')
           ->join('posyandu','orangtua.posyandu_id','posyandu.id')
           ->select('posyandu.nama_posyandu','orangtua.*')
           ->where('nama_ibu', 'like', "%" . $request->orangtua . "%")
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

    public function searchListOrtuAprove(Request $request){

        // $ortu = Orangtua::where('nama_ibu', 'like', "%" . $request->orangtua . "%")
        // ->get();

        $ortu = DB::table('orangtua')
           ->join('posyandu','orangtua.posyandu_id','posyandu.id')
           ->select('posyandu.nama_posyandu','orangtua.*')
           ->where('status_persetujuan','=','disetujui')
           ->where('nama_ibu', 'like', "%" . $request->orangtua . "%")
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
