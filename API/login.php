<?php
require '../config/config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $response = array();
    $username = $_POST['username'];
    $password = md5($_POST['password']);

    $cek = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
    $result = mysqli_query($con, $cek);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);

        $response['value'] = 1;
        $response['message'] = 'Login Berhasil';
        $response['username'] = $user['username'];
        $response['nama'] = $user['nama'];
        $response['id'] = $user['id'];
        $response['level'] = $user['level'];
        echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = 'Login Gagal';
        echo json_encode($response);
    }
}
?>
