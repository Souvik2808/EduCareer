<?php
session_start();

$timeout_duration = 600; // 10 minutes

if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header('Location: Homepage.php');
    exit;
}

if (isset($_SESSION['LAST_ACTIVITY']) && (time() - $_SESSION['LAST_ACTIVITY']) > $timeout_duration) {
    session_unset();     
    session_destroy();   
    header('Location: index.php?timeout=1');
    exit;
}

$_SESSION['LAST_ACTIVITY'] = time();

include 'connect.php'; 

$sql = "SELECT exam_name, exam_description, link FROM exams";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exams</title>
    <link rel="stylesheet" href="CSS/navbar_1.css">
    <link rel="stylesheet" href="CSS/style.css">
</head>
<body>

<nav class="navbar" >
            <ul class="edu_links" id="sidebar">
                <li id="close-button" onclick= hideSidebar()><i class="fa-solid fa-xmark" id="close_menu"></i></li>
                <li class="edu_list"><a href="search_exams.php" class="edu_anchar">Search</a></li>
                <li class="edu_list"><a href="logout.php" class="edu_anchar">Logout</a></li>
            </ul>
            <ul class="edu_links">
                <li class="edu_list" id="logo_li"><a href="Homepage.php"><img src="images/EduCareer.png" alt="EduCareer Logo" class="Logo"></a></li>
                <li class="hideOnMobile" class="edu_list"><a href="search_exams.php" class="edu_anchar" id="search_btn">Search</a></li>
                <li class="hideOnMobile" class="edu_list"><a href="logout.php" class="edu_anchar" id="login_btn">Logout</a></li>
                <li id="menu-button" onclick= showSidebar()><i class="fa-solid fa-bars" id="menu_icon"></i></li>
            </ul>
        
    </nav>
<!-- Main Section for Exams -->
<main>
    <section class="contentSection" id="exams">
        <div class="container">
            <div class="cards">
                <?php
                if ($result && $result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo '<div class="card">';
                        echo '    <h2>' . htmlspecialchars($row['exam_name']) . '</h2>';
                        echo '    <p>' . htmlspecialchars($row['exam_description']) . '</p>';
                        echo '    <a href="' . htmlspecialchars($row['link']) . '" target="_blank">Read More</a>';
                        echo '</div>';
                    }
                } else {
                    echo '<p>No exams found.</p>';
                }
                ?>
            </div>
        </div>
    </section>
</main>

</body>
</html>
