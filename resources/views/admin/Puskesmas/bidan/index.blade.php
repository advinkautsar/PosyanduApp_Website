@extends('admin.layouts.master')

@section('content')

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Bidan Wilayah Puskesmas Paspan</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Beranda</a></li>
              <li class="breadcrumb-item active">Halaman Bidan</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title text-bold ">Data Bidan Terdaftar</h3>
                    <div class="card-tools">
                        <div class="input-group input-group-sm" style="width: 150px;">
                            <input type="text" name="table_search" class="form-control float-right" placeholder="Search">
                        <div class="input-group-append">
                        <button type="submit" class="btn btn-default">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="card-body table-responsive p-0">
            <table class="table table-hover text-nowrap">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nama Bidan</th>
                        <th>Alamat</th>
                        <th>Puskesmas</th>
                        <th>Posyandu</th>
                        <th class="text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($listbidan as $i)
                        <tr>
                            <td>{{ $i->id }}</td>
                            <td>{{ $i->nama }}</td>
                            <td>{{ $i->alamat }}</td>
                            <td>{{ $i->puskesmas->nama_puskesmas }}</td>
                            <td>{{ $i->posyandu->nama }}</td>
                            <td class="text-center">
                                <a href="" class="btn btn-primary btn-sm">Lihat</a>
                                <a href="" class="btn btn-warning btn-sm">Edit</a>
                                <a href="" class="btn btn-danger btn-sm">Hapus</a>
                            </td>                        
                        </tr>
                    @endforeach

                </tbody>
            </table>
        </div>
    </div>

</div>
      

    </section>
    <!-- /.content -->
  </div>

@endsection