<?php
// Retrieve data from the database
$sql = "SELECT * FROM employee";
$result = $conn->query($sql);

// Format the retrieved data into HTML
$html_output = "<h1>Admin Portal - Products</h1>";
$html_output .= "<table border='1'>";
$html_output .= "<tr><th>ID</th><th>Name</th><th>Price</th></tr>";

if ($result->num_rows > 0) {
    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        $html_output .= "<tr>";
        $html_output .= "<td>" . $row["id"] . "</td>";
        $html_output .= "<td>" . $row["name"] . "</td>";
        $html_output .= "<td>" . $row["price"] . "</td>";
        $html_output .= "</tr>";
    }
} else {
    $html_output .= "<tr><td colspan='3'>No Employees Found</td></tr>";
}

$html_output .= "</table>";

// Output the HTML
echo $html_output;

// Close the database connection
$conn->close();

