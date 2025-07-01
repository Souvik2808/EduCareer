<?php
session_start();

// Set timeout duration in seconds (e.g., 10 minutes = 600 seconds)
$timeout_duration = 600; // 10 minutes

// Check if user is logged in
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header('Location: Homepage.php');
    exit;
}

// Check for last activity time
if (isset($_SESSION['LAST_ACTIVITY']) && (time() - $_SESSION['LAST_ACTIVITY']) > $timeout_duration) {
    // Last activity was more than timeout_duration ago
    session_unset();     // Unset $_SESSION variables
    session_destroy();   // Destroy session
    header('Location: index.php?timeout=1');
    exit;
}

// Update last activity time
$_SESSION['LAST_ACTIVITY'] = time();

// Handle AJAX request
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['query'])) {
    // --- Database Connection ---
    include 'connect.php';

    $search = trim($_POST['query']);
    $search = $conn->real_escape_string($search);

    $sql1 = "SELECT title, image_url AS image, link FROM online_books_buy WHERE title LIKE '%$search%'";
    $sql2 = "SELECT title, image, pdf AS link FROM soft_copy_books WHERE section = 'library' AND title LIKE '%$search%'";

    $results = [];

    $result1 = $conn->query($sql1);
    if ($result1 && $result1->num_rows > 0) {
        while ($row = $result1->fetch_assoc()) {
            $row['source'] = 'Buy Online';
            $results[] = $row;
        }
    }

    $result2 = $conn->query($sql2);
    if ($result2 && $result2->num_rows > 0) {
        while ($row = $result2->fetch_assoc()) {
            $row['source'] = 'Library PDF';
            $results[] = $row;
        }
    }

    if (empty($results)) {
        echo '<p>No results found.</p>';
    } else {
        foreach ($results as $book) {
            echo '<div class="result-item">';
            echo '<img src="' . htmlspecialchars($book['image']) . '" alt="' . htmlspecialchars($book['title']) . '">';
            echo '<div>';
            echo '<a href="' . htmlspecialchars($book['link']) . '" target="_blank">' . htmlspecialchars($book['title']) . '</a>';
            echo '<p><strong>' . htmlspecialchars($book['source']) . '</strong></p>';
            echo '</div>';
            echo '</div>';  

        }
    }

    $conn->close();
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Library Live Search</title>
    <link rel="stylesheet" href="CSS/library_search_style.css">
</head>
<body>

<div class="container">
<h2>Search Library Books</h2>
<input type="text" id="search-box" placeholder="Type book title...">

<div id="result"></div></div>

<script>
document.getElementById('search-box').addEventListener('input', function() {
    const query = this.value;

    if (query.length === 0) {
        document.getElementById('result').innerHTML = '';
        return;
    }

    const xhr = new XMLHttpRequest();
    xhr.open('POST', '', true); // Same page
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

    xhr.onload = function () {
        if (xhr.status === 200) {
            document.getElementById('result').innerHTML = xhr.responseText;
        }
    };

    xhr.send('query=' + encodeURIComponent(query));
});
</script>

</body>
</html>
