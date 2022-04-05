<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePenimbangansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('penimbangan', function (Blueprint $table) {
            $table->id();
            $table->bigInteger("nik_anak")->unsigned()->nullable();
            $table->float("berat_badan");
            $table->float("tinggi_badan");
            $table->float("lingkar_kepala");
            $table->string("status_bb_u");
            $table->string("status_tb_u");
            $table->string("status_lk_u");
            $table->string("status_bb_tb");
            $table->string("status_imt_u");
            $table->foreign('nik_anak')->references('nik_anak')->on('anak')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
        });

        DB::table('penimbangan')->insert([
            'id' =>1,
            'nik_anak'=>'3510210102990012',
            'berat_badan' =>'12',       
            'tinggi_badan' =>'10',       
            'lingkar_kepala' =>'2',       
            'status_bb_u' =>'Berat Badan Kurang',       
            'status_tb_u' =>'Tinggi Badan Normal',       
            'status_lk_u' =>'Normal',       
            'status_bb_tb' =>'Gizi Baik',       
            'status_imt_u' =>'Gizi Baik',          
            'created_at'=> '2022-04-05',
        ]);

         DB::table('penimbangan')->insert([
            'id' =>2,
            'nik_anak'=>'3510210102990011',
            'berat_badan' =>'12',       
            'tinggi_badan' =>'10',       
            'lingkar_kepala' =>'2',       
            'status_bb_u' =>'Berat Badan Normal',       
            'status_tb_u' =>'Tinggi Badan Normal',       
            'status_lk_u' =>'Normal',       
            'status_bb_tb' =>'Gizi Baik',       
            'status_imt_u' =>'Gizi Baik',          
            'created_at'=> '2022-04-28',

        ]);

         DB::table('penimbangan')->insert([
            'id' =>3,
            'nik_anak'=>'3510210102990013',
            'berat_badan' =>'12',       
            'tinggi_badan' =>'10',       
            'lingkar_kepala' =>'2',       
            'status_bb_u' =>'Berat Badan Normal',       
            'status_tb_u' =>'Tinggi Badan Normal',       
            'status_lk_u' =>'Normal',       
            'status_bb_tb' =>'Gizi Baik',       
            'status_imt_u' =>'Gizi Baik',          
            'created_at'=> '2022-04-18',

        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('penimbangan');
    }
}
