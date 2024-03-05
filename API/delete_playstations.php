<?php
require '../config/config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    # code ..
    $response = array ();
    $id_ps = $_POST['id_ps'];

        $insert = "DELETE FROM playstations WHERE id_ps ='$id_ps'";
    if (mysqli_query($con, $insert)){
        # code ..
        $response['value']=1;
        $response['message']='Berhasil Dihapus';
        echo json_encode($response);
    } else{
        # code ..
        $response['value']=0;
        $response['message']='Gagal Dihapus';
        echo json_encode($response);
    }
    
}
?>
