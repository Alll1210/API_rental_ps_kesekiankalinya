<?php
require '../config/config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    # code ..
    $response = array ();
    $bilik = $_POST['bilik'];
    $jenis_ps = $_POST['jenis_ps'];
    $daftar_game = $_POST['daftar_game'];
    $harga = $_POST['harga'];
    $idUsers = $_POST['idUsers'];
    $status = $_POST['status'];
    $gambar = date('dmYHis').str_replace(" ","", basename($_FILES['gambar']['name']));
    $imagePath = "../upload/".$gambar;
    move_uploaded_file($_FILES['gambar']['tmp_name'], $imagePath);

        $insert = "INSERT INTO playstations VALUE (NULL,'$bilik', '$jenis_ps',
         '$daftar_game', '$harga', '$gambar', '$idUsers', '$status')";
    if (mysqli_query($con, $insert)){
        # code ..
        $response['value']=1;
        $response['message']='Berhasil Ditambahkan';
        echo json_encode($response);
    } else{
        # code ..
        $response['value']=0;
        $response['message']='Gagal Ditambahkan';
        echo json_encode($response);
    }
    
}
?>
