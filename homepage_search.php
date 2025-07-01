<?php
include 'connect.php';

$search = $_POST['query'];
$like = "%$search%";

$results = "";

// Colleges
$stmt = $conn->prepare("SELECT name, image_url, website, 'College' AS type FROM colleges WHERE name LIKE ?");
$stmt->bind_param("s", $like);
$stmt->execute();
$res = $stmt->get_result();
while ($row = $res->fetch_assoc()) {
    $results .= "<div><strong>{$row['type']}:</strong> <img src='{$row['image_url']}' width='40' height='40'> <a href='{$row['website']}' target='_blank'>{$row['name']}</a></div>";
}

// Schools
$stmt = $conn->prepare("SELECT name, image_url, website, 'School' AS type FROM schools WHERE name LIKE ?");
$stmt->bind_param("s", $like);
$stmt->execute();
$res = $stmt->get_result();
while ($row = $res->fetch_assoc()) {
    $results .= "<div><strong>{$row['type']}:</strong> <img src='{$row['image_url']}' width='40' height='40'> <a href='{$row['website']}' target='_blank'>{$row['name']}</a></div>";
}

// Courses
$stmt = $conn->prepare("SELECT title AS name, description, link, 'Course' AS type FROM courses WHERE title LIKE ?");
$stmt->bind_param("s", $like);
$stmt->execute();
$res = $stmt->get_result();
while ($row = $res->fetch_assoc()) {
    $results .= "<div><strong>{$row['type']}:</strong> <a href='{$row['link']}' target='_blank'>{$row['name']}</a> – {$row['description']}</div>";
}

// Exams
$stmt = $conn->prepare("SELECT exam_name AS name, exam_description AS description, link, 'Exam' AS type FROM exams WHERE exam_name LIKE ?");
$stmt->bind_param("s", $like);
$stmt->execute();
$res = $stmt->get_result();
while ($row = $res->fetch_assoc()) {
    $results .= "<div><strong>{$row['type']}:</strong> <a href='{$row['link']}' target='_blank'>{$row['name']}</a> – {$row['description']}</div>";
}

// Books
$stmt = $conn->prepare("SELECT title AS name, image_url, link, 'Book' AS type FROM books WHERE title LIKE ?");
$stmt->bind_param("s", $like);
$stmt->execute();
$res = $stmt->get_result();
while ($row = $res->fetch_assoc()) {
    $results .= "<div><strong>{$row['type']}:</strong> <img src='{$row['image_url']}' width='40' height='40'> <a href='{$row['link']}' target='_blank'>{$row['name']}</a></div>";
}

echo $results ?: "<p>No results found.</p>";
?>
