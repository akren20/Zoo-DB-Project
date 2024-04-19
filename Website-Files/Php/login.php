<?php
// Assuming you've already established a database connection and stored it in $conn
require_once 'phpconnect.php';

// Assuming you've already established a database connection and stored it in $conn

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve username and password from the form
    $username = mysqli_real_escape_string($conn, $_POST['register_username']);
    $password = mysqli_real_escape_string($conn, $_POST['register_password']);

    // Query to check if the username exists in the database
    $sql = "SELECT * FROM register WHERE register_username = '$username'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        // Username exists, now verify the password
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['register_password'])) {
            // Password is correct, log in the user
            session_start();
            $_SESSION['username'] = $username;
            
            // Redirect to admin portal if user is an admin
            if ($row['register_type'] == 'Admin') {
                header("Location: https://zoo-db-project.onrender.com/admin-portal.html");
                exit(); // Stop further script execution
            }
            
            // Redirect to employee portal if user is an employee
            if ($row['register_type'] == 'Employee') {
                header("Location: https://zoo-db-project.onrender.com/employee-portal.html");
                exit(); // Stop further script execution
            }
            
            // Redirect to customer portal if user is a customer
            if ($row['register_type'] == 'Customer') {
                header("Location: https://zoo-db-project.onrender.com/customer-portal.html");
                exit(); // Stop further script execution
            }
        } else {
            // Password is incorrect
            echo "Invalid username or password.";
        }
    } else {
        // Username does not exist
        echo "Invalid username or password.";
    }
}

// Close connection
$conn->close();
