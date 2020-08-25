<?php

function jsAlert(string $msg){
    echo "<script> alert('{$msg}'); </script>";
}

function jsLocationReplace(string $url){
    echo "<script> location.replace('{$url}'); </script>";
    exit;
}