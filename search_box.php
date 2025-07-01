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
?>

<!DOCTYPE html>
<html>
<head>
    <title>Live Search</title>
    <link rel="stylesheet" href="CSS/navbar.css">
    <link rel="stylesheet" href="CSS/search.css">
    
</head>
<body>
    <nav class="navbar" >
        <!-- <ul class="edu_links" id="sidebar">
            <li id="close-button" onclick= hideSidebar()><i class="fa-solid fa-xmark" id="close_menu"></i></li>
        </ul> -->
        <ul class="edu_links">
            <li class="edu_list" id="logo_li"><a href="Homepage.php"><img src="Images/EduCareer.png" alt="EduCareer Logo" class="Logo"></a></li>
            <!-- <li id="menu-button" onclick= showSidebar()><i class="fa-solid fa-bars" id="menu_icon"></i></li> -->
        </ul>
    </nav>

    <div class="search-section">
        <div class="container">
            <h2>Live Search: Colleges, Schools, Courses, Exams, Books</h2>
            <input type="text" id="search-box" placeholder="Start typing...">
            <div id="result"></div>
        </div>
    </div>



    <script>
        const searchBox = document.getElementById("search-box");
        const resultBox = document.getElementById("result");

        searchBox.addEventListener("keyup", () => {
            const query = searchBox.value.trim();

            if (query.length > 0) {
                const xhr = new XMLHttpRequest();
                xhr.open("POST", "homepage_search.php", true);
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhr.onload = function () {
                    resultBox.innerHTML = this.responseText;
                };
                xhr.send("query=" + encodeURIComponent(query));
            } else {
                resultBox.innerHTML = "";
            }
        });
    </script>
</body>
</html>
