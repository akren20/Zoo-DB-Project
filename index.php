<?php
// Simple routing mechanism
$path = basename($_SERVER['PHP_SELF']); // Use basename to get the filename from the path

if ($path == "phpconnect.php" || $path == "index.php") {
    include("phpconnect.php");
} else {
    // Handle other paths or show a 404 not found error
    header("HTTP/1.0 404 Not Found");
    echo "Page not found.";
}
exit;