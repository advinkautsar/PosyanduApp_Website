<?php

namespace App\Http\Controllers\API\Ortu;

use App\Http\Controllers\Controller;
use App\Models\Anak;
use App\Models\Imunisasi;
use App\Models\Jadwal;
use App\Models\Jadwal_Imunisasi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class NotifikasiController extends Controller
{
    //
    public function index($id){
        // $jadwal = Jadwal::all();
        // $imunisasi = Imunisasi::all();

        // $collection = collect($jadwal);
        // $zippediteraray = $collection->zip($imunisasi);
        // $zippediteraray->toArray();


        // if($jadwal&&$imunisasi){
        //     return response()->json([
        //         'status'    => 'success',
        //         'message'   => 'Data tersedia',
        //         'data'      => $zippediteraray,
        //         // 'data2'=>$imunisasi
        //     ], 200);
        // } else {
        //     return response()->json([
        //         'status'    => 'failed',
        //         'message'   => 'Data tidak tersedia',
        //         'data'      => []
        //     ], 404);
        // }
        $jadwal = DB::table('jadwal')->orderBy('created_at','DESC')->get();
        $imunisasi = DB::table('jadwal_imunisasi')
        ->leftJoin('imunisasi','jadwal_imunisasi.imunisasi_id','imunisasi.id')
        ->leftJoin('anak','jadwal_imunisasi.nik_anak','anak.nik_anak')
        ->leftJoin('orangtua','anak.orangtua_id','orangtua.id')
        ->leftJoin('user','orangtua.user_id','user.id')
        ->select('imunisasi.*','jadwal_imunisasi.*','user.*')
        ->where('user.id',$id)->orderBy('jadwal_imunisasi.created_at','DESC')->get();
        
        $data=[];
        $data2=[];

        
        foreach($jadwal as $v){
            // $data['key1'] = $v->keterangan_kegiatan;
            $data[] = [
                'key1' =>"pada tanggal ". $v->tanggal_kegiatan." ada kegiatan ". $v->keterangan_kegiatan,
                'key2' => $v->created_at,
                'key3' => "Jadwal Posyandu",
             ];
        }
    
        foreach($imunisasi as $v2){
            $data2[] = [
                'key1' => "Hai Ibu ada  jadwal nih imunisasi " . $v2->jenis_imunisasi ." waktu :  ". $v2->waktu_imunisasi,
                'key2' => $v2->created_at,
                'key3' => "Jadwal Imunisasi",
             ];
        }

        $data_akhir = collect();
        $data_akhir->push($data, $data2);
        $data_akhir = $data_akhir->collapse()->sortByDesc('key2')->values()->all();
     
        
        // return $data_akhir;

      
   



// $collect $data, $data2;
     

          if($data_akhir){
            return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $data_akhir,
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

    public function up_no_kartu_anak(Request $request){
        $anak = Anak::where('nik_anak',$request->nik_anak)->first();
        $req=[
            'no_kartu'=>$request->no_kartu,
        ];
        // return $anak;
        if($anak){

            $anak->update($req);
    
            $data = [
             'status' => true,
         
             'pesan' => "Berhasil Update Data Kartu Anak",
             
         ];
         return response()->json($data);

     }else{

         $data = [
             'status' => true,
             
             'pesan' => "Gagal Update Data Kartu Anaki"
         ];
         return response()->json($data);

     }
      
    }
}
