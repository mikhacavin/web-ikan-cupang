<?php include 'koneksi.php'; ?>
<!DOCTYPE html>
<html>
<head>
	<title>Ikan Cupang | Daftar</title>
	<link rel="stylesheet" href="admin/assets/bower_components/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>
	<?php include 'menu.php'; ?>
	<div class="container" style="margin-top: 70px">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title text-center"><b>Ikan Cupang | Daftar</b></h3>
					</div>
					<div class="panel-body">
						<form method="POST" class="form-horizontal">
							<div class="form-group">
								<label class="col-md-3 control-label">Nama</label>
								<div class="col-md-6">
									<input type="text" class="form-control" name="nama" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Email</label>
								<div class="col-md-6">
									<input type="email" class="form-control" name="email"required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Password</label>
								<div class="col-md-6">
									<input type="password" class="form-control" name="password"required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Konfirmasi Password</label>
								<div class="col-md-6">
									<input type="password" class="form-control" name="password2"required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Alamat</label>
								<div class="col-md-6">
									<textarea name="alamat" rows="3" class="form-control" style="resize: none;"required></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">No.telp</label>
								<div class="col-md-6">
									<input type="text" class="form-control" name="telepon"required>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-6 col-md-offset-3">
									<button class="btn btn-primary btn-block btn-lg" name="daftar">Daftar</button>
								</div>
							</div>
							<p>Sudah punya Akun?  <a href="login.php" style="text-decoration: none;"><b>Masuk</b></a></p>
						</form>
						<?php 
						if (isset($_POST['daftar'])) {
							$nama = $_POST['nama'];
							$email = $_POST['email'];
							$password = $_POST['password'];
							$password2 = $_POST['password2'];
							$alamat = $_POST['alamat'];
							$telepon = $_POST['telepon'];

							//cek apakah email sudah di gunakan atau belum
							$ambil = $koneksi->query("SELECT * FROM pelanggan WHERE email_pelanggan = '$email'");
							$cocok = $ambil->num_rows;
							if ($cocok == 1) {
								echo "<script>alert('Pendaftaran Gagal, Email sudah pernah digunakan.');</script>";
								echo "<script>location='daftar.php';</script>";
							} elseif($password != $password2) {
							echo "<script>alert('Kombinasi Password tidak cocok');</script>";
							echo "<script>location='daftar.php';</script>";
							} else {
								//query memasukkan kedalam database
								$koneksi->query("INSERT INTO pelanggan(email_pelanggan,password_pelanggan,nama_pelanggan,telepon_pelanggan,alamat_pelanggan) VALUES('$email','$password','$nama', '$telepon', '$alamat' )");	
								echo "<script>alert('Pendaftaran Berhasil Silahkan Login');</script>";
								echo "<script>location='login.php';</script>";
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