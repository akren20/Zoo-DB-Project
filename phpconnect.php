<?php
$username = getenv("MYSQL_USER");   // Fetch from environment variables
$password = getenv("MYSQL_PASSWORD");
$dbname = "zoodb-uma3380";
$socket = getenv("MYSQL_DSN");

// Create connection using UNIX socket
$conn = new mysqli(null, $username, $password, $dbname, null, $socket);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

echo "Connected successfully";
?>
