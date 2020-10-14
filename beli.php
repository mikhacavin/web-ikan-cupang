<?php 
session_start();
// mendapatkan id_produk dari URL
$id_produk = $_GET['id'];

// Jika prosuk sudah ada di keranjang maka produk tambah 1
if (isset($_SESSION['keranjang'][$id_produk])) {
	$_SESSION['keranjang'][$id_produk] +=1;
} else {

// selain itu belum ada ddi kerajang , maka produk itu di anggap di beli1
	$_SESSION['keranjang'][$id_produk] = 1;
}

// echo "<pre>";
// print_r($_SESSION);
// echo "</pre>";

// Hubungkan ke keranjang .php
echo "<script>alert('Produk telah masuk kedalam keranjang belanja');</script>";
echo "<script>location='keranjang.php';</script>";
 ?>