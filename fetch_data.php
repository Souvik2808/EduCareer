<?php
include 'connect.php'; 

$type = $_GET['type'] ?? '';

$data = [];

switch ($type) {
    case 'colleges':
        $sql = "SELECT name, image_url, courses_offered, website FROM colleges";
        break;
    case 'courses':
        $sql = "SELECT title, description, link FROM courses";
        break;
    case 'books':
        $sql = "SELECT title, image_url, link FROM books";
        break;
    case 'exams':
        $sql = "SELECT exam_name, exam_description, link FROM exams";
        break;
    case 'schools':
        $sql = "SELECT name, image_url, website FROM schools";
        break;
    default:
        echo json_encode([]);
        exit;
}

$result = mysqli_query($conn, $sql);

while ($row = mysqli_fetch_assoc($result)) {
    $data[] = $row;
}

echo json_encode($data);
?>
