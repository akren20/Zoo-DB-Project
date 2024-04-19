<?php

require_once 'phpconnect.php';
// Retrieve data from the database

$sql = "SELECT * FROM animal";
$result = $conn->query($sql);

// Format the retrieved data into HTML
$html_output = "<h1>Admin Portal - Animals</h1>";
$html_output .= "<table border='1'>";
$html_output .= "<tr><th>ID</th><th>Name</th><th>Species</th><th>Age</th></tr>";

if ($result->num_rows > 0) {
    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        $html_output .= "<tr>";
        $html_output .= "<td>" . $row["animal_id"] . "</td>";
        $html_output .= "<td>" . $row["animal_name"] . "</td>";
        $html_output .= "<td>" . $row["species"] . "</td>";
        $html_output .= "<td>" . $row["age"] . "</td>";
        $html_output .= "</tr>";
    }
} else {
    $html_output .= "<tr><td colspan='4'>No animals found</td></tr>";
}

$html_output .= "</table>";

// Output the HTML
echo $html_output;

// Close the database connection
$conn->close();

