<?php

namespace App\Http\Controllers\API\Kader;

use App\Http\Controllers\Controller;
use App\Models\Anak;
use App\Models\Imunisasi;
use App\Models\Jadwal;
use App\Models\Notif;
use App\Models\Orangtua;
use App\Models\Posyandu;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;

class JadwalPosyanducontroller extends Controller
{
    //

    public function listposyandu(){
        $p = Posyandu::all();
        if($p){
            return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $p
            ], 200);
        } else {
            return response()->json([
                'status'    => 'failed',
                'message'   => 'Data tidak tersedia',
                'data'      => []
            ], 404);
        }
    }

    public function create_jadwal_posyandu(Request $request){

        $jadwal = Jadwal::create([

            'waktu_kegiatan'=>$request->waktu_kegiatan,
            'tanggal_kegiatan'=>$request->tanggal_kegiatan,
            'keterangan_kegiatan'=>$request->keterangan_kegiatan,
            'kader_id'=>$request->kader_id,
            'posyandu_id'=>$request->posyandu_id,
          

        ]);

        if ($jadwal) {
            $data = [
                'status' => true,
                'pesan' => "Berhasil Mendaftarkan Jadwal Posyandu"
            ];
           
            $notif = new Notif();

            $id_user =DB::table('orangtua')->leftJoin('user','orangtua.user_id','user.id')->select('orangtua.*','user.*')->where('role','orangtua')->where('posyandu_id',$jadwal->posyandu_id)->get();
            $tokenList = Arr::pluck($id_user, 'token');
            $notif->sendNotifPosyandu($tokenList,"Hai Ibu ada agenda kegiatan posyandu nih, yang diadakan pada tanggal :"
            . $jadwal->tanggal_kegiatan. "  Pada Pukul : ".$jadwal->waktu_kegiatan. " Jangan sampai terlewat ya !",
             "Notifikasi Posyandu" );
            // return "sukses";
            return response()->json($data);

        } else {
            $data = [
                'status' => true,
                'pesan' => "Gagal Jadwal Posyandu"
            ];
            return response()->json($data);
        }

    }
}
