<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize form data
    $firstname = mysqli_real_escape_string($conn, $_POST['fname']);
    $lastname = mysqli_real_escape_string($conn, $_POST['lname']);
    $usertype = mysqli_real_escape_string($conn, $_POST['user-type']);
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    // Construct SQL query
    $sql = "INSERT INTO register (register_fname, register_lname, register_type, register_username, register_password) 
            VALUES ('$firstname', '$lastname', '$usertype', '$username', '$password')";

    // Execute SQL query
    if ($conn->query($sql) === TRUE) {
        echo "New tuple created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Close connection
$conn->close();
