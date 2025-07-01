<?php
require 'vendor/autoload.php';

// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Include database connection
include "connect.php";

// Include PHPMailer classes
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get form data
    $name = $_POST['uname'];
    $email = $_POST['email'];
    $message = $_POST['message'];

    // Validate form data
    if (!empty($name) && !empty($email) && !empty($message)) {
        // Prepare SQL statement
        $stmt = $conn->prepare("INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $name, $email, $message);

        // Execute the statement
        if ($stmt->execute()) {
            // Send confirmation email
            $mail = new PHPMailer(true);
            try {
                // SMTP configuration
                $mail->isSMTP();                                      // Set mailer to use SMTP
                $mail->Host = 'smtp.gmail.com';                     // Specify main and backup SMTP servers
                $mail->SMTPAuth = true;                               // Enable SMTP authentication
                $mail->Username = 'educareer077@gmail.com';           // SMTP username
                $mail->Password = 'xfxz hefj twdc adhe';              // SMTP password
                $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
                $mail->Port = 587;                                    // TCP port to connect to

                // Recipients
                $mail->setFrom('educareer077@gmail.com', 'EduCareer'); // Sender's email and name
                $mail->addAddress($email); // Add recipient's email

                // Content
                $mail->isHTML(true);
                $mail->Subject = 'Message Sent Successfully , We will contact you soon';
                $mail->Body    = 'Dear ' . htmlspecialchars($name) . ',<br><br>Your message has been sent successfully!<br>Thank you for contacting us.<br><br>Best regards,<br>EduCarrer';

                // Send the email
                $mail->send();
                
                // Return JavaScript to show alert and redirect
                echo "<script>
                        alert('Message sent successfully! A confirmation email has been sent to your email address.');
                        window.location.href = 'Homepage.php';
                      </script>";
                exit();
            } catch (Exception $e) {
                echo json_encode(["status" => "error", "message" => "Message could not be sent. Mailer Error: {$mail->ErrorInfo}"]);
            }

        } else {
            echo json_encode(["status" => "error", "message" => "Error: " . $stmt->error]);
        }

        // Close the statement
        $stmt->close();
    } else {
        echo json_encode(["status" => "error", "message" => "All fields are required."]);
    }
}

// Close the database connection
$conn->close();
?>
