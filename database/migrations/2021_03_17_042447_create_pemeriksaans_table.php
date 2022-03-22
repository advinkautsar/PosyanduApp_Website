<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePemeriksaansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pemeriksaan', function (Blueprint $table) {
            $table->id();
            $table->bigInteger("bidan_id")->unsigned()->nullable();
            $table->bigInteger("nik_anak")->unsigned()->nullable();
            $table->bigInteger("imunisasi_id_1")->unsigned()->nullable();
            $table->bigInteger("imunisasi_id_2")->unsigned()->nullable();
            $table->bigInteger("imunisasi_id_3")->unsigned()->nullable();
            $table->enum('vitA_merah', ['Ya', 'Tidak']);
            $table->enum('vitA_biru', ['Ya', 'Tidak']);
            $table->enum('Fe_1', ['Ya', 'Tidak']);
            $table->enum('Fe_2', ['Ya', 'Tidak']);
            $table->enum('PMT', ['Ya', 'Tidak']);
            $table->enum('asi_ekslusif', ['Ya', 'Tidak']);
            $table->enum('oralit', ['Ya', 'Tidak']);
            $table->enum('obat_cacing', ['Ya', 'Tidak']);
            $table->foreign('nik_anak')->references('nik_anak')->on('anak')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('bidan_id')->references('id')->on('bidan')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('imunisasi_id_1')->references('id')->on('imunisasi')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('imunisasi_id_2')->references('id')->on('imunisasi')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('imunisasi_id_3')->references('id')->on('imunisasi')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
        });

        DB::table('pemeriksaan')->insert([
            'id' =>1,
            'nik_anak'=>'3510210102990011',
            'bidan_id' =>'1',       
            'imunisasi_id_1' =>'1',       
            'imunisasi_id_2' =>'2',       
            'imunisasi_id_3' =>'3',       
            'vitA_merah' =>'Ya',       
            'vitA_biru' =>'Tidak',       
            'Fe_1' =>'Tidak',       
            'Fe_2' =>'Ya',       
            'PMT' =>'Tidak',       
            'asi_ekslusif' =>'Ya',       
            'oralit' =>'Ya',       
            'obat_cacing' =>'Tidak',       
        ]);

        DB::table('pemeriksaan')->insert([
            'id' =>2,
            'nik_anak'=>'3510210102990012',
            'bidan_id' =>'1',       
            'imunisasi_id_1' =>'1',       
            'imunisasi_id_2' =>'2',       
            'imunisasi_id_3' =>'2',       
            'vitA_merah' =>'Ya',       
            'vitA_biru' =>'Tidak',       
            'Fe_1' =>'Tidak',       
            'Fe_2' =>'Ya',       
            'PMT' =>'Tidak',       
            'asi_ekslusif' =>'Ya',       
            'oralit' =>'Ya',       
            'obat_cacing' =>'Tidak',       
        ]);

        DB::table('pemeriksaan')->insert([
            'id' =>3,
            'nik_anak'=>'3510210102990013',
            'bidan_id' =>'1',       
            'imunisasi_id_1' =>'2',       
            'imunisasi_id_2' =>'2',       
            'imunisasi_id_3' =>'2',       
            'vitA_merah' =>'Ya',       
            'vitA_biru' =>'Tidak',       
            'Fe_1' =>'Tidak',       
            'Fe_2' =>'Ya',       
            'PMT' =>'Tidak',       
            'asi_ekslusif' =>'Ya',       
            'oralit' =>'Ya',       
            'obat_cacing' =>'Tidak',       
        ]);



    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pemeriksaan');
    }
}
