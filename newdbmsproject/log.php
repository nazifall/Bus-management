<?php
$servername = "localhost";
$Email = "Email";
$password = "Password";
$dbname = "bus_ms";
$conn = mysqli_connect($servername, $Email, $password, $dbname);

if($conn->connect_error){
    die("Unable to connect: ". $conn->connect_error);
}

$query = "SELECT* FROM user where Email='".$Email."' AND password='".$password."'";
$result = $conn->query($query);

if($result->num_rows==1){
    echo "Login Successfull.";
}
else{
    echo "Username or password incorrect.";
}

?>