<?php
session_start();
include "connect.php";

$targetImageDir = "uploads/images/";
$targetPdfDir = "uploads/pdfs/";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = trim($_POST['title'] ?? '');
    $publisher = trim($_POST['publisher'] ?? '');
    $price = 0.00; // Fixed price to Free
    $image = $_FILES['image'] ?? null;
    $pdf = $_FILES['pdf'] ?? null;

    // Basic validation
    if (empty($title) || empty($publisher) || !$pdf) {
        $_SESSION['upload_error'] = "Title, publisher, and PDF are required.";
        header("Location: library.php");
        exit;
    }

    // Validate PDF upload
    if ($pdf['type'] !== 'application/pdf') {
        $_SESSION['upload_error'] = "Only PDF files are allowed.";
        header("Location: library.php");
        exit;
    }

    if ($pdf['error'] !== UPLOAD_ERR_OK) {
        $_SESSION['upload_error'] = "Error uploading PDF.";
        header("Location: library.php");
        exit;
    }

    // Create upload folders if not exist
    if (!is_dir($targetImageDir)) mkdir($targetImageDir, 0755, true);
    if (!is_dir($targetPdfDir)) mkdir($targetPdfDir, 0755, true);

    // Handle optional image
    $imagePath = null;
    if ($image && $image['error'] !== UPLOAD_ERR_NO_FILE) {
        $allowedImageTypes = ['image/jpeg', 'image/png', 'image/gif'];
        if (!in_array($image['type'], $allowedImageTypes)) {
            $_SESSION['upload_error'] = "Only JPG, PNG, and GIF images are allowed.";
            header("Location: library.php");
            exit;
        }

        if ($image['error'] !== UPLOAD_ERR_OK) {
            $_SESSION['upload_error'] = "Error uploading image.";
            header("Location: library.php");
            exit;
        }

        $imageExt = pathinfo($image['name'], PATHINFO_EXTENSION);
        $imageFileName = uniqid('img_', true) . '.' . $imageExt;
        $imagePath = $targetImageDir . $imageFileName;

        if (!move_uploaded_file($image['tmp_name'], $imagePath)) {
            $_SESSION['upload_error'] = "Failed to move uploaded image.";
            header("Location: library.php");
            exit;
        }
    }

    // Handle PDF
    $pdfFileName = uniqid('pdf_', true) . '.pdf';
    $pdfPath = $targetPdfDir . $pdfFileName;

    if (!move_uploaded_file($pdf['tmp_name'], $pdfPath)) {
        if ($imagePath) unlink($imagePath);
        $_SESSION['upload_error'] = "Failed to move uploaded PDF.";
        header("Location: library.php");
        exit;
    }

    // Insert into DB
    $stmt = $conn->prepare("INSERT INTO soft_copy_books (title, publisher, price, image, pdf) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("ssdss", $title, $publisher, $price, $imagePath, $pdfPath);

    if ($stmt->execute()) {
        $_SESSION['upload_success'] = "Book uploaded successfully!";
    } else {
        if ($imagePath) unlink($imagePath);
        unlink($pdfPath);
        $_SESSION['upload_error'] = "Database error: " . $stmt->error;
    }

    $stmt->close();
    header("Location: library.php");
    exit;
} else {
    header("Location: library.php");
    exit;
}
?>
