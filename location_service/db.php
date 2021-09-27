<?php
    $conn = new mysqli("srvc65.turhost.com","kargalii_omerp","4812Op..&","kargalii_study");
    $conn -> set_charset("utf8");
    if($conn -> connect_errno){
        printf("Veritabanına bağlanılamadı.", $conn -> connect_errno);
        exit();
    }
?>