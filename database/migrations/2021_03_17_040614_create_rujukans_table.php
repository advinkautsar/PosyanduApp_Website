<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRujukansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rujukan', function (Blueprint $table) {
            $table->id();
            $table->bigInteger("nik_anak")->unsigned()->nullable();
            $table->bigInteger("bidan_id")->unsigned()->nullable();
            $table->bigInteger("puskesmas_id")->unsigned()->nullable();
            $table->bigInteger("tempat_pelayanan")->unsigned()->nullable();
            $table->date("tanggal_rujukan");
            $table->string("keluhan_anak");
            $table->foreign('nik_anak')->references('nik_anak')->on('anak')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('bidan_id')->references('id')->on('bidan')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('puskesmas_id')->references('id')->on('puskesmas')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('tempat_pelayanan')->references('id')->on('posyandu')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
        });

        DB::table('rujukan')->insert([
            'id' =>1,
            'nik_anak'=>'3510210102990011',
            'bidan_id' =>'1',       
            'puskesmas_id' =>'1',       
            'tempat_pelayanan' =>'1',       
            'tanggal_rujukan' =>'2022-03-20',       
            'keluhan_anak' =>'Pusing kunang-kunang',       
        ]);

        DB::table('rujukan')->insert([
            'id' =>2,
            'nik_anak'=>'3510210102990012',
            'bidan_id' =>'1',       
            'puskesmas_id' =>'1',       
            'tempat_pelayanan' =>'1',       
            'tanggal_rujukan' =>'2022-03-20',       
            'keluhan_anak' =>'Pusing kunang-kunang',       
        ]);

        DB::table('rujukan')->insert([
            'id' =>3,
            'nik_anak'=>'3510210102990013',
            'bidan_id' =>'1',       
            'puskesmas_id' =>'1',       
            'tempat_pelayanan' =>'1',       
            'tanggal_rujukan' =>'2022-03-20',       
            'keluhan_anak' =>'Pusing kunang-kunang',       
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('rujukan');
    }
}
