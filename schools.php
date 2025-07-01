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

$sql = "SELECT name, image_url, website FROM schools";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Schools</title>
    <link rel="stylesheet" href="CSS/navbar_1.css">
    <link rel="stylesheet" href="CSS/style.css">
</head>
<body>

<nav class="navbar" >
            <ul class="edu_links" id="sidebar">
                <li id="close-button" onclick= hideSidebar()><i class="fa-solid fa-xmark" id="close_menu"></i></li>
                <li class="edu_list"><a href="  search_school.php" class="edu_anchar">Search</a></li>
                <li class="edu_list"><a href="logout.php" class="edu_anchar">Logout</a></li>
            </ul>
            <ul class="edu_links">
                <li class="edu_list" id="logo_li"><a href="Homepage.php"><img src="images/EduCareer.png" alt="EduCareer Logo" class="Logo"></a></li>
                <li class="hideOnMobile" class="edu_list"><a href="search_school.php" class="edu_anchar" id="search_btn">Search</a></li>
                <li class="hideOnMobile" class="edu_list"><a href="logout.php" class="edu_anchar" id="login_btn">Logout</a></li>
                <li id="menu-button" onclick= showSidebar()><i class="fa-solid fa-bars" id="menu_icon"></i></li>
            </ul>
        
    </nav>
<main>
    <section class="contentSection" id="schools">
        <div class="container">
            <div class="cards">
                <?php
                if ($result && $result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo '<div class="card">';
                        echo '    <img src="' . htmlspecialchars($row['image_url']) . '" alt="Photo of ' . htmlspecialchars($row['name']) . '">';
                        echo '    <h2>' . htmlspecialchars($row['name']) . '</h2>';
                        echo '    <a href="' . htmlspecialchars($row['website']) . '" target="_blank">Visit Website</a>';
                        echo '</div>';
                    }
                } else {
                    echo '<p>No schools found.</p>';
                }
                ?>
            </div>
        </div>
    </section>
</main>

</body>
</html>
