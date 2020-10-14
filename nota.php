<?php 
session_start();
include 'koneksi.php';
 ?>
<!DOCTYPE html>
<html>
<head>
	<title>Ikan Cupang | Nota</title>
	<link rel="stylesheet" href="admin/assets/bower_components/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>
<?php include 'menu.php'; ?>

	<section class="konten">
		<div class="container">
			<h2>Nota Pembelian</h2>
<?php 
$ambil = $koneksi->query("SELECT * FROM pembelian JOIN pelanggan ON pembelian.id_pelanggan = pelanggan.id_pelanggan WHERE pembelian.id_pembelian = '$_GET[id]'");
$detail = $ambil->fetch_assoc();
 ?>

 <?php 
	$idpelangganyangsudahbeli = $detail["id_pelanggan"];
	$idpelangganyangsudahlogin = $_SESSION["pelanggan"]["id_pelanggan"];
		
		if ($idpelangganyangsudahbeli!==$idpelangganyangsudahlogin) 
		{
			echo "<script>alert('Jangan Nakal');</script>";
			echo "<script>location='riwayat.php'</script>";
			exit();
		}
  ?>
 <!--  <pre><?php //print_r($detail); ?></pre> -->

 <div class="row">
 	<div class="col-md-4">
 		<h3>Pembelian</h3>
 		<strong>No. Pembelian : <?php echo $detail['id_pembelian']; ?></strong><br>
 		Tanggal : <?php echo $detail['tanggal_pembelian']; ?> <br>
 		Total : Rp. <?php echo number_format($detail['total_pembelian']); ?>
 	</div>
 	<div class="col-md-4">
 		<h3>Pelanggan</h3>
 		<strong>Nama : <?php echo $detail['nama_pelanggan']; ?></strong><br>
 		Telepon : <?php echo $detail['telepon_pelanggan']; ?> <br>
 		Email : <?php echo $detail['email_pelanggan']; ?>
 	</div>
 	<div class="col-md-4">
 		<h3>Pengiriman</h3>
 		<strong>Kab. / Kota : <?php echo $detail['nama_kota']; ?></strong><br>
 		Ongkir : <?php echo $detail['tarif']; ?> <br>
 		Alamat : <?php echo $detail['alamat_pengiriman']; ?>
 	</div>
 </div>
 <br>

 <table class="table table-bordered text-center">
 	<thead>
 		<tr>
 			<th class="text-center"> No. </th>
 			<th class="text-center"> Nama Produk</th>
 			<th class="text-center"> Harga Produk</th>
 			<th class="text-center"> Berat Produk</th>
 			<th class="text-center"> Jumlah</th>
 			<th class="text-center"> Subharga</th>
 			<th class="text-center"> Subberat</th>
 		</tr>
 	</thead>
 	<tbody>
 		<?php $nomor=1; ?>
 		<?php $ambil = $koneksi->query("SELECT * FROM pembelian_produk WHERE id_pembelian = '$_GET[id]'"); ?>
 		<?php while($pecah = $ambil->fetch_assoc()){ ?>
 		<tr>
 			<td><?php echo $nomor; ?></td>
 			<td><?php echo $pecah['nama']; ?></td>
 			<td> Rp. <?php echo number_format($pecah['harga']); ?></td>
 			<td> <?php echo $pecah['berat']; ?> Gr.</td>
 			<td><?php echo $pecah['jumlah']; ?></td>
 			 <td> Rp. <?php echo number_format($pecah['subharga']); ?></td>
 			 <td> <?php echo $pecah['subberat']; ?> Gr.</td>
 		</tr>
 		<?php $nomor++; ?>
 	<?php } ?>
 	</tbody>
 </table>
 <div class="row">
 	<div class="col-md-6 alert alert-success">
 		<p>Silahkan lakukan pembayan <b style="font-size: 17px"> Rp <?php echo number_format($detail['total_pembelian']); ?></b>
 			ke : <br><br>
 			<strong>BANK BCA 0520227121 AN. MIKHA CAVIN ARTHUR IMANUEL</strong> <br>
 			<strong>BANK MANDIRI 1060005071462  AN. MIKHA CAVIN ARTHUR IMANUEL</strong> <br>
 			<strong>BANK BNI 1700025035  AN. MIKHA CAVIN ARTHUR IMANUEL</strong>
 		</p>
 	</div>
 </div>
		</div>
	</section>
</body>
</html>