-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2025 at 08:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `educareer`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `image_url`, `link`) VALUES
(21, 'Quantitative Aptitude for CAT', 'images/cat.jpeg', 'https://amzn.in/d/5KbI9Fb'),
(22, 'NEET Biology Mastery', 'images/neet.jpeg', 'https://amzn.in/d/eKiA2o1'),
(23, 'CUET Complete Prep', 'images/cuet.jpeg', 'https://www.amazon.in/s?k=cuet&i=stripbooks'),
(24, 'JEE Physics Guide', 'images/jee.jpeg', 'https://www.amazon.in/Physics-Galaxy-Volumes-Advanced-Ashish/dp/9356812594'),
(25, 'CAT Verbal Ability', 'images/cat_ver.jpeg', 'https://www.amazon.in/CAT-Preparation-Books/b?ie=UTF8&node=4149776031'),
(26, 'Data Structures and Algorithms Made Easy', 'images/dsa.jpeg', 'https://www.amazon.in/dp/9351191628'),
(27, 'Introduction to the Theory of Computation', 'images/computation.jpeg', 'https://www.amazon.in/dp/8131518487'),
(28, 'The Pragmatic Programmer', 'images/program.jpeg', 'https://www.amazon.in/dp/0135957052'),
(29, 'Clean Code: A Handbook of Agile Software Craftsmanship', 'images/clean.jpeg', 'https://www.amazon.in/dp/0136083239'),
(30, 'Design Patterns: Elements of Reusable Object-Oriented Software', 'images/designp.jpeg', 'https://www.amazon.in/dp/0201633612');

-- --------------------------------------------------------

--
-- Table structure for table `colleges`
--

CREATE TABLE `colleges` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `courses_offered` text NOT NULL,
  `website` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `colleges`
--

