<?php
session_start();
$error = $_SESSION['error'] ?? '';
$message = $_SESSION['message'] ?? '';
unset($_SESSION['error'], $_SESSION['message']);
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title> Signup & Login Page with Email OTP Verification</title>
<link rel="stylesheet" href="CSS/sty.css">

</head>
<body>
  <div class="container">
    <?php if ($error): ?>
      <div class="error"><?php echo htmlspecialchars($error); ?></div>
    <?php endif; ?>
    <?php if ($message): ?>
      <div class="message"><?php echo htmlspecialchars($message); ?></div>
    <?php endif; ?>
    <div class="form-wrapper" id="form-wrapper">
      <div class="form-box" id="signup-box">
        <h2>Sign Up</h2>
        <form method="post" action="signup.php" id="signup-form">
          <input type="email" name="email" placeholder="Email" required />
          <input type="password" name="password" placeholder="Password (min 6)" minlength="6" required />
          <input type="password" name="confirm_password" placeholder="Confirm Password" minlength="6" required />
          <button type="submit">Register</button>
        </form>
        <div class="toggle" id="to-login">Already have an account? Login</div>
      </div>
      <div class="form-box" id="login-box">
        <h2>Login</h2>
        <form method="post" action="login.php" id="login-form">
          <input type="email" name="email" placeholder="Email" required />
          <button type="submit">Send OTP</button>
        </form>
        <div class="toggle" id="to-signup">Don't have an account? Sign Up</div>
      </div>
    </div>
  </div>

  <script>
    document.addEventListener("DOMContentLoaded", function () {
    const signupBox = document.getElementById("signup-box");
    const loginBox = document.getElementById("login-box");
    const toLogin = document.getElementById("to-login");
    const toSignup = document.getElementById("to-signup");

    // Initially show signup, hide login
    loginBox.style.display = "none";

    toLogin.addEventListener("click", function () {
      signupBox.style.display = "none";
      loginBox.style.display = "block";
    });

    toSignup.addEventListener("click", function () {
      loginBox.style.display = "none";
      signupBox.style.display = "block";
    });
  });
  </script>
</body>
</html>
