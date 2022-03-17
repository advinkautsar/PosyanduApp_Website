<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Anak;
use App\Models\Imunisasi;
use App\Models\Notif;
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

    public function create_imunisasi(Request $request){

        $imun = Imunisasi::create([

            'jenis_imunisasi'=>$request->jenis_imunisasi,
            'waktu_imunisasi'=>$request->waktu_imunisasi,

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
   
        $i= Imunisasi::get();
        $tokenList = Arr::pluck($i, 'token');
        $token = $i[0]->token;
     
  
        
        // return $i[0]->waktu_imunisasi;
        $notif = new Notif();
        $notif->sendNotif($tokenList, $i[0]->jenis_imunisasi. "Pada waktu ".$i[0]->waktu_imunisasi, "Notifikasi Imunisasi" );
        return "sukses";
    
  }

    
}