INSERT INTO `colleges` (`id`, `name`, `image_url`, `courses_offered`, `website`) VALUES
(102, 'Brainware University', 'images/Brainware-university.jpg', 'Engineering, BCA, MCA, Multimedia', 'https://www.brainwareuniversity.ac.in'),
(103, 'IIT Bombay', 'images/iitb.jpg', 'Engineering, Science, Humanities', 'https://www.iitb.ac.in'),
(104, 'IIT Delhi', 'images/iitd.jpeg', 'Engineering, Technology, Research', 'https://home.iitd.ac.in'),
(105, 'BITS Pilani', 'images/bits.jpg', 'Engineering, Management, Sciences', 'https://www.bits-pilani.ac.in'),
(106, 'Jadavpur University', 'images/jadavpur.jpg', 'Engineering, Arts, Science', 'https://jaduniv.edu.in'),
(107, 'IIT Madras', 'images/iitm.jpeg', 'Engineering, Science, Management', 'https://www.iitm.ac.in'),
(108, 'IIT Kanpur', 'images/iitk.jpg', 'Engineering, Science, Research', 'https://www.iitk.ac.in'),
(109, 'IIT Kharagpur', 'images/iitkgp.jpg', 'Engineering, Management, Law', 'https://www.iitkgp.ac.in'),
(110, 'NIT Trichy', 'images/nitt.jpg', 'Engineering, Science', 'https://www.nitt.edu'),
(111, 'NIT Surathkal', 'images/nitsk.jpeg', 'Engineering, Management', 'https://www.nitk.ac.in'),
(112, 'Delhi University', 'images/du.jpeg', 'Arts, Science, Commerce', 'http://www.du.ac.in'),
(113, 'Jawaharlal Nehru University', 'images/jnu.jpg', 'Social Sciences, Humanities', 'http://www.jnu.ac.in'),
(114, 'University of Mumbai', 'images/mumbai.jpeg', 'Arts, Science, Commerce', 'http://www.mu.ac.in'),
(115, 'Panjab University', 'images/panjab.jpg', 'Arts, Science, Engineering', 'http://www.puchd.ac.in'),
(116, 'University of Calcutta', 'images/calcutta.jpeg', 'Arts, Science, Commerce', 'http://www.caluniv.ac.in'),
(117, 'Manipal University', 'images/manipal.jpeg', 'Engineering, Medicine, Management', 'https://www.manipal.edu'),
(118, 'VIT University', 'images/vit.jpeg', 'Engineering, Management', 'https://www.vit.ac.in'),
(119, 'SRM University', 'images/srm.jpeg', 'Engineering, Management', 'https://www.srmist.edu.in'),
(120, 'Thapar Institute of Engineering and Technology', 'images/thapar.jpg', 'Engineering, Management', 'http://www.thapar.edu'),
(121, 'LPU', 'images/lpu.jpeg', 'Engineering, Management, Arts', 'https://www.lpu.in'),
(122, 'Amity University', 'images/amity.jpg', 'Engineering, Management, Law', 'https://www.amity.edu'),
(123, 'Shiv Nadar University', 'images/snu.jpeg', 'Engineering, Humanities, Management', 'https://www.snu.edu.in'),
(124, 'Birla Institute of Technology', 'images/bit.jpeg', 'Engineering, Management', 'http://www.bitmesra.ac.in'),
(125, 'Nirma University', 'images/nirma.jpg', 'Engineering, Management', 'http://www.nirmauni.ac.in'),
(126, 'SASTRA University', 'images/sastra.jpg', 'Engineering, Arts, Science', 'http://www.sastra.edu'),
(127, 'KREA University', 'images/krea.jpeg', 'Liberal Arts, Science', 'https://krea.edu.in'),
(128, 'Ashoka University', 'images/ashoka.jpeg', 'Liberal Arts, Sciences', 'https://www.ashoka.edu.in'),
(129, 'O.P. Jindal Global University', 'images/jindal.jpg', 'Law, Business, International Affairs', 'https://www.jgu.edu.in'),
(130, 'Jamia Millia Islamia', 'images/jamia.jpeg', 'Arts, Science, Engineering', 'http://www.jmi.ac.in'),
(131, 'University of Hyderabad', 'images/hyderabad.jpeg', 'Arts, Science, Management', 'http://www.uohyd.ac.in'),
(132, 'Indian Institute of Science', 'images/iisc.jpeg', 'Science, Engineering', 'https://www.iisc.ac.in'),
(133, 'Indian Statistical Institute', 'images/isi.jpg', 'Statistics, Mathematics', 'https://www.isical.ac.in'),
(134, 'Adamas University', 'images/adamas.jpg', 'MCA,Biotechnology', 'https://adamasknowledgecity.ac.in/');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`, `submitted_at`) VALUES
(11, 'Koushik', 'koushikotaku1324@gmail.com', 'Nice Website', '2025-06-18 17:34:52');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `link` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `description`, `link`, `image_url`) VALUES
(1, 'Engineering & Technology', 'B.Tech in Computer Science & Engineering', 'https://www.careers360.com/courses/btech-mtech-dual-degree', 'en.jpeg'),
(2, 'Business Administration', 'MBA in Finance and Marketing', 'https://www.snhu.edu/about-us/newsroom/business/what-is-business-administration', 'bu.jpeg'),
(3, 'Computer Applications', 'BCA and MCA integrated programs', 'https://www.aiet.ac.in/computer-applications-course', 'ca.jpeg'),
(4, 'Multimedia Design', 'Advanced diploma in Multimedia', 'https://www.indeed.com/career-advice/finding-a-job/multimedia-designing', 'md.jpeg'),
(5, 'Medical Sciences', 'MBBS & Nursing courses', 'https://medicine.careers360.com/articles/top-10-medical-courses-in-india', 'ms.jpeg'),
(6, 'Data Science', 'M.Sc in Data Science and Analytics', 'https://www.odinschool.com/data-science-course', 'ds.jpeg'),
(7, 'Information Technology', 'B.Sc in Information Technology', 'https://www.techtarget.com/searchdatacenter/definition/IT', 'it.jpeg'),
(8, 'Graphic Design', 'Diploma in Graphic Design', 'https://www.behance.net/galleries/graphic-design', 'gd.jpeg'),
(9, 'Cyber Security', 'M.Sc in Cyber Security', 'https://www.checkpoint.com/cyber-hub/cyber-security/what-is-cybersecurity/', 'cs,jpeg'),
(10, 'Hospitality Management', 'B.Sc in Hospitality and Hotel Management', 'https://in.indeed.com/career-advice/finding-a-job/what-is-hospital-management', 'hm.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `exam_name` varchar(255) NOT NULL,
  `exam_description` text NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `exam_name`, `exam_description`, `link`) VALUES
(6, 'JEE Advanced', 'Entrance exam for IITs', 'https://jeeadv.ac.in/'),
(7, 'NEET', 'Medical entrance for MBBS/BDS', 'https://neet.nta.nic.in/'),
(8, 'CAT', 'MBA entrance exam for IIMs', 'https://iimcat.ac.in/'),
(9, 'CUET', 'UG entrance for central universities', 'https://cuet.samarth.ac.in/'),
(10, 'SSC MTS', 'Staff Selection Commission Multi Tasking', 'https://ssc.nic.in/'),
(11, 'GATE', 'Graduate Aptitude Test in Engineering', 'https://gate.iitk.ac.in/'),
(12, 'XAT', 'Xavier Aptitude Test for MBA', 'https://xatonline.in/'),
(13, 'MAT', 'Management Aptitude Test', 'https://www.aima.in/'),
(14, 'CLAT', 'Common Law Admission Test', 'https://www.clat.ac.in/'),
(15, 'UPSC Civil Services', 'Union Public Service Commission Civil Services Exam', 'https://www.upsc.gov.in/'),
(16, 'IBPS PO', 'Institute of Banking Personnel Selection Probationary Officer', 'https://www.ibps.in/'),
(17, 'CTET', 'Central Teacher Eligibility Test', 'https://ctet.nic.in/'),
(18, 'NDA', 'National Defence Academy Exam', 'https://upsc.gov.in/'),
(19, 'SBI PO', 'State Bank of India Probationary Officer', 'https://sbi.co.in/'),
(20, 'RBI Grade B', 'Reserve Bank of India Grade B Officer Exam', 'https://rbi.org.in/');

-- --------------------------------------------------------

--
-- Table structure for table `online_books_buy`
--

CREATE TABLE `online_books_buy` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `online_books_buy`
--

INSERT INTO `online_books_buy` (`id`, `title`, `image_url`, `link`) VALUES
(1, 'UPSC Civil Services General Studies Paper I', 'images/UPSC Civil Services General Studies Paper I.jpg', 'https://www.amazon.in/General-Studies-Prelims-Services-services/dp/935532779X'),
(2, 'Ultimate Guide to SSC CGL – 10th Edition', 'images/Ultimate Guide to SSC CGL – 10th Edition.jpg', 'https://www.amazon.in/Disha-Ultimate-Guide-SSC-CGL/dp/9362250535'),
(3, 'SSC CGL Preparatory Guide: English (Part 1)', 'images/SSC CGL Preparatory Guide English (Part 1).jpg', 'https://www.amazon.in/SSC-Preparatory-Guide-English-Part-ebook/dp/B074SG62FW'),
(4, 'SSC CGL Preparatory Guide – Mathematics (Part 1)', 'images/SSC CGL Preparatory Guide – Mathematics (Part 1).jpg', 'https://www.amazon.in/SSC-Preparatory-Guide-Mathematics-Part-ebook/dp/B074SF26DM'),
(5, 'JEE Advanced 2025 Physics Master Guide', 'images/JEE Advanced 2025 Physics Master Guide.jpg', 'https://www.amazon.in/Arihant-Masterstroke-JEE-Advanced-2025/dp/9368402108'),
(6, 'NEET Crash Course Biology 2025 - A Complete Guide for NEET ', 'images/NEET Crash Course Biology 2025 - A Complete Guide for NEET .jpg', 'https://www.amazon.in/Complete-Curriculum-Assertion-Statement-based-Questions/dp/9367130902'),
(7, 'Quantitative Aptitude for CAT 2025 by Arun Sharma - 11th edition', 'images/Quantitative Aptitude for CAT 2025 by Arun Sharma - 11th edition.jpg', 'https://amzn.in/d/5FDMA8w'),
(8, 'GKP GATE 2025 : Computer Science and Information Technology - Guide', 'images/GKP GATE 2025 - Computer Science and Information Technology - Guide.jpg', 'https://amzn.in/d/9ucxNrc'),
(9, 'Bank PO 2024 Edition', 'images/Bank PO 2024 Edition.png', 'https://www.flipkart.com/bank-po-2024-2019-2023-solved-papers-detailed-explanations-english-medium-4914/p/itm01c3179a50ea6'),
(10, 'NTA UGC NET | SET | JRF Paper 1 : Teaching & Research Aptitude 2024 - 2025', 'images/NTA UGC NET - SET - JRF Paper 1 - Teaching & Research Aptitude 2024 - 2025.jpg', 'https://amzn.in/d/6MrBFPx'),
(11, 'GKP CLAT 2025 : Legal Aptitude Guide', 'images/GKP CLAT 2025 - Legal Aptitude Guide.jpg', 'https://amzn.in/d/8fJFD2B'),
(12, 'NDA/NA 2025 - Complete Guide by Arihant Experts', 'images/NDA-NA 2025 - Complete Guide by Arihant Experts.jpg', 'https://amzn.in/d/8SgILVj'),
(13, 'UPSC Prelims 2025 General Studies Paper 1 & 2', 'images/UPSC Prelims 2025 General Studies Paper 1 & 2.jpg', 'https://amzn.in/d/4I9YED7'),
(14, 'Arihant Study Guide for NTA CUET-UG 2025', 'images/Arihant Study Guide for NTA CUET-UG 2025.jpg', 'https://amzn.in/d/j3x5Gp2'),
(15, 'Trueman\'s UGC NET_SET_JRF Commerce - 2025', 'images/Trueman\'s UGC NET_SET_JRF Commerce - 2025.jpg', 'https://amzn.in/d/ac9neXi');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `question_text` text NOT NULL,
  `option_a` text NOT NULL,
  `option_b` text NOT NULL,
  `option_c` text NOT NULL,
  `option_d` text NOT NULL,
  `correct_option` enum('a','b','c','d') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `category`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`) VALUES
