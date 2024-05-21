<?php
session_start();

//koneksi ke database
include 'koneksi.php';

if(empty($_SESSION["keranjang"]) OR !isset($_SESSION["keranjang"])){
  echo "<script>alert('Keranjang kosong, silahkan pilih produk!');</script>";
  echo "<script>location='index.php';</script>";
}

// echo "<pre>";
// print_r($_SESSION['keranjang']);
// echo "</pre>";
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Keranjang Belanja</title>
  <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
  <link rel="stylesheet" href="admin/assets/css/styles.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap">
</head>
<body>

<?php include 'templates/top-navbar.php'; ?>

<section class="content">
<div class="content-keranjang"><h1>keranjang Belanja</h1></div>  


<div class="cart-container">
    <?php $no=1; ?>
    <?php foreach($_SESSION['keranjang'] as $id_produk => $jumlah): ?>
    <!-- Menampilkan produk yang sedang duperulangkan berdasarkan id_produk -->
    <?php
    $ambil = $koneksi->query("SELECT * FROM produk WHERE id_produk='$id_produk'");
    $pecah = $ambil->fetch_assoc();
    
    $subharga = $pecah['harga_produk'] * $jumlah;
    // echo "<pre>";
    // print_r($pecah);
    // echo "</pre>";
    ?>
    <div class="item-container">
        <div class="item-image">
            <img src="foto_produk/<?= $pecah['foto_produk']; ?>" alt="<?= $pecah['nama_produk']; ?>">
        </div>
        <div class="item-details">
            <div class="item-info">
                <h4><span class="item-name"><?= $pecah['nama_produk']; ?></span></h4>
                <h3><span class="item-price">Rp. <?= number_format($pecah['harga_produk']); ?>,-</span></h3>
                
            </div>

            <a href="hapuskeranjang.php?id=<?= $id_produk; ?>" class="delete-btn"><img src="admin/assets/img/trash-solid.svg" width="24px"></a>

        </div>
        <div class="item-quantity">
            <button class="quantity-btn" onclick="decrementQuantity(this)">-</button>
            <span class="quantity"><?= $jumlah; ?></span>
            <button class="quantity-btn" onclick="incrementQuantity(this)">+</button>
        </div>
    </div>
    <?php endforeach; ?>
</div>






  

  
    <div class="content-keranjang">
    <a href="index.php" class="btn btn-default">Lanjutkan Belanja</a>
    <a href="checkout.php" class="btn btn-primary">Checkout</a>
    </div>
  </div>
</section>

<?php include 'templates/footer.php'; ?>

<script>
  function incrementQuantity(button) {
    var quantityElement = button.parentElement.querySelector('.quantity');
    var currentQuantity = parseInt(quantityElement.textContent);
    quantityElement.textContent = currentQuantity + 1;
}

function decrementQuantity(button) {
    var quantityElement = button.parentElement.querySelector('.quantity');
    var currentQuantity = parseInt(quantityElement.textContent);
    if (currentQuantity > 1) {
        quantityElement.textContent = currentQuantity - 1;
    }
}

</script>
  
</body>
</html>