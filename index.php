<?php
session_start();
//koneksi ke database
include 'koneksi.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NawawiStore</title>
  <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
  <link rel="stylesheet" href="admin/assets/css/styles.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap">

</head>
<body>

<?php include 'templates/top-navbar.php'; ?>

<!-- konten   -->

<div class="container-landing">
    <div class="landing-page">
        <div class="landing-left">
            <h2>FIND CLOTHES THAT MATCHES YOUR STYLE</h2>
            <p>Koleksi Pilihan untuk Keluarga Muslim, Dari Anak-Anak Hingga Dewasa, Tersedia di Nawawi Store!</p>
            <a href="#top-selling" class="shop-now-btn">Shop Now</a>
            <div class="product-categories">
                <!-- Data produk kategori -->
            </div>
        </div>
        <div class="landing-right">
            <img src="admin/assets/img/landing.png" alt="Image">
        </div>
    </div>
</div>

<div class="container-category">
    <div class="category-line">
        <?php
        // Query to select categories from the database
        $query = "SELECT * FROM kategori";
        $result = mysqli_query($koneksi, $query);

        // Check if the query was successful
        if ($result && mysqli_num_rows($result) > 0) {
            // Loop through each category and display them
            while ($row = mysqli_fetch_assoc($result)) {
                // Construct the category link with query parameter
                $categoryLink = 'kategori.php?category_id=' . $row['id_kategori'];
                // Output the category link
                echo '<a href="' . $categoryLink . '">' . $row['nama_kategori'] . '</a>';
            }
        } else {
            // Query failed, handle the error
            echo 'Error: Failed to fetch categories.';
        }
        ?>
    </div>
</div>

<section class="content" id="new-arrivals">
  <div class="container-produk">
    <h2 class="new-arrivals-title">Produk Terbaru</h2>
    <div class="new-arrivals">
      <?php
      $ambil = $koneksi->query("SELECT * FROM produk ORDER BY id_produk DESC");

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

<section class="content"id="top-selling">
  <div class="container-produk">
    <h2 class="new-arrivals-title">Produk Terlaris</h2>
    <div class="new-arrivals">
      <?php
      $ambil = $koneksi->query("SELECT * FROM produk ORDER BY stok_produk DESC");
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

<section id="product-article">
<div class="product-category-container">
        <div class="product-category">
            <h2 class="product-category-title">Produk Artikel</h2>
            
            <div class="category-row">
                
                <div class="category-box category-left">
                    <h3>Koko</h3>
                    <!-- Isi konten Casual -->
                    <img src="admin/assets/img/koko.png" alt="Ghobannah Photo">
                </div>
                <div class="category-box category-right">
                    <h3>Thobe</h3>
                    <!-- Isi konten Thobe -->
                    <img src="admin/assets/img/thobe.png" alt="Ghobannah Photo">
                </div>
            </div>

            <div class="category-row">
                <div class="category-box category-left">
                    <h3>Jasko</h3>
                    <!-- Isi konten Casual -->
                    <img src="admin/assets/img/jasko.png" alt="Ghobannah Photo">
                </div>
                <div class="category-box category-right">
                    <h3>Ghobanah</h3>
                    <!-- Isi konten Thobe -->
                    <img src="admin/assets/img/ghobanah.png" alt="Ghobannah Photo">
                </div>
            </div>
            <!-- Tambahkan lebih banyak baris jika diperlukan -->
        </div>
</div>
</section>

    <?php include 'templates/footer.php'; ?>

</body>
<script>
        // Function to toggle dropdown when the user icon is clicked
        function toggleDropdown() {
            var dropdown = document.getElementById("userDropdown");
            dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
        }
    </script>
</html>