(4, 'Computer Application', 'What does CPU stand for?', 'Central Process Unit', 'Central Processing Unit', 'Computer Personal Unit', 'Central Processor Utility', 'b'),
(5, 'Computer Application', 'Which of these is an input device?', 'Monitor', 'Printer', 'Keyboard', 'Speaker', 'c'),
(6, 'Computer Application', 'What is the brain of the computer?', 'RAM', 'Hard Disk', 'CPU', 'Monitor', 'c'),
(7, 'Computer Application', 'Which one is a web browser?', 'Google', 'Yahoo', 'Chrome', 'Windows', 'c'),
(8, 'Computer Application', 'What type of software is MS Word?', 'Operating System', 'Application Software', 'System Software', 'Programming Language', 'b'),
(9, 'Computer Application', 'Which key is used to delete a character to the right of the cursor?', 'Backspace', 'Delete', 'Enter', 'Shift', 'b'),
(10, 'Computer Application', 'Which of the following is not an operating system?', 'Windows', 'Linux', 'Oracle', 'macOS', 'c'),
(11, 'Computer Application', 'What does URL stand for?', 'Uniform Resource Locator', 'Unified Resource Link', 'Unique Resource Line', 'Uniform Read Locator', 'a'),
(12, 'Computer Application', 'Which storage is non-volatile?', 'RAM', 'ROM', 'Cache', 'Register', 'b'),
(13, 'Computer Application', 'What is used to transfer data between computers?', 'Scanner', 'Router', 'Mouse', 'Monitor', 'b'),
(14, 'Computer Application', 'What is the full form of HTML?', 'HighText Machine Language', 'HyperText and Links Markup Language', 'HyperText Markup Language', 'None of these', 'c'),
(15, 'Computer Application', 'Which of the following is a programming language?', 'HTTP', 'URL', 'C++', 'WWW', 'c'),
(16, 'Computer Application', 'Which is a type of computer memory?', 'ALU', 'CD-ROM', 'ROM', 'NIC', 'c'),
(17, 'Computer Application', 'Which device is used to point and click?', 'CPU', 'Monitor', 'Mouse', 'Speaker', 'c'),
(18, 'Computer Application', 'Which file extension is used for a web page?', '.exe', '.html', '.txt', '.pdf', 'b'),
(19, 'Computer Application', 'What is an example of application software?', 'Windows 10', 'Linux', 'MS Excel', 'BIOS', 'c'),
(20, 'Computer Application', 'Which shortcut key is used to paste?', 'Ctrl + C', 'Ctrl + V', 'Ctrl + P', 'Ctrl + X', 'b'),
(21, 'Computer Application', 'What does HTTP stand for?', 'HyperText Transfer Protocol', 'HyperTool Transfer Process', 'HighText Transfer Protocol', 'HyperText Transformation Protocol', 'a'),
(22, 'Computer Application', 'Which component stores data permanently?', 'RAM', 'Cache', 'ROM', 'Hard Disk', 'd'),
(23, 'Computer Application', 'Which of the following is not a search engine?', 'Google', 'Bing', 'Firefox', 'Yahoo', 'c'),
(24, 'Computer Application', 'What is the extension of MS Word files?', '.xls', '.ppt', '.docx', '.exe', 'c'),
(25, 'Computer Application', 'Which tool is used to check spelling in MS Word?', 'Grammar Tool', 'Spell Checker', 'Thesaurus', 'Find & Replace', 'b'),
(26, 'Computer Application', 'Which of the following is not a programming language?', 'Python', 'Java', 'Windows', 'C#', 'c'),
(27, 'Computer Application', 'What is software?', 'Hardware device', 'Physical parts of computer', 'Set of instructions', 'None of the above', 'c'),
(28, 'Computer Application', 'What does GUI stand for?', 'Graphical Utility Interface', 'Graphical User Interface', 'General User Interface', 'Graphic Use Interface', 'b'),
(29, 'Computer Application', 'Which of these is a secondary storage device?', 'RAM', 'ROM', 'Cache', 'DVD', 'd'),
(30, 'Computer Application', 'Which key is used to refresh a web page?', 'F5', 'F1', 'F2', 'F9', 'a'),
(31, 'Computer Application', 'Which protocol is used to access web pages?', 'FTP', 'HTTP', 'SMTP', 'TCP', 'b'),
(32, 'Computer Application', 'Which one is a cloud storage service?', 'Gmail', 'Google Drive', 'Chrome', 'Firefox', 'b'),
(33, 'Computer Application', 'Which application is used for presentations?', 'MS Word', 'MS Excel', 'MS PowerPoint', 'MS Access', 'c'),
(34, 'Computer Application', 'Which of these is a mobile operating system?', 'Windows', 'Android', 'Linux', 'DOS', 'b'),
(35, 'Computer Application', 'Which port is used for internet connection?', 'COM1', 'USB', 'LAN', 'HDMI', 'c'),
(36, 'Computer Application', 'Which tag is used to create a hyperlink in HTML?', '<link>', '<a>', '<href>', '<hyper>', 'b'),
(37, 'Computer Application', 'Which company developed Windows OS?', 'Google', 'Apple', 'Microsoft', 'Intel', 'c'),
(38, 'Computer Application', 'Which of these is an example of spreadsheet software?', 'MS Paint', 'MS Excel', 'MS PowerPoint', 'Notepad', 'b'),
(39, 'Computer Application', 'What is a firewall?', 'Anti-virus software', 'Security system', 'A type of malware', 'None of the above', 'b'),
(40, 'Computer Application', 'Which key is used to undo an action?', 'Ctrl + Z', 'Ctrl + Y', 'Ctrl + X', 'Ctrl + A', 'a'),
(41, 'Computer Application', 'Which device converts digital signals to analog?', 'Router', 'Modem', 'Switch', 'Hub', 'b'),
(42, 'Computer Application', 'What does IP stand for?', 'Internet Protocol', 'Internal Program', 'Internet Process', 'Integrated Protocol', 'a'),
(43, 'Computer Application', 'Which is the smallest unit of data in a computer?', 'Bit', 'Byte', 'Nibble', 'Word', 'a'),
(44, 'Computer Application', 'What is phishing?', 'A cyber attack', 'A programming language', 'A type of hardware', 'A social media app', 'a'),
(45, 'Computer Application', 'Which of these is used to create databases?', 'MS Word', 'MS Excel', 'MS Access', 'MS Paint', 'c'),
(46, 'Computer Application', 'Which of these is an email service?', 'YouTube', 'Gmail', 'Instagram', 'Photoshop', 'b'),
(47, 'Computer Application', 'Which command is used to copy text?', 'Ctrl + X', 'Ctrl + P', 'Ctrl + C', 'Ctrl + D', 'c'),
(48, 'Computer Application', 'What does BIOS stand for?', 'Basic Input Output System', 'Binary Input Output System', 'Basic Integrated Output Software', 'Backup Input Output System', 'a'),
(49, 'Medical', 'What is the normal human body temperature?', '98.6°F', '97.5°F', '99.5°F', '100.4°F', 'a'),
(50, 'Medical', 'Which organ is responsible for pumping blood?', 'Liver', 'Brain', 'Heart', 'Lungs', 'c'),
(51, 'Medical', 'What is the main function of red blood cells?', 'Fight infections', 'Carry oxygen', 'Produce hormones', 'Digest food', 'b'),
(52, 'Medical', 'Which vitamin is produced when the skin is exposed to sunlight?', 'Vitamin A', 'Vitamin B12', 'Vitamin C', 'Vitamin D', 'd'),
(53, 'Medical', 'Which disease is caused by a deficiency of insulin?', 'Asthma', 'Diabetes', 'Anemia', 'Arthritis', 'b'),
(54, 'Medical', 'Which blood group is a universal donor?', 'O+', 'A-', 'O-', 'AB+', 'c'),
(55, 'Medical', 'How many bones are in the adult human body?', '206', '208', '210', '215', 'a'),
(56, 'Medical', 'What does ECG stand for?', 'Electro Cardio Graph', 'Electronic Cardiac Guide', 'Electro Convulsion Graph', 'End Cardiac Group', 'a'),
(57, 'Medical', 'Which organ helps in detoxification of the body?', 'Liver', 'Kidney', 'Heart', 'Lungs', 'a'),
(58, 'Medical', 'What is the largest organ of the human body?', 'Heart', 'Skin', 'Liver', 'Brain', 'b'),
(59, 'Medical', 'Which mineral is important for bone health?', 'Iron', 'Zinc', 'Calcium', 'Potassium', 'c'),
(60, 'Medical', 'Which part of the brain controls balance?', 'Cerebrum', 'Cerebellum', 'Medulla', 'Pons', 'b'),
(61, 'Medical', 'Which disease is caused by the Plasmodium parasite?', 'Dengue', 'Malaria', 'Typhoid', 'Cholera', 'b'),
(62, 'Medical', 'What is the medical term for high blood pressure?', 'Hypotension', 'Hypertension', 'Hyperglycemia', 'Anemia', 'b'),
(63, 'Medical', 'Which virus causes COVID-19?', 'HIV', 'Coronavirus', 'Ebola', 'Hepatitis B', 'b'),
(64, 'Medical', 'Which vitamin helps in blood clotting?', 'Vitamin C', 'Vitamin D', 'Vitamin K', 'Vitamin A', 'c'),
(65, 'Medical', 'Which blood cells fight infections?', 'Red blood cells', 'White blood cells', 'Platelets', 'Plasma', 'b'),
(66, 'Medical', 'What is the function of the lungs?', 'Pump blood', 'Filter waste', 'Exchange gases', 'Produce insulin', 'c'),
(67, 'Medical', 'What is the smallest bone in the human body?', 'Femur', 'Stapes', 'Ulna', 'Tibia', 'b'),
(68, 'Medical', 'Which organ produces insulin?', 'Liver', 'Pancreas', 'Spleen', 'Kidney', 'b'),
(69, 'Medical', 'What is anemia?', 'Low blood sugar', 'High cholesterol', 'Lack of hemoglobin', 'Liver infection', 'c'),
(70, 'Medical', 'How many chambers are there in the human heart?', '2', '3', '4', '5', 'c'),
(71, 'Medical', 'Which disease is caused by vitamin C deficiency?', 'Rickets', 'Scurvy', 'Pellagra', 'Night blindness', 'b'),
(72, 'Medical', 'What is the main function of the kidney?', 'Produce hormones', 'Pump blood', 'Filter blood', 'Digest food', 'c'),
(73, 'Medical', 'Which blood component helps in clotting?', 'Plasma', 'Platelets', 'RBCs', 'WBCs', 'b'),
(74, 'Medical', 'Which gland is known as the master gland?', 'Thyroid', 'Adrenal', 'Pituitary', 'Pineal', 'c'),
(75, 'Medical', 'Which disease is caused by a virus?', 'Tuberculosis', 'Malaria', 'Chickenpox', 'Scurvy', 'c'),
(76, 'Medical', 'Which part of the eye controls the amount of light entering?', 'Lens', 'Retina', 'Iris', 'Cornea', 'c'),
(77, 'Medical', 'What is the function of hemoglobin?', 'Digest fats', 'Transport oxygen', 'Produce hormones', 'Clot blood', 'b'),
(78, 'Medical', 'Which organ is affected by hepatitis?', 'Lung', 'Heart', 'Liver', 'Kidney', 'c'),
(79, 'General Knowledge', 'What is the capital of France?', 'Berlin', 'Madrid', 'Paris', 'Rome', 'c'),
(80, 'General Knowledge', 'Which planet is known as the Red Planet?', 'Venus', 'Mars', 'Jupiter', 'Saturn', 'b'),
(81, 'General Knowledge', 'Who wrote \"Romeo and Juliet\"?', 'Mark Twain', 'William Shakespeare', 'Charles Dickens', 'Jane Austen', 'b'),
(82, 'General Knowledge', 'What is the largest ocean on Earth?', 'Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean', 'Pacific Ocean', 'd'),
(83, 'General Knowledge', 'What is the chemical symbol for Gold?', 'Au', 'Ag', 'Gd', 'Go', 'a'),
(84, 'General Knowledge', 'Which country is known as the Land of the Rising Sun?', 'China', 'Japan', 'Thailand', 'South Korea', 'b'),
(85, 'General Knowledge', 'How many continents are there?', '5', '6', '7', '8', 'c'),
(86, 'General Knowledge', 'What is the tallest mountain in the world?', 'K2', 'Mount Everest', 'Kangchenjunga', 'Lhotse', 'b'),
(87, 'General Knowledge', 'Who painted the Mona Lisa?', 'Vincent Van Gogh', 'Pablo Picasso', 'Leonardo da Vinci', 'Michelangelo', 'c'),
(88, 'General Knowledge', 'Which is the smallest country in the world?', 'Monaco', 'Nauru', 'Vatican City', 'San Marino', 'c'),
(89, 'General Knowledge', 'What is the currency of the United Kingdom?', 'Euro', 'Pound Sterling', 'Dollar', 'Yen', 'b'),
(90, 'General Knowledge', 'Who discovered penicillin?', 'Alexander Fleming', 'Marie Curie', 'Louis Pasteur', 'Isaac Newton', 'a'),
(91, 'General Knowledge', 'What is the largest mammal?', 'Elephant', 'Blue Whale', 'Giraffe', 'Hippopotamus', 'b'),
(92, 'General Knowledge', 'Which gas do plants absorb from the atmosphere?', 'Oxygen', 'Nitrogen', 'Carbon Dioxide', 'Hydrogen', 'c'),
(93, 'General Knowledge', 'What year did World War II end?', '1945', '1939', '1918', '1963', 'a'),
(94, 'General Knowledge', 'Which element has the atomic number 1?', 'Oxygen', 'Hydrogen', 'Helium', 'Carbon', 'b'),
(95, 'General Knowledge', 'What is the hardest natural substance?', 'Gold', 'Diamond', 'Iron', 'Platinum', 'b'),
(96, 'General Knowledge', 'Which country invented pizza?', 'France', 'Italy', 'USA', 'Greece', 'b'),
(97, 'General Knowledge', 'What is the main language spoken in Brazil?', 'Spanish', 'Portuguese', 'French', 'English', 'b'),
(98, 'General Knowledge', 'Which animal is known as the King of the Jungle?', 'Tiger', 'Elephant', 'Lion', 'Cheetah', 'c'),
(99, 'General Knowledge', 'How many stripes are there on the US flag?', '11', '12', '13', '14', 'c'),
(100, 'General Knowledge', 'Which planet has the most moons?', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'c'),
(101, 'General Knowledge', 'What is the fastest land animal?', 'Cheetah', 'Lion', 'Horse', 'Greyhound', 'a'),
(102, 'General Knowledge', 'Who is known as the Father of Computers?', 'Albert Einstein', 'Isaac Newton', 'Charles Babbage', 'Alan Turing', 'c'),
(103, 'General Knowledge', 'Which ocean is Bermuda Triangle located in?', 'Pacific Ocean', 'Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean', 'b'),
(104, 'General Knowledge', 'What is the tallest building in the world?', 'Shanghai Tower', 'Burj Khalifa', 'One World Trade Center', 'Taipei 101', 'b'),
(105, 'General Knowledge', 'Who wrote the national anthem of the USA?', 'Francis Scott Key', 'Thomas Jefferson', 'Benjamin Franklin', 'George Washington', 'a'),
(106, 'General Knowledge', 'Which country gifted the Statue of Liberty to the USA?', 'France', 'England', 'Germany', 'Spain', 'a'),
(107, 'General Knowledge', 'Which is the largest desert in the world?', 'Sahara', 'Gobi', 'Antarctic Desert', 'Kalahari', 'c'),
(108, 'General Knowledge', 'How many players are there in a soccer team?', '9', '10', '11', '12', 'c'),
(109, 'General Knowledge', 'What is the boiling point of water?', '90°C', '95°C', '100°C', '105°C', 'c'),
(110, 'General Knowledge', 'Which country is famous for tulips?', 'Belgium', 'Netherlands', 'France', 'Denmark', 'b'),
(111, 'General Knowledge', 'What is the chemical formula of water?', 'H2O', 'CO2', 'O2', 'NaCl', 'a'),
(112, 'General Knowledge', 'Who was the first person to walk on the moon?', 'Neil Armstrong', 'Buzz Aldrin', 'Yuri Gagarin', 'Michael Collins', 'a'),
(113, 'General Knowledge', 'Which organ detoxifies chemicals in the body?', 'Kidney', 'Heart', 'Liver', 'Lungs', 'c'),
(114, 'General Knowledge', 'Which country has the most population?', 'USA', 'India', 'China', 'Russia', 'c'),
(115, 'General Knowledge', 'What does DNA stand for?', 'Deoxyribonucleic Acid', 'Deoxyribonitric Acid', 'Dinucleic Acid', 'Deoxynucleic Acid', 'a'),
(116, 'General Knowledge', 'Which is the longest river in the world?', 'Amazon', 'Nile', 'Yangtze', 'Mississippi', 'b'),
(117, 'General Knowledge', 'Which city hosted the 2016 Summer Olympics?', 'Beijing', 'London', 'Rio de Janeiro', 'Tokyo', 'c'),
(118, 'General Knowledge', 'What is the main ingredient of traditional sushi?', 'Beef', 'Pork', 'Rice', 'Chicken', 'c'),
(119, 'General Knowledge', 'Which is the largest planet in our solar system?', 'Earth', 'Jupiter', 'Saturn', 'Neptune', 'b'),
(120, 'General Knowledge', 'How many sides does a hexagon have?', '5', '6', '7', '8', 'b'),
(121, 'General Knowledge', 'What is the name of the first artificial Earth satellite?', 'Apollo 11', 'Sputnik', 'Voyager', 'Hubble', 'b'),
(122, 'General Knowledge', 'Who painted the ceiling of the Sistine Chapel?', 'Leonardo da Vinci', 'Michelangelo', 'Raphael', 'Donatello', 'b'),
(123, 'General Knowledge', 'Which element is necessary for respiration?', 'Nitrogen', 'Oxygen', 'Carbon', 'Hydrogen', 'b'),
(124, 'General Knowledge', 'What currency is used in Japan?', 'Yuan', 'Dollar', 'Yen', 'Won', 'c'),
(125, 'General Knowledge', 'Which famous scientist developed the theory of relativity?', 'Isaac Newton', 'Nikola Tesla', 'Albert Einstein', 'Galileo Galilei', 'c'),
(126, 'General Knowledge', 'Which continent is the Sahara Desert located in?', 'Asia', 'Africa', 'Australia', 'South America', 'b'),
(127, 'General Knowledge', 'What is the primary source of energy for Earth?', 'The Moon', 'The Sun', 'The Stars', 'Volcanoes', 'b'),
(128, 'General Knowledge', 'Which bird is known for its impressive colorful tail?', 'Peacock', 'Eagle', 'Parrot', 'Swan', 'a'),
(129, 'Web Development', 'What does HTML stand for?', 'Hyperlinks and Text Markup Language', 'Home Tool Markup Language', 'Hyper Text Markup Language', 'Hyper Tool Multi Language', 'c'),
(130, 'Web Development', 'Which HTML tag is used to define an internal style sheet?', '<style>', '<css>', '<script>', '<link>', 'a'),
(131, 'Web Development', 'What does CSS stand for?', 'Cascading Style Sheets', 'Colorful Style Sheets', 'Creative Style Sheets', 'Computer Style Sheets', 'a'),
(132, 'Web Development', 'Which property is used to change the background color in CSS?', 'color', 'bgcolor', 'background-color', 'backgroundColor', 'c'),
(133, 'Web Development', 'Inside which HTML element do we put the JavaScript?', '<js>', '<javascript>', '<script>', '<scripting>', 'c'),
(134, 'Web Development', 'Which symbol is used for comments in JavaScript?', '//', '/* */', '#', '<!-- -->', 'a'),
(135, 'Web Development', 'What is the correct syntax to link an external CSS file?', '<link href=\"style.css\" rel=\"stylesheet\">', '<stylesheet src=\"style.css\">', '<css src=\"style.css\">', '<link rel=\"style\" href=\"style.css\">', 'a'),
(136, 'Web Development', 'Which HTML attribute is used to define inline styles?', 'class', 'style', 'styles', 'font', 'b'),
(137, 'Web Development', 'Which method can be used to select an element by its ID in JavaScript?', 'getElementByClass()', 'getElementById()', 'querySelectorAll()', 'getElementsByTagName()', 'b'),
(138, 'Web Development', 'What does DOM stand for?', 'Document Object Model', 'Data Object Management', 'Desktop Oriented Mode', 'Document Orientation Model', 'a'),
(139, 'Web Development', 'Which HTML element is used to define the title of a document?', '<title>', '<head>', '<header>', '<meta>', 'a'),
(140, 'Web Development', 'Which CSS property controls the text size?', 'font-style', 'text-size', 'font-size', 'text-style', 'c'),
(141, 'Web Development', 'How do you write \"Hello World\" in an alert box in JavaScript?', 'alertBox(\"Hello World\");', 'msg(\"Hello World\");', 'alert(\"Hello World\");', 'msgBox(\"Hello World\");', 'c'),
(142, 'Web Development', 'Which input type defines a slider control?', 'range', 'slider', 'control', 'scroll', 'a'),
(143, 'Web Development', 'What is the correct HTML element for inserting a line break?', '<br>', '<lb>', '<break>', '<line>', 'a'),
(144, 'Web Development', 'Which CSS property is used to change the font of an element?', 'font-weight', 'font-family', 'font-style', 'text-style', 'b'),
(145, 'Web Development', 'Which JavaScript keyword is used to declare a variable?', 'var', 'let', 'const', 'All of the above', 'd'),
(146, 'Web Development', 'How do you create a function in JavaScript?', 'function = myFunction()', 'function:myFunction()', 'function myFunction()', 'create function myFunction()', 'c'),
(147, 'Web Development', 'Which tag is used to display a picture in HTML?', '<img>', '<image>', '<pic>', '<src>', 'a'),
(148, 'Web Development', 'What does CSS stand for?', 'Cascading Style Sheets', 'Creative Style Sheets', 'Computer Style Sheets', 'Colorful Style Sheets', 'a'),
(149, 'Web Development', 'How do you make a list that lists items with numbers?', '<ul>', '<ol>', '<dl>', '<list>', 'b'),
(150, 'Web Development', 'Which HTML element defines the footer of a document or section?', '<footer>', '<bottom>', '<section-footer>', '<foot>', 'a'),
(151, 'Web Development', 'What is the default value of the position property in CSS?', 'relative', 'absolute', 'static', 'fixed', 'c'),
(152, 'Web Development', 'How do you add a comment in a CSS file?', '/* this is a comment */', '// this is a comment', '<!-- this is a comment -->', '# this is a comment', 'a'),
(153, 'Web Development', 'Which tag is used to create a drop-down list in HTML?', '<input>', '<select>', '<dropdown>', '<list>', 'b'),
(154, 'Web Development', 'In JavaScript, how do you write a conditional statement?', 'if (condition) {}', 'for (condition) {}', 'while (condition) {}', 'switch (condition) {}', 'a'),
(155, 'Web Development', 'How can you open a link in a new tab/browser window?', '<a href=\"url\" target=\"_blank\">', '<a href=\"url\" new>', '<a href=\"url\" target=\"new\">', '<a href=\"url\" blank>', 'a'),
(156, 'Web Development', 'Which property is used to change the left margin of an element?', 'padding-left', 'margin-left', 'indent', 'margin', 'b'),
(157, 'Web Development', 'What is the correct HTML for adding a background color?', '<body bg=\"yellow\">', '<background>yellow</background>', '<body style=\"background-color:yellow;\">', '<body color=\"yellow\">', 'c'),
(158, 'Web Development', 'Which HTML element defines the main content?', '<section>', '<main>', '<article>', '<content>', 'b'),
(159, 'Web Development', 'Which HTML attribute specifies an alternate text for an image, if the image cannot be displayed?', 'alt', 'src', 'title', 'longdesc', 'a'),
(160, 'Web Development', 'How do you select elements with class name \"test\" in CSS?', '.test', '#test', '*test', 'test', 'a'),
(161, 'Web Development', 'Which JavaScript method is used to write output to the browser console?', 'console.write()', 'console.log()', 'print()', 'document.write()', 'b'),
(162, 'Web Development', 'What is the correct syntax to write a JavaScript array?', 'var colors = \"red\", \"green\", \"blue\"', 'var colors = (1:\"red\", 2:\"green\", 3:\"blue\")', 'var colors = [\"red\", \"green\", \"blue\"]', 'var colors = 1 = (\"red\"), 2 = (\"green\"), 3 = (\"blue\")', 'c'),
(163, 'Web Development', 'How do you insert a comment in JavaScript?', '// This is a comment', '<!-- This is a comment -->', '/* This is a comment */', '# This is a comment', 'a'),
(164, 'Web Development', 'Which HTML element is used for playing video?', '<media>', '<video>', '<movie>', '<film>', 'b'),
(165, 'Web Development', 'What is the default display value of the <div> element?', 'inline', 'block', 'inline-block', 'none', 'b'),
(166, 'Web Development', 'How can you make a numbered list in HTML?', '<list>', '<ol>', '<ul>', '<dl>', 'b'),
(167, 'Web Development', 'Which HTML element is used to create a hyperlink?', '<a>', '<link>', '<href>', '<url>', 'a'),
(168, 'Web Development', 'In CSS, how do you make the text bold?', 'font-weight: bold;', 'text-style: bold;', 'font-style: bold;', 'text-decoration: bold;', 'a'),
(169, 'Web Development', 'Which event occurs when the user clicks on an HTML element?', 'onchange', 'onclick', 'onmouseover', 'onmouseclick', 'b'),
(170, 'Web Development', 'Which tag is used to create a checkbox in HTML?', '<input type=\"checkbox\">', '<checkbox>', '<input type=\"check\">', '<check>', 'a'),
(171, 'Web Development', 'What is the purpose of the <form> element in HTML?', 'To create a container for other HTML elements', 'To collect user input', 'To display multimedia', 'To define the page layout', 'b'),
(172, 'Web Development', 'Which CSS property controls the spacing between lines of text?', 'line-height', 'letter-spacing', 'word-spacing', 'text-indent', 'a'),
(173, 'Web Development', 'What does API stand for?', 'Application Programming Interface', 'Applied Programming Internet', 'Application Protocol Interface', 'Advanced Programming Interface', 'a'),
(174, 'Web Development', 'Which HTML tag is used to define a table?', '<table>', '<tab>', '<tbl>', '<td>', 'a'),
(175, 'Web Development', 'Which property is used to change the text color in CSS?', 'text-color', 'color', 'font-color', 'font-style', 'b'),
(176, 'Web Development', 'Which JavaScript keyword is used to define a constant?', 'const', 'constant', 'var', 'let', 'a'),
(177, 'Web Development', 'Which HTML element is used to define a paragraph?', '<p>', '<para>', '<pg>', '<text>', 'a'),
(178, 'Web Development', 'How do you include an external JavaScript file?', '<script src=\"app.js\"></script>', '<js src=\"app.js\"></js>', '<script href=\"app.js\"></script>', '<javascript src=\"app.js\"></javascript>', 'a'),
(179, 'Web Development', 'What does JSON stand for?', 'JavaScript Object Notation', 'Java Simple Object Notation', 'JavaScript Open Network', 'Java Serialized Object Notation', 'a'),
(180, 'Programming Language', 'Which language is primarily used for web development?', 'Python', 'JavaScript', 'C++', 'Java', 'b'),
(181, 'Programming Language', 'What does \"IDE\" stand for?', 'Integrated Development Environment', 'Internal Development Engine', 'Integrated Debug Environment', 'Intelligent Development Engine', 'a'),
(182, 'Programming Language', 'Which symbol is used to end a statement in C, C++, and Java?', '.', ';', ':', ',', 'b'),
(183, 'Programming Language', 'Which language is known as a low-level programming language?', 'Python', 'Assembly', 'Java', 'Ruby', 'b'),
(184, 'Programming Language', 'Which keyword is used to define a function in Python?', 'func', 'function', 'def', 'define', 'c'),
(185, 'Programming Language', 'What does \"OOP\" stand for?', 'Object-Oriented Programming', 'Object-Operational Process', 'Open Object Programming', 'Ordered Object Programming', 'a'),
(186, 'Programming Language', 'Which of the following is NOT a programming language?', 'Java', 'Python', 'HTML', 'Ruby', 'c'),
(187, 'Programming Language', 'Which language uses curly braces {} to define blocks of code?', 'Python', 'JavaScript', 'SQL', 'HTML', 'b'),
(188, 'Programming Language', 'What is the file extension for a Python file?', '.py', '.java', '.js', '.cpp', 'a'),
(189, 'Programming Language', 'Which language is mostly used for statistical computing and graphics?', 'Java', 'R', 'PHP', 'C#', 'b'),
(190, 'Programming Language', 'In Java, what is the keyword to inherit a class?', 'inherits', 'extends', 'implements', 'derives', 'b'),
(191, 'Programming Language', 'Which language is used for Android app development?', 'Swift', 'Java', 'Ruby', 'PHP', 'b'),
(192, 'Programming Language', 'What does \"SQL\" stand for?', 'Structured Query Language', 'Simple Query Language', 'Standard Query Language', 'Sequential Query Language', 'a'),
(193, 'Programming Language', 'Which keyword declares a constant in JavaScript?', 'const', 'constant', 'final', 'let', 'a'),
(194, 'Programming Language', 'What is the correct way to write a comment in Python?', '# This is a comment', '// This is a comment', '/* This is a comment */', '<!-- This is a comment -->', 'a'),
(195, 'Programming Language', 'Which language is primarily used for iOS app development?', 'Java', 'Swift', 'Kotlin', 'Objective-C', 'b'),
(196, 'Programming Language', 'What type of language is JavaScript?', 'Compiled', 'Interpreted', 'Markup', 'Query', 'b'),
(197, 'Programming Language', 'What is the value of the expression 3 + 2 * 2 in most programming languages?', '10', '7', '8', '9', 'b'),
(198, 'Programming Language', 'Which of these is a loop structure in programming?', 'if-else', 'switch', 'for', 'case', 'c'),
(199, 'Programming Language', 'In C++, which operator is used to access members of a pointer to an object?', '.', '->', '*', '&', 'b'),
(200, 'Programming Language', 'Which language is known for its use in AI and machine learning?', 'Python', 'C', 'Ruby', 'Perl', 'a'),
(201, 'Programming Language', 'Which of the following is a strongly typed language?', 'JavaScript', 'Python', 'Java', 'PHP', 'c'),
(202, 'Programming Language', 'Which operator is used for equality comparison in JavaScript?', '=', '==', '===', '!=', 'c'),
(203, 'Programming Language', 'Which language uses \"print()\" to output text?', 'C', 'Python', 'Java', 'HTML', 'b'),
(204, 'Programming Language', 'Which of the following languages supports multiple inheritance?', 'Java', 'C#', 'C++', 'Python', 'c'),
(205, 'Programming Language', 'What does \"API\" stand for?', 'Application Programming Interface', 'Applied Programming Instruction', 'Advanced Program Integration', 'Application Process Interaction', 'a'),
(206, 'Programming Language', 'Which language was created by Guido van Rossum?', 'JavaScript', 'Python', 'Ruby', 'Swift', 'b'),
(207, 'Programming Language', 'Which of the following is NOT a valid variable name in most programming languages?', 'var_1', '1_var', '_var', 'varOne', 'b'),
(208, 'Programming Language', 'What is the output of print(2 ** 3) in Python?', '6', '8', '9', '5', 'b'),
(209, 'Programming Language', 'Which keyword is used to handle exceptions in Java?', 'try', 'catch', 'throw', 'except', 'a'),
(210, 'Programming Language', 'What does \"HTML\" stand for?', 'Hyper Text Markup Language', 'High Text Markup Language', 'Hyperlinks and Text Markup Language', 'Hyper Tool Multi Language', 'a'),
(211, 'Programming Language', 'Which language is primarily used for creating webpages?', 'C++', 'Java', 'HTML', 'Python', 'c'),
(212, 'Programming Language', 'In JavaScript, which method adds an element to the end of an array?', 'pop()', 'push()', 'shift()', 'unshift()', 'b'),
(213, 'Programming Language', 'What does \"CSS\" stand for?', 'Cascading Style Sheets', 'Computer Style Sheets', 'Creative Style Sheets', 'Colorful Style Sheets', 'a'),
(214, 'Programming Language', 'Which of the following is NOT a data type in most programming languages?', 'Integer', 'String', 'Boolean', 'CharacterSet', 'd'),
(215, 'Programming Language', 'What is the output of the expression 5 % 2?', '2', '1', '0', '3', 'b'),
(216, 'Programming Language', 'Which of the following is used to define a block of code in Python?', 'Curly braces {}', 'Parentheses ()', 'Indentation', 'Semicolon ;', 'c'),
(217, 'Programming Language', 'Which language is known as the \"mother of all languages\"?', 'C', 'Assembly', 'Fortran', 'COBOL', 'a'),
(218, 'Programming Language', 'What does \"GUI\" stand for?', 'Graphical User Interface', 'General User Interaction', 'Graphical Unique Interface', 'General Utility Interface', 'a'),
(219, 'Programming Language', 'Which keyword is used to declare a variable in Java?', 'var', 'let', 'int', 'declare', 'c'),
(220, 'Programming Language', 'Which of the following languages is used for server-side scripting?', 'JavaScript', 'PHP', 'HTML', 'CSS', 'b'),
(221, 'Programming Language', 'Which function is used to read input from the user in C?', 'scanf()', 'input()', 'read()', 'cin', 'a'),
(222, 'Programming Language', 'What is the main purpose of the \"break\" statement?', 'Skip loop iteration', 'Exit loop', 'End program', 'Continue loop', 'b'),
(223, 'Programming Language', 'Which language uses \"console.log()\" to print output?', 'Java', 'Python', 'JavaScript', 'C++', 'c'),
(224, 'Programming Language', 'Which of these is a valid Python variable name?', '2var', 'var_2', 'var-2', 'var 2', 'b'),
(225, 'Programming Language', 'Which programming language is known for its use in system programming?', 'JavaScript', 'C', 'Ruby', 'Python', 'b'),
(226, 'Programming Language', 'Which of the following is a dynamically typed language?', 'Java', 'C++', 'Python', 'C#', 'c'),
(227, 'Programming Language', 'Which statement is used to create an infinite loop in most programming languages?', 'for(;;)', 'while(true)', 'Both A and B', 'None of the above', 'c'),
(228, 'Programming Language', 'Which language introduced the concept of \"objects\"?', 'C', 'Java', 'Simula', 'Python', 'c'),
(229, 'Programming Language', 'Which programming paradigm focuses on procedures and routines?', 'Object-Oriented', 'Functional', 'Procedural', 'Logic', 'c');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `image_url`, `website`) VALUES
(27, 'Greenwood High International School', 'images/greenwood.jpeg', 'https://www.greenwoodhigh.edu.in/'),
(28, 'Delhi Public School, RK Puram', 'images/dpsrkp_logo.jpeg', 'https://dpsrkp.net/'),
(29, 'La Martiniere for Boys, Kolkata', 'images/school3.jpg', 'https://lamartiniereforboys.co.in/'),
(30, 'Sunrise Public School', 'images/school4.jpeg', 'https://www.sunriseeducation.org/'),
(31, 'National Public School, Bangalore', 'images/nps.jpeg', 'https://www.npsinr.com/'),
(32, 'St. Xavier’s School, Kolkata', 'images/school5.jpg', 'https://www.sxschool.edu.in/'),
(33, 'The International School, Bangalore', 'images/school6.jpg', 'https://www.tisb.org/'),
(34, 'Bishop Cotton Boys’ School, Bangalore', 'images/school7.jpeg', 'https://www.bishopcotton.com/'),
(35, 'Sanskriti School, Delhi', 'images/school8.jpg', 'https://www.sanskritischool.com/'),
(36, 'The Doon School, Dehradun', 'images/school9.jpg', 'https://www.doonschool.com/'),
(37, 'Mallya Aditi International School, Bangalore', 'images/school10.jpeg', 'https://www.maas.edu.in/'),
(38, 'Jain International Residential School, Bangalore', 'images/school11.jpg', 'https://www.jirs.ac.in/'),
(39, 'Dhirubhai Ambani International School, Mumbai', 'images/school12.jpeg', 'https://www.dais.edu.in/'),
(40, 'Sardar Patel Vidyalaya, Delhi', 'images/school13.jpeg', 'https://www.spvdelhi.org/'),
(41, 'The Shri Ram School, Delhi', 'images/school14.jpg', 'https://www.tsrs.org/'),
(42, 'Vasant Valley School, Delhi', 'images/school15.jpg', 'https://www.vasantvalley.org/'),
(43, 'Kendriya Vidyalaya, Delhi', 'images/school16.jpeg', 'https://kvonline.edu.in/'),
(44, 'Army Public School, Bangalore', 'images/school17.jpeg', 'https://apsbangalore.edu.in/'),
(45, 'St. Mary’s School, Delhi', 'images/school18.jpg', 'https://www.stmarysschool.edu.in/'),
(46, 'Modern School, Delhi', 'images/school19.jpg', 'https://www.modernschool.net/'),
(47, 'Seth Anandram Jaipuria School, Lucknow', 'images/school20.jpg', 'https://www.jaipuriagroup.com/');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `caption` text DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `image_url`, `alt_text`, `caption`, `link_url`) VALUES
(4, 'images/Brainware-university.jpg', 'Brainware University', 'Brainware University - Kolkata, India', 'https://www.brainwareuniversity.ac.in/'),
(5, 'images/madras.JPG', 'Madraj medical', 'Madras Institute of Technology - Chennai, India', 'https://www.mmcrgggh.tn.gov.in/ords/r/wsmmc/mmc12055555/home'),
(6, 'images/iit-kanpur.jpg', 'IIT Kanpur', 'IIT Kanpur - Premier Tech Institute of India', 'https://www.iitk.ac.in/'),
(7, 'images/iitbombay.png', 'IIT Bombay', 'Indian Institute of Technology Bombay - Mumbai, India', 'https://www.iitb.ac.in/'),
(8, 'images/iisc.webp', 'IISc Bangalore', 'Indian Institute of Science - Bangalore, India', 'https://www.iisc.ac.in/');

