<?php

namespace App\Http\Controllers\API\Ortu;

use App\Models\Orangtua;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\User;

class OrangtuaController extends Controller
{
    public function ReadAll()
    {
        $orangtua = DB::table('orangtua')        
            ->leftJoin('user','orangtua.user_id','user.id')
            ->leftJoin('posyandu','orangtua.posyandu_id','posyandu.id')
            ->get();
        
        if($orangtua){
                return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $orangtua
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
        $orangtua = DB::table('orangtua')        
            ->leftJoin('user','orangtua.user_id','user.id')
            ->leftJoin('posyandu','orangtua.posyandu_id','posyandu.id')
            ->leftJoin('desa_kelurahan','orangtua.desa_kelurahan_id','desa_kelurahan.id')
            ->leftJoin('kecamatan','orangtua.kecamatan_id','kecamatan.id')
            ->select('posyandu.nama_posyandu','desa_kelurahan.nama','kecamatan.nama_kecamatan','orangtua.*')
            ->where('orangtua.id',$id)
            ->first();
        
            if($orangtua){
                return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $orangtua
                ], 200);
            } else {
                return response()->json([
                'status'    => 'failed',
                'message'   => 'Data tidak tersedia',
                'data'      => []
                ], 404);
            }

    }

    public function showprofilortu($id)
    {
        $ortu = DB::table('orangtua')        
                ->leftJoin('user','orangtua.user_id','user.id')
                ->leftJoin('kecamatan','orangtua.kecamatan_id','kecamatan.id')
                ->leftJoin('desa_kelurahan','orangtua.desa_kelurahan_id','desa_kelurahan.id')
                ->select('user.nama_pengguna','user.kata_sandi','user.no_hp','kecamatan.nama_kecamatan',
                'desa_kelurahan.nama','orangtua.*')
                ->where('user_id',$id)
                ->first();

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

    public function updateProfilOrtu(Request $request,$id)
    {        
        $orangtua = Orangtua::where('user_id',$id)->first();
            $updateortu= $orangtua->update([
                'nik_ayah'=>$request->nik_ayah,
                'nama_ayah'=>$request->nama_ayah,
                'nik_ibu'=>$request->nik_ibu,
                'nama_ibu'=>$request->nama_ibu,
                'alamat'=>$request->alamat,
                'rt'=>$request->rt,
                'rw'=>$request->rw,
                'kecamatan_id'=>$request->kecamatan_id,
                'desa_kelurahan_id'=>$request->desa_kelurahan_id,
            ]);

        $user = User::where('id',$orangtua->user_id)->first();
            $updateuser = $user->update([
                'nama_pengguna'=>$request->nama_pengguna,
                'kata_sandi'=>bcrypt($request->kata_sandi),
                'no_hp'=>$request->no_hp,
            ]);

        if($updateortu || $updateuser){
                        
            $data = [
                'status' => true,
                'pesan' => "Data Diri berhasil diubah"
            ];
            return response()->json($data, 200);

        }else{
            
            $data = [
                'status' => true,
                'pesan' => "Perubahan Data Diri Gagal"
            ];
            return response()->json($data);
        }     
        
    }

     public function showprofilortu_kader($id)
    {
        $ortu = DB::table('orangtua')        
                ->leftJoin('kecamatan','orangtua.kecamatan_id','kecamatan.id')
                ->leftJoin('desa_kelurahan','orangtua.desa_kelurahan_id','desa_kelurahan.id')
                ->select('kecamatan.nama_kecamatan',
                'desa_kelurahan.nama','orangtua.*')
                ->where($id)
                ->first();

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

    public function ubah_persetujuanOrtu(Request $request,$id)
    {
         $ortu = Orangtua::find($id);
            $ortu->update([
                'status_persetujuan'=>$request->status_persetujuan
            ]);

        if($ortu){
                        
            $data = [
                'status' => true,
                'pesan' => "Data Diri orangtua berhasil diubah"
            ];
            return response()->json($data, 200);

        }else{
            
            $data = [
                'status' => true,
                'pesan' => "Perubahan Data Diri Orangtua Gagal"
            ];
            return response()->json($data);
        }     
    }

    
}
