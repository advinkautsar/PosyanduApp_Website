<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

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
