<?php 
session_start();
include 'koneksi.php' ?>
<!DOCTYPE html>
<html>
<head>
	<title>Ikan Cupang | Detail</title>
	<link rel="stylesheet" href="admin/assets/bower_components/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>
	<?php include 'menu.php'; ?>
	<section class="konten">
		<div class="container">
			<h1>Detail Produk</h1><br>

			<?php 
			$id_produk = $_GET['id'];

			$ambil = $koneksi->query("SELECT * FROM produk WHERE id_produk = '$id_produk'");
			$detail = $ambil->fetch_assoc();
			 ?>


			 <div class="row">
			 	<div class="col-md-6">
			 		<img src="foto_produk/<?php echo $detail['foto_produk']; ?>" alt="" class="img-responsive">
			 	</div>
			 	<div class="col-md-6">
			 		<h2><?php echo $detail['nama_produk']; ?></h2>
			 		<h3><b style="color:#d0011b">Rp<?php echo number_format($detail['harga_produk']); ?></b></h3>
			 		<h4>Berat: <?php echo number_format($detail['berat_produk']); ?> Gr.</h4>
			 		<h5> Tersedia: <b style="color: #d0011b"><?php echo $detail['stok_produk']; ?></b> Pcs</h5>
			 		<form method="POST">
			 			<div class="form-group">
			 				<div class="input-group">
			 					<input type="number" min="1" class="form-control" name="jumlah" max="<?php echo $detail['stok_produk'] ?>" placeholder="Saya Mau Borong" autofocus>
			 					<div class="input-group-btn">
			 						<button class="btn btn-success" name="beli">Beli Sekarang</button>
			 					</div>
			 				</div>
			 			</div>
			 		</form>
			 		<?php 
			 		if (isset($_POST['beli'])) {
			 		 	$jumlah = $_POST['jumlah'];
			 		 	//masukkan kedalam keranjang belanja
			 		 	$_SESSION['keranjang'][$id_produk] = $jumlah;

			 		 	echo "<script>alert('Produk Telah Berhasil dimasukkan kedalam Keranjang')</script>";
			 		 	echo "<script>location='keranjang.php';</script>";
			 		 } 
			 		 ?>

			 		<p><?php echo $detail['deskripsi_produk']; ?></p>
			 		<a href="index.php" class="btn btn-warning">Kembali</a>
			 	</div>
			 </div>
		</div>
	</section>
</body>
</html>