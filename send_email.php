<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;


require 'vendor/autoload.php';

function sendOTPEmail($email, $otp) {
    $mail = new PHPMailer(true);
    try {
        //Server settings
        //$mail->SMTPDebug = 2;                               // Enable verbose debug output
        $mail->isSMTP();                                      // Set mailer to use SMTP
        $mail->Host = 'smtp.gmail.com';                     // Specify main and backup SMTP servers
        $mail->SMTPAuth = true;                               // Enable SMTP authentication
        $mail->Username = 'educareer077@gmail.com';           // SMTP username
        $mail->Password = 'xfxz hefj twdc adhe';              // SMTP password
        $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
        $mail->Port = 587;                                    // TCP port to connect to

        //Recipients
        $mail->setFrom('educareer077@gmail.com', 'EduCareer');
        $mail->addAddress($email);

        //Content
        $mail->isHTML(true);                                  // Set email format to HTML
        $mail->Subject = 'Your OTP for Email Verification';
        $mail->Body    = "<h2>Your OTP is: <b>$otp</b></h2><p>This OTP is valid for 10 minutes.</p>";
        $mail->AltBody = "Your OTP is: $otp. This OTP is valid for 10 minutes.";

        $mail->send();
        return true;
    } catch (Exception $e) {
        error_log("Message could not be sent. Mailer Error: {$mail->ErrorInfo}");
        return false;
    }
}
?>
