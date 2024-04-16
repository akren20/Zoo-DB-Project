
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize form data
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $address = mysqli_real_escape_string($conn, $_POST['address']);
    $birthdate = mysqli_real_escape_string($conn, $_POST['birthdate']);

    // Construct SQL query
    $sql = "INSERT INTO your_table_name (name, address, birthdate) VALUES ('$name', '$address', '$birthdate')";

    // Execute SQL query
    if ($conn->query($sql) === TRUE) {
        echo "New tuple created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Close connection
$conn->close();