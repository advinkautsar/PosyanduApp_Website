<?php

namespace App\Http\Controllers\API\Anak;

use Carbon\Carbon;
use App\Models\Anak;
use App\Models\Orangtua;
use App\Models\Pemeriksaan;
use App\Models\Penimbangan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

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
        $anak = DB::table('anak')        
            ->leftJoin('orangtua','anak.orangtua_id','orangtua.id')
            ->select('anak.*', 'orangtua.nama_ibu')
            ->where('nik_anak', $id)
            ->first();
    
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
        // $anak = Pemeriksaan::where('nik_anak',$id)->get();
        $anak = DB::table('pemeriksaan')
            ->leftJoin('anak','pemeriksaan.nik_anak','anak.nik_anak')
            ->leftJoin('imunisasi','pemeriksaan.imunisasi_id_1','imunisasi.id')
            ->leftJoin('imunisasi as imunisasi2','pemeriksaan.imunisasi_id_2','imunisasi2.id')
            ->leftJoin('imunisasi as imunisasi3','pemeriksaan.imunisasi_id_3','imunisasi3.id')
            ->select('pemeriksaan.tanggal_pemeriksaan','imunisasi.jenis_imunisasi as imun1','imunisasi2.jenis_imunisasi as imun2',
            'imunisasi3.jenis_imunisasi as imun3','pemeriksaan.nik_anak','pemeriksaan.id')
            ->where('pemeriksaan.nik_anak', $id)->orderBy('id','DESC')
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

    public function showstatusgizi($id)
    {
        $anak = Penimbangan::where('nik_anak',$id)
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

}
