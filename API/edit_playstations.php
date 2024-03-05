<?php
require '../config/config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $response = array();

    if (isset($_POST['jenis_ps']) && isset($_POST['id_ps'])) {
        $bilik = $_POST['bilik'];
        $jenis_ps = $_POST['jenis_ps'];
        $daftar_game = isset($_POST['daftar_game']) ? $_POST['daftar_game'] : '';
        $harga = isset($_POST['harga']) ? $_POST['harga'] : '';
        $id_ps = $_POST['id_ps'];
        $status = $_POST['status'];

        $updateData = "jenis_ps = '$jenis_ps'";
        if (!empty($bilik)) {
            $updateData .= ", bilik = '$bilik'";
        }
        if (!empty($daftar_game)) {
            $updateData .= ", daftar_game = '$daftar_game'";
        }
        if (!empty($harga)) {
            $updateData .= ", harga = '$harga'";
        }
        if (!empty($status)) {
            $updateData .= ", status = '$status'";
        }

        if (isset($_FILES['gambar']) && !empty($_FILES['gambar']['name'])) {
            $gambar = date('dmYHis') . str_replace(" ", "", basename($_FILES['gambar']['name']));
            $imagePath = "../upload/" . $gambar;
            move_uploaded_file($_FILES['gambar']['tmp_name'], $imagePath);
            $updateData .= ", gambar = '$gambar'";
        }

        $update = "UPDATE playstations SET $updateData WHERE id_ps = '$id_ps'";

        if (mysqli_query($con, $update)) {
            $response['value'] = 1;
            $response['message'] = 'Berhasil Diupdate';
        } else {
            $response['value'] = 0;
            $response['message'] = 'Gagal Diupdate';
        }
    } else {
        $response['value'] = 0;
        $response['message'] = 'Data tidak lengkap';
    }

    echo json_encode($response);
}
?>
