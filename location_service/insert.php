<?php
    include "db.php";

    $manufacturer = isset($_POST["manufacturer"]) ? $_POST["manufacturer"] : "";
    $model = isset($_POST["model"]) ? $_POST["model"] : "";
    $latitude = isset($_POST["latitude"]) ? $_POST["latitude"] : "";
    $longitude = isset($_POST["longitude"]) ? $_POST["longitude"] : "";

    $conn -> query("insert into gsm(manufacturer, model, latitude, longitude)values('".$manufacturer."','".$model."','".$latitude."','".$longitude."')");
?>