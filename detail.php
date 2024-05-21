<?php
session_start();

// Koneksi ke database
include 'koneksi.php';

// Mendapatkan id_produk dari url
$id_produk = $_GET['id'];

// Query ambil data
$ambil = $koneksi->query("SELECT * FROM produk WHERE id_produk='$id_produk'");
$detail = $ambil->fetch_assoc();

// echo "<pre>";
// print_r($detail);
// echo "</pre>";

// Jika tombol beli di klik
if(isset($_POST['beli'])){
  // Mendapatkan jumlah yang diinputkan
  $jumlah = $_POST['jumlah'];

  // Masukkan ke keranjang belanja
  $_SESSION['keranjang'][$id_produk] = $jumlah;

  echo "<div class='alert alert-success'>Produk telah masuk ke keranjang</div>";
  echo "<meta http-equiv='refresh' content='1;url=keranjang.php'>";
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Detail Produk</title>
  <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
  <link rel="stylesheet" href="admin/assets/css/styles.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap">

</head>
<body>

<!-- navbar -->
<?php include 'templates/top-navbar.php'; ?>

<section class="content">
  <div class="container-produk">
    <div class="row">
      <div class="col-md-6">
        <img src="foto_produk/<?= $detail['foto_produk']; ?>" class="img-responsive">
      </div>
      <div class="col-md-6">
        <h2><?= $detail['nama_produk']; ?></h2>
        <h4>Rp. <?= number_format($detail['harga_produk']); ?>,-</h4>
        <p><?= $detail['deskripsi_produk']; ?></p>
        <h5>Stok : <?= $detail['stok_produk']; ?></h5>

        <div class="ukuran-dropdown">
          <div class="ukuran">
            <h4>Ukuran : </h4>
          </div>
          <div class="size-dropdown">  
            <select id="size-select">
              <option value="small">S</option>
              <option value="medium">M</option>
              <option value="large">L</option>
              <option value="x-large">XL</option>
            </select>
          </div>
        </div>

        <form action="" method="post">
          <div class="form-beli">
            <div class="input-jumlah">
            <div class="ukuran">
            <h4>Jumlah : </h4>
            </div>
  
              <div class="quantity">
              <input type="number" min="1" max="<?= $detail['stok_produk']; ?>" class="form-detail" name="jumlah" value=1>
              </div>
            </div>
            <button class="btn btn-primary" name="beli">Beli</button>
          </div>
        </form>

        
      </div>
    </div>
  </div>
</section>

<section class="content">
  <div class="container-produk">
    <h2 class="new-arrivals-title">Anda mungkin suka</h2>
    <div class="new-arrivals">
      <?php
      $ambil = $koneksi->query("SELECT * FROM produk");
      while($perproduk = $ambil->fetch_assoc()):
      ?>
      <div class="card-box">
        <div class="">
          <img src="foto_produk/<?= $perproduk['foto_produk']; ?>">
          
        </div>
        <div class="caption">
          <?php
          $nama_produk = $perproduk['nama_produk'];
          $batas_karakter = 20;
          if(strlen($nama_produk) > $batas_karakter) {
            $nama_produk = substr($nama_produk, 0, $batas_karakter) . '...';
          }
          ?>
          <h4><?= $nama_produk; ?></h4>
          <h5>Rp. <?= number_format($perproduk['harga_produk']); ?>,-</h5>
          <a href="beli.php?id=<?= $perproduk['id_produk']; ?>" class="btn btn-primary">beli</a>
          <a href="detail.php?id=<?= $perproduk['id_produk']; ?>" class="btn btn-warning">detail</a>
        </div>
      </div>
      <?php endwhile; ?>
    </div>
  </div>
</section>

<script>
        // Function to toggle dropdown when the user icon is clicked
        function toggleDropdown() {
            var dropdown = document.getElementById("userDropdown");
            dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
        }
    </script>

<?php include 'templates/footer.php'; ?>


  
</body>
</html>