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
            ->where('orangtua.id',$id)
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

    public function updateProfilOrtu(Request $request,$id)
    {
        $orangtua = Orangtua::find($id);
        $orangtua->update($request->all());

        if ($orangtua) {
            $data = [
                'status' => true,
                'pesan' => "Data Profil orangtua berhasil diubah"
            ];
            return response()->json($data, 200);
        } else {
            $data = [
                'status' => true,
                'pesan' => "Gagal Merubah Data orangtua"
            ];
            return response()->json($data, 404);
        }    
    }

    public function updateProfilUserOrtu(Request $request, $id)
    {
        $ortu = Orangtua::where('id',$request->id)->first();
        $user = User::where('id',$ortu->user_id)->first();

        
        if($ortu){

            $user->update([
                'nama_pengguna'=>$request->nama_pengguna,
                'kata_sandi'=>bcrypt($request->kata_sandi),
                'no_hp'=>$request->no_hp,
                'token'=>$request->token,
            ]);
            
               $data = [
                'succes'    => 1,
                'message'   => 'Update Berhasil',
                'user'      => $user,
            ];
            return response()->json($data);

        }else{

            $data = [
                'status' => true,
                'pesan' => "Gagal update akun"
            ];
            return response()->json($data);

        }    
    }
}
