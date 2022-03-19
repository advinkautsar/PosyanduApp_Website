<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

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
