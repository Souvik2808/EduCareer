<?php
session_start();
include "connect.php";

if (!isset($_SESSION['questions'])) {
    die("No test data found. Please start the test first.");
}

$questions = $_SESSION['questions'];
$userAnswers = $_POST['answers'] ?? [];

// Score tracking
$totalQuestions = count($questions);
$correctCount = 0;
$wrongQuestions = [];

foreach ($questions as $index => $question) {
    $correctOption = $question['correct_option'];
    $userAnswer = $userAnswers[$index] ?? null;

    if ($userAnswer === $correctOption) {
        $correctCount++;
    } else {
        $wrongQuestions[] = [
            'question' => $question['question_text'],
            'options' => [
                'a' => $question['option_a'],
                'b' => $question['option_b'],
                'c' => $question['option_c'],
                'd' => $question['option_d'],
            ],
            'correct_option' => $correctOption,
            'user_option' => $userAnswer,
        ];
    }
}

// Clear session questions so test can't be resubmitted accidentally
unset($_SESSION['questions']);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Mock Test Results</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(120deg, #e0f7fa, #ffffff);
            margin: 0; padding: 30px;
            color: #333;
        }
        h2 {
            text-align: center;
            color: #00695c;
        }
        .summary {
            max-width: 600px;
            margin: 20px auto;
            background: #ffffff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            text-align: center;
            font-size: 20px;
            font-weight: 600;
        }
        .wrong-question {
            max-width: 800px;
            margin: 20px auto;
            background: #fff3f3;
            border-left: 6px solid #d32f2f;
            padding: 20px;
            border-radius: 10px;
        }
        .wrong-question p {
            font-weight: 600;
            color: #d32f2f;
        }
        .option {
            margin-left: 20px;
            padding: 6px 10px;
            border-radius: 5px;
            display: inline-block;
            margin-bottom: 5px;
            font-size: 15px;
            cursor: default;
        }
        .correct {
            background-color: #a5d6a7;
            color: #2e7d32;
            font-weight: 600;
        }
        .user-selected {
            background-color: #ef9a9a;
            color: #b71c1c;
            font-weight: 600;
        }
        hr {
            border: none;
            border-top: 1px solid #ddd;
            margin: 30px 0;
        }
        .no-wrong {
            max-width: 600px;
            margin: 40px auto;
            background: #dcedc8;
            color: #558b2f;
            font-weight: 600;
            padding: 20px;
            border-radius: 12px;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Your Mock Test Results</h2>
    <div class="summary">
        You answered <?= $correctCount ?> out of <?= $totalQuestions ?> questions correctly.
    </div>

    <?php if (count($wrongQuestions) > 0): ?>
        <h3 style="text-align:center; color:#d32f2f;">Review Wrong Answers</h3>
        <?php foreach ($wrongQuestions as $idx => $wq): ?>
            <div class="wrong-question">
                <p><strong>Q<?= $idx + 1 ?>:</strong> <?= htmlspecialchars($wq['question']) ?></p>
                <?php foreach ($wq['options'] as $key => $optText): 
                    $classes = [];
                    if ($key === $wq['correct_option']) $classes[] = 'correct';
                    if ($key === $wq['user_option']) $classes[] = 'user-selected';
                ?>
                    <div class="option <?= implode(' ', $classes) ?>">
                        <?= strtoupper($key) ?>. <?= htmlspecialchars($optText) ?>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endforeach; ?>
    <?php else: ?>
        <div class="no-wrong">
            Amazing! You got all questions right.
        </div>
    <?php endif; ?>

</body>
</html>