-- --------------------------------------------------------

--
-- Table structure for table `soft_copy_books`
--

CREATE TABLE `soft_copy_books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `pdf` varchar(255) NOT NULL,
  `section` enum('library','other') DEFAULT 'library',
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soft_copy_books`
--

INSERT INTO `soft_copy_books` (`id`, `title`, `publisher`, `price`, `image`, `pdf`, `section`, `uploaded_at`) VALUES
(2, 'Android Life Cycle', 'Android', 0.00, NULL, 'uploads/pdfs/pdf_6852d6ea681458.90091842.pdf', 'library', '2025-06-18 15:10:34'),
(3, 'Activity Animation Example', 'Android', 0.00, NULL, 'uploads/pdfs/pdf_6852d82db3ae78.44203924.pdf', 'library', '2025-06-18 15:15:57'),
(4, 'Booth Algorithm', 'Computer Architecture', 0.00, NULL, 'uploads/pdfs/pdf_6852da4b2d18f0.96824896.pdf', 'library', '2025-06-18 15:24:59'),
(5, 'Data Communication', 'Computer Networks', 0.00, NULL, 'uploads/pdfs/pdf_6852dd6955a122.95805512.pdf', 'library', '2025-06-18 15:38:17');

-- --------------------------------------------------------

--
-- Table structure for table `top_exams`
--

