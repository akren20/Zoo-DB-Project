<?php
// Retrieve data from the database
require_once 'phpconnect.php';
$sql = "SELECT employee_id, employee_name, employee_age, employee_dob, employee_phone, employee_email, employee_salary FROM employee";


// Format the retrieved data into HTML
$html_output = "<h1>Admin Portal - Employees</h1>";
$html_output .= "<table border='1'>";
$html_output .= "<tr><th>ID</th><th>Name</th><th>Age</th><th>Date Of Birth</th><th>Salary</th></tr>";

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $firstName = $_POST['firstName'];
    $lastName = $_POST['lastName']; //'name entry in the form in html'
    $age = $_POST['Age'];
    $gender = $_POST['Gender'];
    $dob = $_POST['dob'];
    $phoneNumber = $_POST['phonenumber'];
    $email = $_POST['email'];
    $address = $_POST['address'];
    $imageUrl = $_POST['imageUrl']; // Optional

    // Prepare SQL statement to insert data into the database
    $sql = "INSERT INTO employee (employee_name, employee_age, employee_gender, employee_dob, employee_phone, employee_email, employee_address) 
            VALUES ('$firstName $lastName', '$age', '$gender', '$dob', '$phoneNumber', '$email', '$address', '$imageUrl')";


    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

if ($result->num_rows > 0) {
    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        $html_output .= "<tr>";
        $html_output .= "<td>" . $row["employee_id"] . "</td>";
        $html_output .= "<td>" . $row["employee_name"] . "</td>";
        $html_output .= "<td>" . $row["employee_age"] . "</td>";
        $html_output .= "<td>" . $row["employee_dob"] . "</td>";
        $html_output .= "<td>" . $row["employee_salary"] . "</td>";
        $html_output .= "</tr>";
    }
} else {
    $html_output .= "<tr><td colspan='5'>No Employees Found</td></tr>";
}

$html_output .= "</table>";

// Output the HTML
echo $html_output;

// Close the database connection
$conn->close();