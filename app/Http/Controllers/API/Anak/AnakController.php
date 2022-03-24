<?php

namespace App\Http\Controllers\API\Anak;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Models\Anak;
use App\Models\Orangtua;
use App\Models\Pemeriksaan;
use App\Models\Penimbangan;
use Illuminate\Http\Request;

class AnakController extends Controller
{
    public function ReadAnakDariOrtu($id)
    {
        $anak = DB::table('anak')        
            ->leftJoin('orangtua','anak.orangtua_id','orangtua.id')
            ->join('posyandu', 'orangtua.posyandu_id', '=', 'orangtua.posyandu_id')
            ->select('anak.*', 'orangtua.nama_ibu','posyandu.nama_posyandu')
            ->where('orangtua_id', $id)
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

    public function show($id)
    {
        $anak = Anak::where('nik_anak',$id)->first();
    
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

    public function showimunisasi($id)
    {
        $anak = Pemeriksaan::where('nik_anak',$id)->get();

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

    public function showstatusgizi($id)
    {
        $anak = Penimbangan::where('nik_anak',$id)->get();
        
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

}
