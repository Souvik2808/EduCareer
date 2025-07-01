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
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Live Search</title>
  <link rel="stylesheet" href="CSS/search_1.css">
</head>
<body>
  <div class="container" data-type="books"> 
    <h2>Live Search Books</h2>
    <input type="text" id="search-box" placeholder="Start searching...">
    <div id="result"></div>
  </div>

  <script>
    const searchBox = document.getElementById("search-box");
    const resultBox = document.getElementById("result");
    const dataType = document.querySelector(".container").getAttribute("data-type");

    searchBox.addEventListener("keyup", () => {
      const query = searchBox.value.trim();
      if (query.length > 0) {
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "pages_search.php", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onload = function () {
          resultBox.innerHTML = this.responseText;
        };
        xhr.send(`query=${encodeURIComponent(query)}&type=${encodeURIComponent(dataType)}`);
      } else {
        resultBox.innerHTML = "";
      }
    });
  </script>
</body>
</html>
