<?php
session_start();

//koneksi ke database
include 'koneksi.php';


// jika tombol login ditekan
if(isset($_POST['login'])){

  $email = $_POST['email'];
  $password = $_POST['password'];

  // Melakukan query pada tabel pelanggan
  $ambil = $koneksi->query("SELECT * FROM pelanggan WHERE email_pelanggan='$email' AND password_pelanggan='$password'");

  // Mengecek akun yang cocok (email & password)
  $akunyangcocok = $ambil->num_rows;

  // Jika ada akun yang cocok
  if($akunyangcocok == 1){
    // Mendapatkan aku dalam bentuk array
    $akun = $ambil->fetch_assoc();

    // Simpan di session
    $_SESSION["pelanggan"] = $akun;
    echo "<div class='alert alert-success'>Login sukses</div>";

    // Jika sudah belanja
    if(isset($_SESSION['keranjang']) OR !empty($_SESSION['keranjang'])){
      echo "<meta http-equiv='refresh' content='1;url=checkout.php'>";
    }
    else{
      echo "<meta http-equiv='refresh' content='1;url=index.php'>";
    }
  }
  else{
    // echo "<script>alert('Gagal login')</script>";
    // echo "<script>location='login.php';</script>";
    echo "<div class='alert alert-danger'>Login gagal!</div>";
		echo "<meta http-equiv='refresh' content='1;url=login.php'>";
  }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Pelanggan</title>
  <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
    <link rel="stylesheet" href="admin/assets/css/styles.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap">
</head>
<body>

<?php include 'templates/top-navbar.php'; ?>

<div class="container">
  <div class="row">
    <div class="col-md-4 col-md-offset-4">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">Login Pelanggan</h3>
        </div>
        <div class="panel-body">
          <form action="" method="post">
            <div class="form-group">
              <label for="">Email</label>
              <input type="email" class="form-login" name="email">
            </div>
            <div class="form-group">
              <label for="">Password</label>
              <input type="password" class="form-login" name="password">
            </div>
            <button type="submit" name="login" class="btn btn-primary">Login</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
  
</body>
</html>