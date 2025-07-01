<?php
session_start();

$timeout_duration = 600; // 10 minutes

// Check if user is logged in
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

// Update last activity time
$_SESSION['LAST_ACTIVITY'] = time();
?>

<?php
include "connect.php";
$sql = "SELECT image_url, alt_text, caption, link_url FROM slides";
$sql2 ="SELECT image_url, name, courses_offered, website FROM colleges LIMIT 8";
$sql3 = "SELECT title, description, link FROM courses LIMIT 4";
$sql4 = "SELECT exam_name, exam_description, link FROM exams LIMIT 4";
$sql5 = "SELECT name, image_url, website FROM schools LIMIT 4";
$sql6 = "SELECT title, image_url, link FROM books LIMIT 4";
$sql7 = "SELECT exam_name,link FROM top_exams LIMIT 10";

$result = $conn->query($sql);
$result2 = $conn->query($sql2);
$result3 = $conn->query($sql3);
$result4 = $conn->query($sql4);
$result5 = $conn->query($sql5);
$result6 = $conn->query($sql6);
$result7 = $conn->query($sql7);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduCareer</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="stylesheet" href="CSS/slider.css">
</head>
<body>
    <nav class="navbar" >
            <ul class="edu_links" id="sidebar">
                <li id="close-button" onclick= hideSidebar()><i class="fa-solid fa-xmark" id="close_menu"></i></li>
                <li class="edu_list"><a href="#colleges" class="edu_anchar">Colleges</a></li>
                <li class="edu_list"><a href="#courses" class="edu_anchar">Courses</a></li>
                <li class="edu_list"><a href="#exams" class="edu_anchar">Exams</a></li>
                <li class="edu_list"><a href="#contact" class="edu_anchar">Contact</a></li>
                <li class="edu_list"><a href="library.php" class="edu_anchar">Library</a></li>
                <li class="edu_list"><a href="mock_test.php" class="edu_anchar">Mock Test</a></li>
                <li class="edu_list"><a href="search_box.php" class="edu_anchar">Search</a></li>
                <li class="edu_list"><a href="logout.php" class="edu_anchar">Logout</a></li>
            </ul>
            <ul class="edu_links">
                <li class="edu_list" id="logo_li"><a href="Homepage.php"><img src="images/EduCareer.png" alt="EduCareer Logo" class="Logo"></a></li>
                <li class="hideOnMobile" class="edu_list" ><a href="#colleges" class="edu_anchar">Colleges</a></li>
                <li class="hideOnMobile" class="edu_list" ><a href="#courses" class="edu_anchar">Courses</a></li>
                <li class="hideOnMobile" class="edu_list" ><a href="#exams" class="edu_anchar">Exams</a></li>
                <li class="hideOnMobile" class="edu_list" ><a href="#contact" class="edu_anchar">Contact</a></li>
                <li class="hideOnMobile" class="edu_list" ><a href="library.php" class="edu_anchar">Library</a></li>
                <li class="hideOnMobile" class="edu_list" ><a href="mock_test.php" class="edu_anchar">Mock Test</a></li>
                <li class="hideOnMobile" class="edu_list"><a href="search_box.php" class="edu_anchar" id="search_btn">Search</a></li>
                <li class="hideOnMobile" class="edu_list"><a href="logout.php" class="edu_anchar" id="login_btn">Logout</a></li>
                <li id="menu-button" onclick= showSidebar()><i class="fa-solid fa-bars" id="menu_icon"></i></li>
            </ul>
        
    </nav>

    <section class="slider-Container">
        <div class="slider-Sec">
            <div class="slider" id="sliderTrack">
                <?php
                if ($result && $result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo '<div class="slides">';
                        echo '<img src="' . htmlspecialchars($row['image_url']) . '" alt="' . htmlspecialchars($row['alt_text']) . '" />';
                        echo '<div class="caption">';
                        echo htmlspecialchars($row['caption']);
                        echo ' <a href="' . htmlspecialchars($row['link_url']) . '">View Details</a>';
                        echo '</div>';
                        echo '</div>';
                    }
                } else {
                    echo '<p>No slides found.</p>';
                }
                ?>
            </div>
            <div class="controls">
                <button id="prev">&#10094;</button>
                <button id="next">&#10095;</button>
            </div>
        </div>  
    </section>
    <main>
        <section class="contentSection" id="colleges">
            <div class="container">
                <div class="section-header">
                    <h2 class="tittle-ex">Top Colleges</h2>
                    <a id="viewMoreBtn" href="colleges.php">View More &#10095; &#10095;</a>
                </div>
                <div class="cards">
                    <?php
                        
                        if ($result2 && $result2->num_rows > 0) {
                            while ($row = $result2->fetch_assoc()) {
                                echo '<div class="card">';
                                echo '  <div class="card-mid">';
                                echo '      <img src="' . htmlspecialchars($row['image_url']) . '" alt="' . htmlspecialchars($row['name']) . '">';
                                echo '      <h2>' . htmlspecialchars($row['name']) . '</h2>';
                                echo '      <p>' . htmlspecialchars($row['courses_offered']) . '</p>';
                                echo '  </div>';
                                echo '  <button><a href="' . htmlspecialchars($row['website']) . '" target="_blank">Visit Website</a></button>';
                                echo '</div>';
                            }
                        } else {
                            echo '<p>No university cards found.</p>';
                        }
                    ?>
                </div>
            </div>
        </section>

        <section id="schools" class="school-section">
            <div class="container">
            <div class="section-header">
                <h2 class="tittle-ex">Top Schools</h2>
                <a id="viewMoreBtn" href="schools.php">View More &#10095; &#10095;</a>
            </div>
            <div class="cards">
            
              <?php
                if ($result5 && $result5->num_rows > 0) {
                    while ($row = $result5->fetch_assoc()) {
                        echo '<div class="card">';
                        echo '  <div class="sch-mid">';
                        echo '    <img src="' . htmlspecialchars($row['image_url']) . '" alt="' . htmlspecialchars($row['name']) . '">';
                        echo '    <h2>' . htmlspecialchars($row['name']) . '</h2>';
                        echo '  </div>';
                        echo '  <button><a href="' . htmlspecialchars($row['website']) . '" target="_blank">Visit Website</a></button>';
                        echo '</div>';
                    }
                } else {
                    echo '<p>No schools found.</p>';
                }
                ?>
            </div>
        </div>
          </section>
          
        <section class="collegeSec" id="courses" >
            <div class="container">
            <div class="section-header">
                <h2 class="tittle-ex" >Courses</h2>
                <a id="viewMoreBtn" href="courses.php">View More &#10095; &#10095;</a>
            </div>
            <div class="cards">
                <?php
            if ($result3 && $result3->num_rows > 0) {
                while ($row = $result3->fetch_assoc()) {
                    echo '<div class="card">';
                    echo '<h2>' . htmlspecialchars($row['title']) . '</h2>';
                    echo '<p>' . htmlspecialchars($row['description']) . '</p>';
                    echo '<button><a href="' . htmlspecialchars($row['link']) . '" target="_blank">Explore</a></button>';
                    echo '</div>';
                }
            } else {
                echo '<p>No courses found.</p>';
            }
            ?>
            </div>
            </div>
        </section>

        <section id="exams" class="collegeSec">
            <div class="container">
            <div class="section-header">
                <h2 class="tittle-ex">Exams</h2>
                <a id="viewMoreBtn" href="exams.php">View More &#10095; &#10095;</a>
            </div>
            <div class="cards" >
                <?php
                    if ($result4 && $result4->num_rows > 0) {
                        while ($row = $result4->fetch_assoc()) {
                            echo '<div class="card">';
                            echo '<h2>' . htmlspecialchars($row['exam_name']) . '</h2>';
                            echo '<button><a href="' . htmlspecialchars($row['link']) . '" target="_blank">Read More</a></button>';
                            echo '</div>';
                        }
                    } else {
                        echo '<p>No exams found.</p>';
                    }
                ?>
            </div>
            </div>
        </section>
        <section id="exm" class="exm-sec">
            <div class="list-exm">
                <div class="t-exm">
                <!-- <div class="section-header"> -->
                    <h2 class="tittle-ex">Top Exams this month</h2>
                    <!-- <a id="viewMoreBtn">View More &#10095; &#10095;</a> -->
                <!-- </div> -->
                <div class="contentSec">
                    <ul class="taglist">
                        <?php
                        if ($result7 && $result7->num_rows > 0) {
                            while ($row = $result7->fetch_assoc()) {
                                echo '<li>';
                                echo '<a class="exms" href="' . htmlspecialchars($row['link']) . '">' . htmlspecialchars($row['exam_name']) . '</a>';
                                echo '</li>';
                            }
                        } else {
                            echo '<li><p>No exams found.</p></li>';
                        }
                        ?>
                    </ul>
                </div>

            </div>
        </section>
        <section id="book-suggestions">
            <div class="container">
            <div class="section-header">
                <h2 class="tittle-ex">Exam Book Suggestions</h2>
                <a id="viewMoreBtn" href="books.php">View More &#10095; &#10095;</a>
            </div>
            <div class="book-container">
              <div class="book-grid">
                <?php
                    if ($result6 && $result6->num_rows > 0) {
                        while ($row = $result6->fetch_assoc()) {
                            echo '<div class="book-card">';
                            echo '<div class="card-mid">';
                            echo '    <img src="' . htmlspecialchars($row['image_url']) . '" alt="' . htmlspecialchars($row['title']) . '">';
                            echo '<h3>' . htmlspecialchars($row['title']) . '</h3>';
                            echo '</div>';
                            echo '<button><a href="' . htmlspecialchars($row['link']) . '" class="book-link" target="_blank">View Details</a></button>';
                            echo '</div>';
                        }
                    } else {
                        echo '<p>No schools found.</p>';
                    }
                ?>
              </div>
            </div>
            </div>
          </section>
          
    <!-- About Us Section -->
    <section id="about">
        <div class="container">
            <h2>About EduCareer</h2>
            <p>At EduCareer, we believe in empowering individuals with the skills needed to thrive in today's fast-paced digital world.</p>
        </div>
    </section>
    <!-- Contact Section -->
    <section id="contact">
    <div class="container">
        <h2>Contact Us</h2>
        <form action="contact_email.php" method="post">
            <input type="text" id="uname" name="uname" placeholder="Your Name" required>
            <input type="email" id="email" name="email" placeholder="Your Email" required>
            <textarea id="message" name="message" placeholder="Your Message" required></textarea>
            <button type="submit" id="submit-btn">Send Message</button>
        </form>
    </div>
    </section>

</main>

<!-- Footer -->
<footer>
    <p>&copy; 2024 EduCareer. All rights reserved.</p>
</footer>
    </main>

    <script src="JS/slider.js"></script>
    <script src="https://kit.fontawesome.com/706f1c7ef6.js" crossorigin="anonymous"></script>
    <script>
       function showSidebar() {
  const sidebar = document.getElementById('sidebar');
  sidebar.classList.add('active');
}

function hideSidebar() {
  const sidebar = document.getElementById('sidebar');
  sidebar.classList.remove('active');
}

    </script>

    
</body>
</html>