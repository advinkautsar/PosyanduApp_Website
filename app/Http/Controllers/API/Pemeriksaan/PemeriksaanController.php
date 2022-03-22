<?php

namespace App\Http\Controllers\API\Pemeriksaan;

use App\Models\Pemeriksaan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class PemeriksaanController extends Controller
{
 public function create(Request $request)
    {
         $periksa = Pemeriksaan::create([

            'bidan_id'=>$request->bidan_id,
            'nik_anak'=>$request->nik_anak,
            'imunisasi_id_1'=>$request->imunisasi_id_1,
            'imunisasi_id_2'=>$request->imunisasi_id_2,
            'imunisasi_id_3'=>$request->imunisasi_id_3,
            'vitA_merah'=>$request->vitA_merah,
            'vitA_biru'=>$request->vitA_biru,
            'Fe_1'=>$request->Fe_1,
            'Fe_2'=>$request->Fe_2,
            'PMT'=>$request->PMT,
            'asi_ekslusif'=>$request->asi_ekslusif,
            'oralit'=>$request->oralit,
            'obat_cacing'=>$request->obat_cacing,


        ]);

        if ($periksa) {
            $data = [
                'status' => true,
                'pesan' => "Data Pemeriksaan berhasil ditambahkan"
            ];
            return response()->json($data, 200);
        } else {
            $data = [
                'status' => true,
                'pesan' => "Gagal Menambahkan Data Pemeriksaan"
            ];
            return response()->json($data, 404);
        }

    }

    public function read()
    {
        $pemeriksaan = DB::table('pemeriksaan')        
            ->leftJoin('anak','pemeriksaan.nik_anak','anak.nik_anak')
            ->leftJoin('imunisasi','pemeriksaan.imunisasi_id_1','imunisasi.id')
            // ->leftJoin('imunisasi','pemeriksaan.imunisasi_id_1','imunisasi.id')
            // ->leftJoin('imunisasi','pemeriksaan.imunisasi_id_3','imunisasi.id')
            ->leftJoin('bidan','pemeriksaan.bidan_id','bidan.id')
            ->get();

        if($pemeriksaan){
            return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $pemeriksaan
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
        $pemeriksaan = DB::table('pemeriksaan')        
            ->leftJoin('anak','pemeriksaan.nik_anak','anak.nik_anak')
            ->leftJoin('imunisasi','pemeriksaan.imunisasi_id_1','imunisasi.id')
            // ->rightJoin('imunisasi','pemeriksaan.imunisasi_id_1','imunisasi.id')
            // ->rightJoin('imunisasi','pemeriksaan.imunisasi_id_3','imunisasi.id')
            ->leftJoin('bidan','pemeriksaan.bidan_id','bidan.id')
            ->where('pemeriksaan.id',$id)
            ->get();

        if($pemeriksaan){
            return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $pemeriksaan
            ], 200);
        } else {
            return response()->json([
                'status'    => 'failed',
                'message'   => 'Data tidak tersedia',
                'data'      => []
            ], 404);
        }
    }

    public function update(Request $request,$id)
    {
        $periksa = Pemeriksaan::find($id);
        $periksa->update($request->all());

        if ($periksa) {
            $data = [
                'status' => true,
                'pesan' => "Data Pemeriksaan berhasil diubah"
            ];
            return response()->json($data, 200);
        } else {
            $data = [
                'status' => true,
                'pesan' => "Gagal Merubah Data Pemeriksaan"
            ];
            return response()->json($data, 404);
        }

    }

    public function delete(Request $request,$id)
    {
        $periksa = Pemeriksaan::find($id);

        if(!empty($periksa)){
            $periksa->delete();
            $data = [
                'status' => true,
                'pesan' => "Data Rujukan berhasil dihapus"
            ];
            return response()->json($data, 200);
        }else{
            return response()->json([
                'error' => 'Data Tidak Ditemukan'
            ], 404);
            
        }

        
    }}
