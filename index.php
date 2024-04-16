<?php
// Simple routing mechanism
$path = $_SERVER['PHP_SELF'];
if ($path == "/phpconnect.php" || $path == "/") {
    include("phpconnect.php");
} else {
    // Handle other paths or show a 404 not found error
    header("HTTP/1.0 404 Not Found");
    echo "Page not found.";
}
?>