<?php




$conn = mysqli_connect("localhost", "root", "", "bus_managment");

if($conn->connect_errno > 0){
    die("Unable to connect: ". $conn->connect_error);
}
$query="SELECT bus.ID FROM `bus` WHERE 1";
$result = $conn->query($query);
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "Bus_id: " . $row["ID"]."<br>". " Name: " . $row["Name"]. "<br>"."Source: " . $row["Source"]. "<br>" . " Destination: " . $row["Destination"] ;
    }
} else {
    echo "0 results";
}
$conn->close();

?>