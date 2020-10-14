<?php 
session_start();
include 'koneksi.php'; ?>
<!DOCTYPE html>
<html>
<head>
	<title>Ikan Cupang | Beranda</title>
	<link rel="stylesheet" href="admin/assets/bower_components/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>
	<!-- navbar -->
	<?php include 'menu.php'; ?>

	<!-- content -->
	<section class="konten">
		<div class="container">
			<h1>Cupang Trending</h1>
			<div class="row">
				<?php $ambil = $koneksi->query("SELECT * FROM produk"); ?>
				<?php while ($perproduk = $ambil->fetch_assoc()) { ?>
				<div class="col-xs-6 col-sm-4 col-md-3">
					<div class="thumbnail">
						<img src="foto_produk/<?php echo $perproduk['foto_produk']; ?>" alt="">
						<div class="caption text-center">
							<h3><?php echo $perproduk['nama_produk']; ?></h3>
							<h4 style="color: #d0011b; padding-top: 10px">Rp<?php echo number_format($perproduk['harga_produk']); ?></h4>
							<h5>Tersedia: <b style="color: #d0011b"><?php echo $perproduk ['stok_produk'];?></b> Pcs</h5>
							<a href="detail.php?id=<?php echo$perproduk['id_produk']; ?>" class="btn btn-primary">Detail Produk</a>
							<a href="beli.php?id=<?php echo$perproduk['id_produk']; ?>" class="btn btn-success">Beli Langsung</a>
						</div>
					</div>
				</div>
				<?php } ?>
			</div>
		</div>
	</section>
	<footer class="main-footer text-center">
	<!-- Default to the left -->
	<div style="margin-top: 150px; margin-bottom: 100px;">
	<strong>Copyright &copy; 2020 <a href="#">Ikan Cupang</a>.</strong> All rights reserved. <a href="https://github.com/mikhacavin/web-ikan-cupang">Under Licensed Mikha Cavin</a>
	</div>
  </footer>
</body>
</html>