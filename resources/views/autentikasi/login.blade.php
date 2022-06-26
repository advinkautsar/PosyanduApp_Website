<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halaman Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
        integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
        crossorigin="anonymous" />


    <link rel="stylesheet" href="../public/vendor/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="../public/assets/css/style.css">
    <!-- <link rel="stylesheet" href="../public/vendor/themify-icons/themify-icons.css"> -->
    <link rel="stylesheet" href="../public/assets/css/bootstrap-override.css">


</head>

<body>
<section class="container h-100">
    <div class="row justify-content-sm-center h-100 align-items-center">
        <div class="col-xxl-4 col-xl-5 col-lg-6 col-md-7 col-sm-8">
            <div class="card shadow-lg">
                <div class="card-body p-4">
                    <h1 class="fs-4 text-center fw-bold mb-4">Login</h1>
                    
                    <form action="{{ route('autentikasi.logincek') }}" method="POST" aria-label="abdul" data-id="abdul" class="needs-validation" novalidate=""autocomplete="off">

                        @if(Session::get('fail'))
                                <div class="alert alert-danger" role="alert">
                                    {{ Session::get('fail') }}
                                </div>
                        @endif

                        @csrf
                        <div class="mb-3">
                            <label class="mb-2 text-muted fw-bold " for="email">Nama Pengguna</label>
                            <div class="input-group input-group-join mb-3">
                                <input type="text" class="form-control" id="nama_pengguna" placeholder="Masukkan nama pengguna" name="nama_pengguna" id="validationCustom01" required autofocus>                               
                                <span class="input-group-text rounded-end">&nbsp<i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp</span>
                                <div class="invalid-feedback">
                                    Nama pengguna tidak boleh kosong
                                </div>
                                <!-- <span class="text-danger">@error('nama_pengguna'){{ $message }} @enderror</span> -->
                                
                            </div>
                        </div>

                        <div class="mb-3">
                            <div class="mb-2 w-100">
                                <label class="text-muted fw-bold" for="password" ">Kata Sandi</label>
                            </div>
                            <div class="input-group input-group-join mb-3">

                                <input type="password" class="form-control" id="kata_sandi" name="kata_sandi" placeholder="Masukkan kata sandi" required>

                                
                                <span class="input-group-text rounded-end password cursor-pointer">&nbsp<i class="fa fa-eye"></i>&nbsp</span>

                                <span class="text-danger">@error('kata_sandi'){{ $message }} @enderror</span>
                                <div class="invalid-feedback">
                                    Kata sandi tidak boleh kosong
                                </div>

                            </div>
                        </div>

                        <div class="mt-4 d-grid gap-2 ">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>
                    </form>

                    
            </div>
            
        </div>
    </div>
</section>
<script src="../public/assets/js/login.js"></script>
</body>
</html>