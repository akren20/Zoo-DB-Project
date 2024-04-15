<?php
$servername = "bubbly-domain-420411:us-south1:zoodb-uma3380";
$username = "admin";
$password = "admin123";
$dbname = "zoodb-uma3380";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

echo "Connected successfully";
?>
