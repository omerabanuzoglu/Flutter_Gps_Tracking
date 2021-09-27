<?php
    $conn = new mysqli("localhost","root","","");
    $conn -> set_charset("utf8");
    if($conn -> connect_errno){
        printf("Veritabanına bağlanılamadı.", $conn -> connect_errno);
        exit();
    }
?>