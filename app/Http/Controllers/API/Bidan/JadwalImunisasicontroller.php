<?php

namespace App\Http\Controllers\API\bIDAN;

use App\Http\Controllers\Controller;
use App\Models\Anak;
use App\Models\Imunisasi;
use App\Models\Jadwal_Imunisasi;
use App\Models\Notif;
use App\Models\Orangtua;
use App\Models\User;
use Illuminate\Http\Request;

class JadwalImunisasicontroller extends Controller
{
    //
    public function create_jadwal_imunisasi(Request $request){
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
            $notif = new Notif();
            $jenis =Imunisasi::where('id',$imun->imunisasi_id)->first();
           
            $id_anak = Anak::where('nik_anak',$imun->nik_anak)->orderBy('nik_anak','DESC')->first();
            $id_ortu = Orangtua::where('id',$id_anak->orangtua_id)->first();
          
            $id_user = User::where('id',$id_ortu->user_id)->first();
            $notif->sendNotifImunisasi($id_user->token, "Hai ibu, Ada Jadwal Imunisasi baru nih untuk si kecil yaitu imunisasi ".$jenis->jenis_imunisasi." pada tanggal : ".$imun->tanggal_imunisasi. " Silahkan di cek ya, dan jangan sampai terlewat ! ", "Notifikasi Imunisasi" );
           
            // return $id_user;
            return response()->json($data);
        } else {
            $data = [
                'status' => true,
                'pesan' => "Gagal Mendaftarkan Imunisasi"
            ];
            return response()->json($data);
        }

    }
}
