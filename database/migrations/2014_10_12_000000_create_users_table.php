<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('nama_pengguna')->unique();
            $table->string('kata_sandi');
            $table->string("no_hp")->nullable();
            $table->enum('role',['petugas_desa','petugas_puskesmas','bidan','kader','orangtua'])->default('orangtua');
            $table->string('token')->nullable();
            $table->timestamps();
        });

        DB::table('user')->insert([

            'id' =>1,
            'role'=>'bidan',
            'nama_pengguna' =>'bidan',
            'kata_sandi'=> bcrypt(123),
        ]);

         DB::table('user')->insert([

            'id' =>2,
            'role'=>'kader',
            'nama_pengguna' =>'kader1',
            'kata_sandi'=> bcrypt(123),
        ]);

         DB::table('user')->insert([

            'id' =>3,
            'role'=>'orangtua',
            'nama_pengguna' =>'Ega Dhesta',
            'kata_sandi'=> bcrypt(123456),
        ]);

        DB::table('user')->insert([

            'id' =>4,
            'role'=>'orangtua',
            'nama_pengguna' =>'Irfan Rakha',
            'kata_sandi'=> bcrypt(123456),
        ]);

        DB::table('user')->insert([

            'id' =>5,
            'role'=>'orangtua',
            'nama_pengguna' =>'Reza Wahid',
            'kata_sandi'=> bcrypt(123456),
        ]);

        DB::table('user')->insert([

            'id' =>6,
            'role'=>'petugas_desa',
            'nama_pengguna' =>'petugas_desa1',
            'kata_sandi'=> bcrypt(123),
        ]);

        DB::table('user')->insert([

            'id' =>7,
            'role'=>'petugas_puskesmas',
            'nama_pengguna' =>'petugas_puskesmas1',
            'kata_sandi'=> bcrypt(123),
        ]);
       
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user');
    }
}
