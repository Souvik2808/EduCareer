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

<?php
include "connect.php";


$categories = [];
$catQuery = "SELECT DISTINCT category FROM questions";
$catResult = $conn->query($catQuery);
while ($row = $catResult->fetch_assoc()) {
    $categories[] = $row['category'];
}

// Handle category selection
$selectedCategory = $_POST['category'] ?? null;
$_SESSION['questions'] = [];

if ($selectedCategory) {
    $stmt = $conn->prepare("SELECT * FROM questions WHERE category = ? ORDER BY RAND() LIMIT 10");
    $stmt->bind_param("s", $selectedCategory);
    $stmt->execute();
    $result = $stmt->get_result();
    while ($row = $result->fetch_assoc()) {
        $_SESSION['questions'][] = $row;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Mock Test by Category</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="CSS/mock_test.css">

    <script>
        let totalTime = 120;

        function startTimer() {
            let timer = setInterval(() => {
                let minutes = Math.floor(totalTime / 60);
                let seconds = totalTime % 60;
                seconds = seconds < 10 ? "0" + seconds : seconds;
                document.getElementById("timer").innerHTML = `${minutes}:${seconds}`;
                totalTime--;
                if (totalTime < 0) {
                    clearInterval(timer);
                    document.getElementById("quizForm").submit();
                }
            }, 1000);
        }

        window.onload = () => {
            if (document.getElementById("quizForm")) startTimer();
        };
    </script>
</head>
<body>
    <h2>Category-wise Mock Test</h2>

    <?php if (!$selectedCategory): ?>
        <form method="post">
            <div style="text-align: center;">
                <label for="category"><strong>Select Category:</strong></label>
                <select name="category" id="category" required>
                    <option value="">-- Choose --</option>
                    <?php foreach ($categories as $cat): ?>
                        <option value="<?= htmlspecialchars($cat) ?>"><?= htmlspecialchars($cat) ?></option>
                    <?php endforeach; ?>
                </select>
                <button type="submit">Start Test</button>
            </div>
        </form>
    <?php else: ?>
        <div id="timer">2:00</div>
        <form id="quizForm" method="post" action="submit_test.php">
            <?php foreach ($_SESSION['questions'] as $index => $q): ?>
                <div class="question">
                    <p><strong>Q<?= $index + 1 ?>:</strong> <?= htmlspecialchars($q['question_text']) ?></p>
                    <?php foreach (['a', 'b', 'c', 'd'] as $opt): ?>
                        <label>
                            <input type="radio" name="answers[<?= $index ?>]" value="<?= $opt ?>" required>
                            <?= htmlspecialchars($q["option_$opt"]) ?>
                        </label>
                    <?php endforeach; ?>
                </div>
                <hr>
            <?php endforeach; ?>

            <div style="text-align: center;">
                <button type="submit">Submit</button>
            </div>
        </form>
    <?php endif; ?>
</body>
</html>
