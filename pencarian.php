<?php 
session_start();
include 'koneksi.php'; ?>
<?php 
$keyword = $_GET["keyword"];
$semuadata = array();
$ambil = $koneksi->query("SELECT * FROM produk WHERE nama_produk LIKE '%$keyword%' OR deskripsi_produk LIKE '%$keyword%'");
while ( $pecah = $ambil->fetch_assoc()) 
{
	$semuadata[]=$pecah;
}
// echo "<pre>";
// print_r($semuadata);
// echo "</pre>";
 ?>
<!DOCTYPE html>
<html>
<head>
	<title> Ikan Cupang | Beranda </title>
	<link rel="stylesheet" href="admin/assets/bower_components/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>
	<?php include 'menu.php'; ?>
<div class="container">
	<h3>Hasil Pencarian : <?php echo $keyword ?></h3>
	<?php if (empty($semuadata)): ?>
	<div class="alert alert-danger">Pencarian <strong><?php echo $keyword ?></strong> Tidak ditemukan</div>
<?php endif ?>
	<div class="row">


<?php foreach ($semuadata as $key => $value): ?>
		<div class="col-md-4">
			<div class="thumbnail">
				<img src="foto_produk/<?php echo $value['foto_produk'] ?>" alt="" class="img-responsive">
				<div class="caption">
					<h3><?php echo $value['nama_produk']; ?></h3>
					<h5>Rp. <?php echo number_format($value['harga_produk']) ?>	</h5>
					<a href="detail.php?id=<?php echo $value['id_produk']; ?>" class="btn btn-primary">Detail Produk</a>
					<a href="beli.php?id=<?php echo $value['id_produk']; ?>" class="btn btn-success">Beli Sekarang</a>
				</div>
			</div>
		</div>
	<?php endforeach ?>
	</div>


</div>

</body>
</html>