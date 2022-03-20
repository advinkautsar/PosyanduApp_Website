<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAnaksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('anak', function (Blueprint $table) {
            $table->id("nik_anak");
            $table->bigInteger("orangtua_id")->unsigned()->nullable();
            $table->string("no_kartu");
            $table->string("nama_anak");
            $table->enum('jenis_kelamin', ['L', 'P']);
            $table->date("tanggal_lahir");
            $table->float("berat_lahir");
            $table->float("panjang_lahir");
            $table->foreign('orangtua_id')->references('id')->on('orangtua')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
        });

        DB::table('anak')->insert([
            'nik_anak' =>3510210102990011,
            'orangtua_id'=>'1',
            'no_kartu'=>'A1',
            'nama_anak' =>'Bocil Kematian',
            'jenis_kelamin' =>'L',            
            'tanggal_lahir' =>'2022-03-20 ',        
            'berat_lahir' =>'15',        
            'panjang_lahir' =>'10',        
        ]);

        DB::table('anak')->insert([
            'nik_anak' =>3510210102990012,
            'orangtua_id'=>'1',
            'no_kartu'=>'A2',
            'nama_anak' =>'Aulia',
            'jenis_kelamin' =>'P',            
            'tanggal_lahir' =>'2022-03-20 ',        
            'berat_lahir' =>'15',        
            'panjang_lahir' =>'10',        
        ]);

        DB::table('anak')->insert([
            'nik_anak' =>3510210102990013,
            'orangtua_id'=>'2',
            'no_kartu'=>'A3',
            'nama_anak' =>'Fransiscus',
            'jenis_kelamin' =>'L',            
            'tanggal_lahir' =>'2022-03-20 ',        
            'berat_lahir' =>'15',        
            'panjang_lahir' =>'10',        
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('anak');
    }
}
