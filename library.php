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




include "connect.php";

$fmt = new NumberFormatter('en_IN', NumberFormatter::CURRENCY);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>My Library</title>
  <link rel="stylesheet" href="CSS/library.css" />
  <script src="https://kit.fontawesome.com/706f1c7ef6.js" crossorigin="anonymous"></script>
</head>
<body>

<!-- Navbar -->
<nav>
  <ul class="edu_links" id="sidebar">
    <li id="close-button" onclick="hideSidebar()"><button id="close_menu"><i class="fa-solid fa-xmark"></i></button></li>
    <li class="edu_list"><a href="#" class="edu_anchar uploadBtn">Upload</a></li>
    <li class="edu_list"><a href="library_search.php" class="edu_anchar">Search</a></li>
    <li class="edu_list"><a href="logout.php" class="edu_anchar">Logout</a></li>
  </ul>

  <ul class="edu_links">
    <li class="edu_list" id="logo_li"><a href="Homepage.php"><img src="Images/EduCareer.png" alt="EduCareer Logo" class="Logo"></a></li>
    <li class="hideOnMobile " class="edu_list"><a href="#" class="edu_anchar uploadBtn">Upload</a></li>
    <li class="hideOnMobile"class="edu_list"><a href="library_search.php" class="edu_anchar">Search</a></li>
    <li class="hideOnMobile"class="edu_list"><a href="logout.php" class="edu_anchar">Logout</a></li>
    <li id="menu-button" onclick="showSidebar()"><button id="menu_icon"><i class="fa-solid fa-bars"></i></button></li>
  </ul>
</nav>

<!-- Upload Form -->
<div class="upload-form" id="uploadForm" style="display: none;">
  <form action="upload.php" method="POST" enctype="multipart/form-data">
    <h2>Upload Book</h2>
    <input type="text" name="title" placeholder="Title" required>
    <input type="text" name="publisher" placeholder="Publisher" required>
    <label>Price: Free of Cost</label>
    <input type="hidden" name="price" value="0">
    <label for="image_upload" id="upload" name="image">Upload Cover Image</label>
    <input type="file" name="image" id="image_upload" accept="image/*">
    <label for="pdf_upload" id="upload" name="pdf">Upload PDF</label>
    <input type="file"  name="pdf" id="pdf_upload" accept="application/pdf" required>
    <button type="submit">Upload Book</button>
  </form>
</div>

<?php
if (isset($_SESSION['upload_error'])) {
  echo "<script>alert('Error: " . addslashes($_SESSION['upload_error']) . "');</script>";
  unset($_SESSION['upload_error']);
}
if (isset($_SESSION['upload_success'])) {
  echo "<script>alert('Success: " . addslashes($_SESSION['upload_success']) . "');</script>";
  unset($_SESSION['upload_success']);
}
?>

<!-- Main Content -->
<div class="library-wrapper">
  <section class="book-section">
    <h2>Available Free Books</h2>
    <div class="book-container">
      <?php
      echo '<div class="cards">';
      $result = $conn->query("SELECT * FROM soft_copy_books ORDER BY id DESC");
      if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
          echo '<div class="card" >';
          echo '<div class="card-mid" >';
          $imageSrc = !empty($row['image']) ? htmlspecialchars($row['image']) : 'images/placeholder.png';
          echo '<img src="' . $imageSrc . '" alt="' . htmlspecialchars($row['title']) . '">';
          echo '<h2>' . htmlspecialchars($row['title']) . '</h2>';
          echo '<p>Free of Cost</p>';
          echo '<br>';
          echo '</div>';
          echo '<a href="' . htmlspecialchars($row['pdf']) . '" target="_blank" class="card_b">View</a>';
          echo '</div>';
        }
      } else {
        echo '<p>No books found.</p>';
      }
      echo '</div>';
      ?>
    </div>

    <div class="library-wrapper" id="buy_book">
  <section class="book-section">
    <h2>Buy Books Online</h2>
    <div class="book-container">
      <?php
      echo '<div class="cards">';
      $result = $conn->query("SELECT * FROM online_books_buy ORDER BY id DESC");
      if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
          echo '<div class="card">';
          echo '<div class="card-mid">';
          echo '<img src="' . htmlspecialchars($row['image_url']) . '" alt="' . htmlspecialchars($row['title']) . '">';
          echo '<h2>' . htmlspecialchars($row['title']) . '</h2>';
          echo '</div>';
          echo '<a href="' . htmlspecialchars($row['link']) . '" target="_blank" class="card_b">View</a>';
          echo '</div>';
        }
      } else {
        echo '<p>No books found.</p>';
      }
      echo '</div>';
      ?>
    </div>
  </section>
</div>

    </div>
  </section>
</div>

<script>
  // Sidebar
  function showSidebar() {
    const sidebar = document.getElementById('sidebar');
    sidebar.classList.add('active');
  }

  function hideSidebar() {
    const sidebar = document.getElementById('sidebar');
    sidebar.classList.remove('active');
  }

  // Upload form toggle
  const uploadBtns = document.querySelectorAll('.uploadBtn');
  const uploadForm = document.getElementById('uploadForm');
  uploadBtns.forEach(btn => {
    btn.addEventListener('click', function (e) {
      e.preventDefault();
      if (uploadForm.classList.contains('show')) {
        uploadForm.classList.remove('show');
        setTimeout(() => uploadForm.style.display = 'none', 500);
      } else {
        uploadForm.style.display = 'block';
        setTimeout(() => uploadForm.classList.add('show'), 10);
      }
    });
  });
</script>
</body>
</html>
