<?php
$servername = "localhost";
$Name = "Name";
$address="Address";
$Email = "Email";
$password = "Password";
$repass="Password";
$dbname = "bus_ms";
$conn = mysqli_connect($servername,$Name, $address, $repass, $Email, $password, $dbname);

if($conn->connect_error){
    die("Unable to connect: ". $conn->connect_error);
}

$query = "INSERT INTO user VALUES Name='".$Name."'AND Address='".$address."' AND Email='".$Email."' AND password='".$password."'";
$result = $conn->query($query);

if($result->num_rows==1){
    echo "Cereta Your Account successfully.";
}
else{
    echo "Username or password incorrect.";
}

?>