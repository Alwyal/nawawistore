<div class="navbar">
  <a href="index.php" class="logo"><img src="admin/assets/img/logo.png" alt="Logo" width="100px"></a>
  <div class="navbar-list">
    <a href="index.php #new-arrivals">Produk Terbaru</a>
    <a href="index.php #product-article">Kategori</a>
  </div>
   <!-- Form Pencarian -->
   <form action="pencarian.php" method="get" class="navbar-form">
        <input type="text" class="form-control" name="keyword" placeholder="Cari produk anda disini!">
        <button class="btn">Cari</button>
      </form>

      <div class="cart-icon">
        <a href="keranjang.php"><img src="admin/assets/img/cart-shopping-solid.svg" alt="Cart Icon" width="24px"></a>
    </div>
    <?php if(isset($_SESSION["pelanggan"])): ?>
      
      <div class="user-icon" id="userIcon">
    <img src="admin/assets/img/user-solid.svg" alt="User Icon" width="24px">
    <div class="dropdown-content" id="userDropdown">
    <a href="riwayat.php">Riwayat Belanja</a>
        <a href="logout.php">Logout</a>
    </div>
    </div>
      
    <?php else: ?>
      <div class="user-icon" id="userIcon">
    <img src="admin/assets/img/user-solid.svg" alt="User Icon" width="24px">
    <div class="dropdown-content" id="userDropdown">
        <a href="login.php">Login</a>
        <a href="daftar.php">Daftar</a>
    </div>
</div>

    <?php endif; ?>

</div>

<script>
  document.getElementById('userIcon').addEventListener('click', function() {
    var dropdown = document.getElementById('userDropdown');
    dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
});

// Close the dropdown when clicking outside of it
document.addEventListener('click', function(event) {
    var dropdown = document.getElementById('userDropdown');
    var userIcon = document.getElementById('userIcon');
    if (!userIcon.contains(event.target) && !dropdown.contains(event.target)) {
        dropdown.style.display = 'none';
    }
});

</script>