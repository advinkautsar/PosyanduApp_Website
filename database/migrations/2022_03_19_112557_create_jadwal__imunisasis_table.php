<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateJadwalImunisasisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jadwal_imunisasi', function (Blueprint $table) {
            $table->id();
            $table->bigInteger("bidan_id")->unsigned()->nullable();
            $table->bigInteger("nik_anak")->unsigned()->nullable();
            $table->bigInteger("imunisasi_id")->unsigned()->nullable();
            $table->date("tanggal_imunisasi");
            $table->foreign('nik_anak')->references('nik_anak')->on('anak')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('bidan_id')->references('id')->on('bidan')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('imunisasi_id')->references('id')->on('imunisasi')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('jadwal_imunisasi');
    }
}
