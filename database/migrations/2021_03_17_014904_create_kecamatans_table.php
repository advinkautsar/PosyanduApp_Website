<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateKecamatansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('kecamatan', function (Blueprint $table) {
            $table->id();
            $table->string("nama_kecamatan");
            $table->string("kabupaten");
            $table->timestamps();
        });

        DB::table('kecamatan')->insert([
            'id' =>1,
            'nama_kecamatan'=>'Kecamatan Glagah',
            'kabupaten' =>'Kabupaten Banyuwangi',
        ]);

        DB::table('kecamatan')->insert([
            'id' =>2,
            'nama_kecamatan'=>'Kecamatan Licin',
            'kabupaten' =>'Kabupaten Banyuwangi',
        ]);

        DB::table('kecamatan')->insert([
            'id' =>3,
            'nama_kecamatan'=>'Kecamatan Kemiren',
            'kabupaten' =>'Kabupaten Banyuwangi',
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('kecamatan');
    }
}
