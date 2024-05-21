<?php
include 'koneksi.php';

// Get the keyword from the URL query parameter


// Initialize an empty array to store search results
$semuadata = array();

// Check if the category ID is provided in the URL
if(isset($_GET['category_id'])) {
    // If category ID is provided, construct the SQL query with category filtering
    $categoryID = $_GET['category_id'];
    $query = "SELECT * FROM produk WHERE id_kategori = $categoryID";
} else {
    // If category ID is not provided, construct the SQL query without category filtering
    $query = "SELECT * FROM produk WHERE nama_produk LIKE '%$keyword%' OR deskripsi_produk LIKE '%$keyword%'";
}

// Execute the SQL query to fetch search results
$ambil = $koneksi->query($query);

// Fetch and store search results in the array
while($pecah = $ambil->fetch_assoc()){
  $semuadata[] = $pecah;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pencarian</title>
  <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
  <link rel="stylesheet" href="admin/assets/css/styles.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap">
</head>
<body>

<?php include 'templates/top-navbar.php'; ?>

<section class="content">
  <div class="container">
    <?php $count = 0; ?>
    <?php foreach($semuadata as $key => $value): ?>
      <?php if($count % 4 == 0): ?>
        <div class="row">
      <?php endif; ?>
      <div class="col-md-3">
        <div class="">
          <img src="foto_produk/<?= $value['foto_produk']; ?>" class="img-responsive">
          <div class="caption">
            <h3><?= $value['nama_produk']; ?></h3>
            <h5>Rp. <?= number_format($value['harga_produk']); ?>,-</h5>
            <a href="beli.php?id=<?= $value['id_produk']; ?>" class="btn btn-primary">beli</a>
            <a href="detail.php?id=<?= $value['id_produk']; ?>" class="btn btn-warning">detail</a>
          </div>
        </div>
      </div>
      <?php $count++; ?>
      <?php if($count % 4 == 0): ?>
        </div>
      <?php endif; ?>
    <?php endforeach; ?>
    <?php if($count % 4 != 0): ?>
      </div>
    <?php endif; ?>
  </div>
</section>

<?php include 'templates/footer.php'; ?>
</body>
</html>