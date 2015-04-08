<?php
require_once "db.php";
exec('taskkill /F /IM "MacroCli.exe"',$superOut,$return_var);
exec('taskkill /F /IM "cmd.exe"',$superOut,$return_var);
exec('taskkill /F /IM "conhost.exe"',$superOut,$return_var);
echo 'aguarde....';
sleep(3);
exec('taskkill /F /IM "excel.exe"',$superOut,$return_var);




// Check connection
echo 1;
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "truncate log;  ";
$result = mysqli_query($conn, $sql);

var_dump($result);

$sql = "truncate stack;  ";
$result = mysqli_query($conn, $sql);

var_dump($result);

$sql = "truncate stackitem;  ";
$result = mysqli_query($conn, $sql);

var_dump($result);

header('Location: /');

