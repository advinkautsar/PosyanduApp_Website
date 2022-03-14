<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    
    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card" style="margin-top: 60px">
                    <div class="card-header card text-center ">
                        <h4>Login Admin Posyandu</h4> 
                    </div>
                    <div class="card-body">
                        <div class="mx-auto">
                            <form action="{{ route('autentikasi.logincek') }}" method="POST">
                            
                            @if(Session::get('fail'))
                                <div class="alert alert-danger" role="alert">
                                    {{ Session::get('fail') }}
                                </div>
                            @endif

                                @csrf
                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Nama Pengguna</label>
                                    <input type="text" class="form-control" id="nama_pengguna" placeholder="Masukkan nama pengguna" name="nama_pengguna" value="{{ old('nama_pengguna') }}">
                                    <span class="text-danger">@error('nama_pengguna'){{ $message }} @enderror</span>

                                </div>
                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Kata Sandi</label>
                                    <input type="password" class="form-control" id="kata_sandi" name="kata_sandi" placeholder="Masukkan Password">
                                    <span class="text-danger">@error('kata_sandi'){{ $message }} @enderror</span>

                                </div>
                                <div class="d-grid gap-2">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                </div>
                                <br>
                                <div class="text-center">
                                    <a href="{{ route('autentikasi.register') }}">Belum mempunyai akun? Daftar </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>