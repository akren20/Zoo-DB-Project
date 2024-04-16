<?php
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
            
            // Redirect based on user type
            $user_type = $row['register_type'];
            switch ($user_type) {
                case 'Employee':
                    header("Location: employee-portal.html");
                    break;
                case 'Admin':
                    header("Location: admin-portal.html");
                    break;
                case 'Customer':
                    header("Location: customer-portal.html");
                    break;
                default:
                    // Redirect to a generic dashboard or homepage
                    header("Location: index.html");
            }
            exit();
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
