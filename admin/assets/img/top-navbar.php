<div class="navbar">
    <a href="#" class="logo"><img src="admin/assets/img/logo.png" alt="Logo" width="100px"></a>
    <a href="index.php">home</a>
    <a href="keranjang.php">Keranjang</a>
    <!-- Jika sudah login (ada login pelanggan) -->
    
        <form action="pencarian.php" method="get" class="navbar-form navbar-right">
        <input type="text" class="form-control" name="keyword">
        <button class="btn">Cari</button>
      </form>
    <?php if(isset($_SESSION["pelanggan"])): ?>
    <a href="#">New Arrivals</a>
    <a href="#">Category</a>
    <div class="search-box">
        <input type="text" placeholder="Search...">
    </div>
    <?php else: ?>
          <a href="login.php">Login</a>
          <a href="daftar.php">Daftar</a>
        <?php endif; ?>
        <a href="checkout.php">Checkout</a>
    
        
</div>