<?php

function jsAlert(string $msg){
    echo "<script> alert('{$msg}'); </script>";
}

function jsLocationReplace(string $url){
    echo "<script> location.replace('{$url}'); </script>";
    exit;
}

function jsHistoryBack(){
    echo "<script>history.back();</script>";
    exit;
}

function DB__execute($sql){
    global $config;
    // 외부에서 선언된 $congig 변수를 사용하겠다.
    return mysqli_query($config['dbConn'], $sql);
}

function DB__getDBRows($sql){

    $rs = DB__execute($sql);
    $rows = [];

    while ($row = mysqli_fetch_assoc($rs)){
        $rows[] = $row;
    }

    return $rows;
}

function DB__getDBRow($sql){
    $rows = DB__getDBRows($sql);

    if (isset($rows[0])){
        return $rows[0];
    }
    return [];
}

function filterSqlInjection(&$args){
//  & -> 복사된 값이 아닌 원본 배열의 값을 넘겨받아 수정하겠다.

   foreach ($args as $key => $val){
       $args[$key] = mysqli_real_escape_string($config['dbConn'] , $val);
   }

}