CREATE TABLE `top_exams` (
  `id` int(11) NOT NULL,
  `exam_name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `top_exams`
--

INSERT INTO `top_exams` (`id`, `exam_name`, `link`) VALUES
(1, 'TNPSC Group 4', '/exams/tnpsc-group-4-exam'),
(2, 'JEE Advanced', 'https://jeeadv.ac.in/'),
(3, 'NEET UG', '/exams/neet'),
(4, 'UPSC CSE', '/exams/upsc-civil-services'),
(5, 'SSC CGL', '/exams/ssc-cgl'),
(6, 'GATE', '/exams/gate'),
(7, 'CAT', '/exams/cat'),
(8, 'CLAT', '/exams/clat'),
(9, 'XAT', '/exams/xat'),
(10, 'MAT', '/exams/mat');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `otp` varchar(6) DEFAULT NULL,
  `otp_expiry` datetime DEFAULT NULL,
  `verified` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `otp`, `otp_expiry`, `verified`) VALUES
(8, '', 'banerjeesouvik136@gmail.com', '$2y$10$Fsastu8Z46Dxk/MFHszCK.BXxqbMv.wsDY6f0jBvstqXwjfGScPVK', NULL, NULL, 1),
(9, '', 'koushikotaku1324@gmail.com', '$2y$10$IdeBdhQTK/98vbOuGVM9.OffaAZ5zGgZmvMEVja.AUmKK/gKUJPPu', NULL, NULL, 1),
(10, '', 'sayanmazumder75@gmail.com', '$2y$10$m.WsNzMT9b.NnvXuCdCw7OS/7jPKtQTSuWZM0dpti3FOEZtYnK5w2', NULL, NULL, 1),
(12, '', 'bwubca22170@brainwareuniversity.ac.in', '$2y$10$4iU7RJyZu/ky/9.lFAXY4Oz5ctlHaF0y9GwmPMbHa1vYLgFNbrptS', NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colleges`
--
ALTER TABLE `colleges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_books_buy`
--
ALTER TABLE `online_books_buy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_copy_books`
--
ALTER TABLE `soft_copy_books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `top_exams`
--
ALTER TABLE `top_exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `colleges`
--
ALTER TABLE `colleges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `online_books_buy`
--
ALTER TABLE `online_books_buy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `soft_copy_books`
--
ALTER TABLE `soft_copy_books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `top_exams`
--
ALTER TABLE `top_exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
