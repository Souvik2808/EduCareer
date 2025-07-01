<?php
session_start();
require 'db.php';

if (!isset($_SESSION['email'])) {
    header('Location: index.php');
    exit;
}

$message = '';
$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $otp = $_POST['otp'];
    $email = $_SESSION['email'];

    // Check OTP
    $stmt = $pdo->prepare('SELECT id, otp_expiry FROM users WHERE email = ? AND otp = ? AND verified = 0');
    $stmt->execute([$email, $otp]);
    $user = $stmt->fetch();

    if ($user) {
        $now = date("Y-m-d H:i:s");
        if ($now > $user['otp_expiry']) {
            $error = "OTP expired. Please resend OTP.";
        } else {
            // Mark user verified and clear OTP fields
            $stmt = $pdo->prepare('UPDATE users SET verified = 1, otp = NULL, otp_expiry = NULL WHERE id = ?');
            $stmt->execute([$user['id']]);
            unset($_SESSION['email']);
            $_SESSION['message'] = "Email verified successfully! You can now login.";
            header('Location: index.php');
            exit;
        }
    } else {
        $error = "Invalid OTP.";
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Verify OTP - Signup/Login</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');
  body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg,#667eea, #764ba2);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin:0;
  }
  .container {
    background: #ffffffee;
    padding: 30px 40px;
    border-radius: 15px;
    box-shadow: 0 15px 25px rgba(0,0,0,0.3);
    width: 90%;
    max-width: 400px;
    text-align: center;
    animation: fadeInUp 0.8s ease forwards;
  }
  h2 {
    margin-bottom: 25px;
    font-weight: 600;
    color: #48237a;
  }
  input[type="text"] {
    width: 100%;
    box-sizing: border-box;
    padding: 12px 15px;
    margin: 10px 0 20px;
    border: 2px solid #764ba2;
    border-radius: 8px;
    font-size: 16px;
    outline: none;
    transition: border-color 0.3s ease;
  }
  input[type="text"]:focus {
    border-color: #667eea;
  }
  button {
    background: #764ba2;
    color: #fff;
    padding: 12px 25px;
    border: none;
    border-radius:8px;
    cursor: pointer;
    font-size: 16px;
    font-weight: 600;
    transition: background-color 0.3s ease;
  }
  button:hover {
    background: #667eea;
  }
  .error {
    background: #ffdddd;
    color: #b00000;
    border-radius: 8px;
    padding: 10px;
    margin-bottom: 15px;
  }
  .message {
    background: #ddffdd;
    color: #0a7a00;
    border-radius: 8px;
    padding: 10px;
    margin-bottom: 15px;
  }
  @keyframes fadeInUp {
    0% {
      opacity: 0;
      transform: translateY(20px);
    }
    100% {
      opacity: 1;
      transform: translateY(0);
    }
  }
</style>
</head>
<body>
  <div class="container">
    <h2>Verify Your OTP</h2>
    <?php if ($error): ?>
        <div class="error"><?php echo htmlspecialchars($error); ?></div>
    <?php endif; ?>
    <form method="post">
      <input type="text" name="otp" placeholder="Enter OTP" required pattern="\d{6}" maxlength="6" />
      <button type="submit">Verify OTP</button>
    </form>
    <form method="post" action="resend_otp.php" style="margin-top:15px;">
      <button type="submit" style="background:#48237a;">Resend OTP</button>
    </form>
  </div>
</body>
</html>
