<?php
session_start();
require 'db.php';
require 'send_email.php';

if (!isset($_SESSION['email'])) {
    header('Location: index.php');
    exit;
}

$email = $_SESSION['email'];

// Generate new OTP and expiry
$otp = rand(100000, 999999);
$otp_expiry = date("Y-m-d H:i:s", strtotime('+10 minutes'));

// Update OTP in DB
$stmt = $pdo->prepare('UPDATE users SET otp = ?, otp_expiry = ? WHERE email = ? AND verified = 1');
$stmt->execute([$otp, $otp_expiry, $email]);

// Resend OTP email
if (sendOTPEmail($email, $otp)) {
    $_SESSION['message'] = "New OTP has been sent to your email.";
} else {
    $_SESSION['error'] = "Failed to send OTP email. Please try again.";
}

header('Location: verify_otp_login.php');
exit;
?>
