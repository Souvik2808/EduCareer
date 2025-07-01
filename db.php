<?php

$host="localhost";
$user="root";
$pass="";
$db="EduCareer";
$conn=new mysqli($host,$user,$pass,$db);
if($conn->connect_error){
    echo"Fialed to connect DB",$conn->connect_error;
}
?>