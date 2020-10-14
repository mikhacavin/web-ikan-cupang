<!-- navbar -->
	<nav class="navbar navbar-default">
		<div class="container">
			<ul class="nav navbar-nav navbar-left">
				<li><a href="index.php">HOME</a></li>
				<li><a href="keranjang.php">Keranjang</a></li>
				<li><a href="checkout.php">Checkout</a></li>
				<li><a href="riwayat.php">Riwayat Belanja</a></li>
				<!-- Jika sudah login ( ada session pelanggang ) -->
				<?php if ( isset($_SESSION['pelanggan'])): ?>
			</ul>
				<form action="pencarian.php" method="get" class="navbar-form navbar-left">
								<input type="text" class="form-control" name="keyword">
								<button class="btn btn-primary">Cari</button>
							</form>
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="index.php" class="navbar-brand"><?php echo  $_SESSION['pelanggan']['nama_pelanggan'];?></a>
						</li>
						<li><a href="logout.php">Logout</a></li>
						<!-- jika belum login ( tidak ada session pelanggan) -->
						<?php else: ?>
							<form action="pencarian.php" method="get" class="navbar-form navbar-left">
								<input type="text" class="form-control" name="keyword">
								<button class="btn btn-primary">Cari</button>
							</form>
							<li><a href="daftar.php" style="margin-left: 20.5em;"><b>Daftar</b></a></li>
							<li><a href="login.php"><b>Login</b></a></li>
							<?php endif ?>
					</ul>

		</div>
	</nav>