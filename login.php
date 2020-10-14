<?php 
session_start();
include 'koneksi.php';
 ?>
 <!DOCTYPE html>
 <html>
 <head>
 	<title>Ikan Cupang | Login</title>
	<link rel="stylesheet" href="admin/assets/bower_components/bootstrap/dist/css/bootstrap.min.css">
 </head>
 <body>
 	<!-- navbar -->
	<?php include 'menu.php'; ?>

	<div class="container">
		<div class="row" style="margin-top: 100px">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="panel-title text-center">
							<label>Ikan Cupang | Login</label>
						</div>
					</div>
					<div class="panel-body">
						<form method="POST">
							<div class="form-group">
								<label>Email</label>
								<input type="email" class="form-control" name="email">
							</div>
							<div class="form-group">
								<label>Password</label>
								<input type="password" class="form-control" name="password">
							</div>
							<button class="btn btn-primary btn-lg btn-block" name="login">Login</button> <br>
							<p>Belum punya Akun?  <a href="daftar.php" style="text-decoration: none;"><b>Daftar</b></a></p>
						</form>
						<?php 
						if (isset($_POST['login'])) {
						 	$email = $_POST['email'];
						 	$password = $_POST['password'];

						 	$ambil = $koneksi->query("SELECT * FROM pelanggan WHERE email_pelanggan = '$email' AND password_pelanggan = '$password'");
						 	$akun_cocok = $ambil->num_rows;

						 	if ($akun_cocok ==1) {
						 		$akun = $ambil->fetch_assoc();
						 		$_SESSION['pelanggan'] = $akun;
						 		echo "<div class='alert alert-success text-center'>Login Berhasil</div>";
						 		if (isset($_SESSION['keranjang']) OR !empty($_SESSION['keranjang']))
						 		 {
						 			echo "<meta http-equiv='refresh' content='1;url=checkout.php'>";
						 		}else {
						 			echo "<meta http-equiv='refresh' content='1;url=index.php'>";
						 		}
						 	}else {
						 		echo "<div class='alert alert-danger text-center'>Login Gagal, Silahkan Periksa Akun Anda</div>";
						 		echo "<meta http-equiv='refresh' content='1;url=login.php'>";
						 	}
						 	}
						  ?>
					</div>
				</div>
			</div>
		</div>
	</div>
 
 </body>
 </html>