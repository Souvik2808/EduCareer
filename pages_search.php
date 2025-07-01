<?php
include 'connect.php';
$query = $_POST['query'] ?? '';
$type = $_POST['type'] ?? '';

$query = $conn->real_escape_string($query);
$type = $conn->real_escape_string($type);

switch ($type) {
    case 'colleges':
        $sql = "SELECT * FROM colleges WHERE name LIKE '%$query%'";
        $result = $conn->query($sql);
        while ($row = $result->fetch_assoc()) {
            echo "<div class='result-item'>
                    <img src='{$row['image_url']}' alt=''>
                    <a href='{$row['website']}' target='_blank'>{$row['name']}</a>
                  </div>";
        }
        break;

    case 'books':
        $sql = "SELECT * FROM books WHERE title LIKE '%$query%'";
        $result = $conn->query($sql);
        while ($row = $result->fetch_assoc()) {
            echo "<div class='result-item'>
                    <img src='{$row['image_url']}' alt=''>
                    <a href='{$row['link']}' target='_blank'>{$row['title']}</a>
                  </div>";
        }
        break;

    case 'courses':
        $sql = "SELECT * FROM courses WHERE title LIKE '%$query%' OR description LIKE '%$query%'";
        $result = $conn->query($sql);
        while ($row = $result->fetch_assoc()) {
            echo "<div class='result-item'>
                    <a href='{$row['link']}' target='_blank'>{$row['title']}</a>
                  </div>";
        }
        break;

    case 'exams':
        $sql = "SELECT * FROM exams WHERE exam_name LIKE '%$query%' OR exam_description LIKE '%$query%'";
        $result = $conn->query($sql);
        while ($row = $result->fetch_assoc()) {
            echo "<div class='result-item'>
                    <a href='{$row['link']}' target='_blank'>{$row['exam_name']}</a>
                  </div>";
        }
        break;

    case 'schools':
        $sql = "SELECT * FROM schools WHERE name LIKE '%$query%'";
        $result = $conn->query($sql);
        while ($row = $result->fetch_assoc()) {
            echo "<div class='result-item'>
                    <img src='{$row['image_url']}' alt=''>
                    <a href='{$row['website']}' target='_blank'>{$row['name']}</a>
                  </div>";
        }
        break;
}

$conn->close();
?>
