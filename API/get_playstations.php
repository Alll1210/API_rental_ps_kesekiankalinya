<?php
require '../config/config.php';

$response = array();
$sql = mysqli_query($con, "SELECT a.*, b.nama FROM playstations a
left join users b on a.idUsers = b.id");
while ($a = mysqli_fetch_array($sql)){
    $b['id_ps'] = $a['id_ps'];
    $b['bilik'] = $a['bilik'];
    $b['jenis_ps'] = $a['jenis_ps'];
    $b['daftar_game'] = $a['daftar_game'];
    $b['harga'] = $a['harga'];
    $b['idUsers'] = $a['idUsers'];
    $b['gambar'] = $a['gambar'];
    $b['nama'] = $a['nama'];
    $b['status'] = $a['status'];
    

    array_push($response, $b);
}

echo json_encode($response);
?>
