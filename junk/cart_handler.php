<?php
session_start();
include "connect.php";

header('Content-Type: application/json');
$session_id = session_id();
$response = ['success' => false];

// Add to cart
if ($_POST['action'] === 'add') {
  $bookId = $_POST['book_id'];
  $title = $_POST['book_title'];
  $price = $_POST['book_price'];

  $stmt = $conn->prepare("SELECT id FROM cart WHERE session_id = ? AND book_id = ?");
  $stmt->bind_param("si", $session_id, $bookId);
  $stmt->execute();
  $stmt->store_result();

  if ($stmt->num_rows === 0) {
    $stmt->close();
    $stmt = $conn->prepare("INSERT INTO cart (session_id, book_id, title, price) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("sisd", $session_id, $bookId, $title, $price);
    $stmt->execute();
  }
  $stmt->close();
  $response['success'] = true;
}

// Remove from cart
if ($_POST['action'] === 'remove') {
  $bookId = $_POST['book_id'];
  $stmt = $conn->prepare("DELETE FROM cart WHERE session_id = ? AND book_id = ?");
  $stmt->bind_param("si", $session_id, $bookId);
  $stmt->execute();
  $stmt->close();
  $response['success'] = true;
}

// Build updated cart HTML
$response['hasItems'] = false;
$response['itemsHtml'] = '';
$stmt = $conn->prepare("SELECT title, price, book_id FROM cart WHERE session_id = ?");
$stmt->bind_param("s", $session_id);
$stmt->execute();
$result = $stmt->get_result();
while ($row = $result->fetch_assoc()) {
  $response['hasItems'] = true;
  $response['itemsHtml'] .= '<li>' . htmlspecialchars($row['title']) . ' - ₹' . number_format($row['price'], 2);
  $response['itemsHtml'] .= ' <button class="remove-btn" data-id="' . $row['book_id'] . '">Remove</button></li>';
}
if (!$response['hasItems']) {
  $response['itemsHtml'] = '<li>Your cart is empty.</li>';
}
$stmt->close();

echo json_encode($response);
