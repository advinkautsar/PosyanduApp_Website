<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Anak;
use App\Models\Bidan;
use App\Models\Imunisasi;
use App\Models\Jadwal_Imunisasi;
use App\Models\Notif;
use App\Models\Orangtua;
use App\Models\Posyandu;
use App\Models\Puskesmas;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;

class ListController extends Controller
{
    //
    public function listanak(){

        $anak = Anak::all();
     
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

    public function listOrtu()
    {
        $ortu = Orangtua::all();

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

    public function listImunisasi()
    {
        $imunisasi = Imunisasi::all();

        if($imunisasi){
            return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $imunisasi
            ], 200);
        } else {
            return response()->json([
                'status'    => 'failed',
                'message'   => 'Data tidak tersedia',
                'data'      => []
            ], 404);
        }


    }

    public function listPuskesmas()
    {
        $pus = Puskesmas::all();

        if($pus){
            return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $pus
            ], 200);
        } else {
            return response()->json([
                'status'    => 'failed',
                'message'   => 'Data tidak tersedia',
                'data'      => []
            ], 404);
        }


    }

    public function listBidan()
    {
        $bidan = Bidan::all();

        if($bidan){
            return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $bidan
            ], 200);
        } else {
            return response()->json([
                'status'    => 'failed',
                'message'   => 'Data tidak tersedia',
                'data'      => []
            ], 404);
        }


    }

    public function create_imunisasi(Request $request){

        $imun = Jadwal_Imunisasi::create([

            // 'jenis_imunisasi'=>$request->jenis_imunisasi,
            // 'waktu_imunisasi'=>$request->waktu_imunisasi,
            'bidan_id'=>$request->bidan_id,
            'nik_anak'=>$request->nik_anak,
            'imunisasi_id'=>$request->imunisasi_id,
            'tanggal_imunisasi'=>$request->tanggal_imunisasi,

        ]);

        if ($imun) {
            $data = [
                'status' => true,
                'pesan' => "Berhasil Mendaftarkan Imunisasi"
            ];
            return response()->json($data);
        } else {
            $data = [
                'status' => true,
                'pesan' => "Gagal Mendaftarkan Imunisasi"
            ];
            return response()->json($data);
        }

    }

    public function test(){
   
        // $i= Imunisasi::get();
        // $tokenList = Arr::pluck($i, 'token');
        // $token = $i[0]->token;
     
  
        
        // // return $i[0]->waktu_imunisasi;
        // $notif = new Notif();
        // $notif->sendNotif($tokenList, $i[0]->jenis_imunisasi. "Pada waktu ".$i[0]->waktu_imunisasi, "Notifikasi Imunisasi" );
        // return "sukses";
    
    }

    public function status(){
        $array = array(array('status' => 'Ya'), array('status' => 'Tidak'));
 
    //    return $array;

        if($array){
            return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $array
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
