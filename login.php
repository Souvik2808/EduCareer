<?php
session_start();
require 'db.php';
require 'send_email.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = filter_var($_POST['email'], FILTER_VALIDATE_EMAIL);

    if (!$email) {
        $_SESSION['error'] = "Invalid email address.";
        header('Location: index.php');
        exit;
    }

    // Check if user exists and verified
    $stmt = $pdo->prepare('SELECT id FROM users WHERE email = ? AND verified = 1');
    $stmt->execute([$email]);
    $user = $stmt->fetch();

    if (!$user) {
        $_SESSION['error'] = "Email not registered or not verified.";
        header('Location: index.php');
        exit;
    }

    // Generate OTP and expiry (10 minutes)
    $otp = rand(100000, 999999);
    $otp_expiry = date("Y-m-d H:i:s", strtotime('+10 minutes'));

    // Save OTP to DB
    $stmt = $pdo->prepare('UPDATE users SET otp = ?, otp_expiry = ? WHERE id = ?');
    $stmt->execute([$otp, $otp_expiry, $user['id']]);

    // Send OTP email
    if (sendOTPEmail($email, $otp)) {
        $_SESSION['email'] = $email;
        $_SESSION['message'] = "OTP sent to your email. Please verify to login.";
        header('Location: verify_otp_login.php');
        exit;
    } else {
        $_SESSION['error'] = "Failed to send OTP email. Please try again.";
        header('Location: index.php');
        exit;
    }
} else {
    header('Location: index.php');
    exit;
}
?>
