<?php

namespace App\Http\Controllers\API\bIDAN;

use App\Http\Controllers\Controller;
use App\Models\Anak;
use App\Models\Imunisasi;
use App\Models\Notif;
use App\Models\Orangtua;
use App\Models\User;
use Illuminate\Http\Request;

class JadwalImunisasicontroller extends Controller
{
    //
    public function create_jadwal_imunisasi(Request $request){

        $imun = Imunisasi::create([

            'jenis_imunisasi'=>$request->jenis_imunisasi,
            'waktu_imunisasi'=>$request->waktu_imunisasi,

        ]);

        if ($imun) {
            $data = [
                'status' => true,
                'pesan' => "Berhasil Mendaftarkan Imunisasi"
            ];
            $notif = new Notif();
            $id_anak = Anak::where('nik_anak',$imun->nik_anak)->orderBy('nik_anak','DESC')->fisrt();
            $id_ibu = Orangtua::where('id',$id_anak->id_ibu)->first();
            $id_user = User::where('id',$id_ibu->id_user)->fisrt();
            $notif->sendNotifImunisasi($id_user->token, $imun[0]->jenis_imunisasi. "Pada waktu ".$imun[0]->waktu_imunisasi, "Notifikasi Imunisasi" );
            return "sukses";
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
