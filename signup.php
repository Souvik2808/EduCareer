<?php
session_start();
require 'db.php';
require 'send_email.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = filter_var($_POST['email'], FILTER_VALIDATE_EMAIL);
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];

    if (!$email) {
        $_SESSION['error'] = "Invalid email address.";
        header('Location: index.php');
        exit;
    }
    if (strlen($password) < 6) {
        $_SESSION['error'] = "Password must be at least 6 characters.";
        header('Location: index.php');
        exit;
    }
    if ($password !== $confirm_password) {
        $_SESSION['error'] = "Passwords do not match.";
        header('Location: index.php');
        exit;
    }

    // Check if email already exists
    $stmt = $pdo->prepare('SELECT id FROM users WHERE email = ?');
    $stmt->execute([$email]);
    if ($stmt->fetch()) {
        $_SESSION['error'] = "Email already registered.";
        header('Location: index.php');
        exit;
    }

    // Generate OTP and expiry (10 minutes)
    $otp = rand(100000, 999999);
    $otp_expiry = date("Y-m-d H:i:s", strtotime('+10 minutes'));
    $password_hash = password_hash($password, PASSWORD_DEFAULT);

    // Save user with unverified status
    $stmt = $pdo->prepare('INSERT INTO users (email, password, otp, otp_expiry, verified) VALUES (?, ?, ?, ?, 0)');
    $stmt->execute([$email, $password_hash, $otp, $otp_expiry]);

    // Send OTP email
    if (sendOTPEmail($email, $otp)) {
        $_SESSION['email'] = $email;
        $_SESSION['message'] = "OTP has been sent to your email. Please verify.";
        header('Location: verify_otp.php');
        exit;
    } else {
        $_SESSION['error'] = "Failed to send OTP email. Please try again.";
        header('Location: index.php');
        exit;
    }
} else {
    header('Location: Login.php');
    exit;
}
?>
