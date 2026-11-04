-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2026 at 04:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ces_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `learner_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `arrival_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `log_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `logged_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `budget_lines`
--

CREATE TABLE `budget_lines` (
  `budget_line_id` int(11) NOT NULL,
  `fund_source` varchar(80) NOT NULL,
  `program` varchar(80) NOT NULL,
  `allocated_amount` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `damage_reports`
--

CREATE TABLE `damage_reports` (
  `damage_id` int(11) NOT NULL,
  `out_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `donation_id` int(11) NOT NULL,
  `budget_line_id` int(11) DEFAULT NULL,
  `donor` varchar(120) NOT NULL,
  `type` enum('cash','in-kind') NOT NULL,
  `value` decimal(12,2) NOT NULL,
  `received_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donation_items`
--

CREATE TABLE `donation_items` (
  `donation_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL CHECK (`quantity` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `expense_id` int(11) NOT NULL,
  `budget_line_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `expense_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `learner_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `grading_period` tinyint(4) NOT NULL CHECK (`grading_period` between 1 and 4),
  `grade` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guardians`
--

CREATE TABLE `guardians` (
  `guardian_id` int(11) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `email` varchar(120) DEFAULT NULL,
  `notify_consent` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guardians`
--

INSERT INTO `guardians` (`guardian_id`, `first_name`, `last_name`, `email`, `notify_consent`) VALUES
(1, 'Carmen', 'Gonzales', 'carmen.gonzales1@mail.example.ph', 1),
(2, 'Antonio', 'Chavez', 'antonio.chavez2@mail.example.ph', 1),
(3, 'Jose', 'Padilla', 'jose.padilla3@mail.example.ph', 1),
(4, 'Marites', 'Cabanlit', 'marites.cabanlit4@mail.example.ph', 1),
(5, 'Noel', 'Jimenez', 'noel.jimenez5@mail.example.ph', 0),
(6, 'Joel', 'Bautista', 'joel.bautista6@mail.example.ph', 0),
(7, 'Sheila', 'Ignacio', 'sheila.ignacio7@mail.example.ph', 1),
(8, 'Allan', 'Cabanlit', 'allan.cabanlit8@mail.example.ph', 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(120) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_consumable` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `learners`
--

CREATE TABLE `learners` (
  `learner_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `lrn` char(12) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `learners`
--

INSERT INTO `learners` (`learner_id`, `section_id`, `lrn`, `last_name`, `first_name`, `address`, `birthdate`) VALUES
(1, 1, '145333147893', 'Fernandez', 'Maria', 'Purok 5, Barangay Cacaon', '2020-03-15'),
(2, 1, '140723862551', 'Salazar', 'Sheila', 'Purok 5, Barangay Cacaon', '2020-02-14'),
(3, 1, '173331138798', 'Ramos', 'Michael', 'Purok 1, Barangay Cacaon', '2020-02-09'),
(4, 1, '111971814781', 'Bautista', 'Arnel', 'Purok 5, Barangay Cacaon', '2020-06-28'),
(5, 1, '199833976260', 'Evangelista', 'Juan', 'Purok 1, Barangay Cacaon', '2020-01-18'),
(6, 1, '156148970712', 'Garcia', 'Jose', 'Purok 5, Barangay Cacaon', '2020-06-01'),
(7, 1, '175690072003', 'Chavez', 'Ramon', 'Purok 6, Barangay Cacaon', '2020-02-15');

-- --------------------------------------------------------

--
-- Table structure for table `learner_guardians`
--

CREATE TABLE `learner_guardians` (
  `learner_id` int(11) NOT NULL,
  `guardian_id` int(11) NOT NULL,
  `relationship` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `notification_id` int(11) NOT NULL,
  `guardian_id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `payroll_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `period_start` date NOT NULL,
  `period_end` date NOT NULL,
  `basic_pay` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_deductions`
--

CREATE TABLE `payroll_deductions` (
  `deduction_id` int(11) NOT NULL,
  `payroll_id` int(11) NOT NULL,
  `type` enum('SSS','PhilHealth','Pag-IBIG','Loan','Other') NOT NULL,
  `employee_share` decimal(12,2) NOT NULL,
  `employer_share` decimal(12,2) NOT NULL DEFAULT 0.00,
  `loan_balance` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_earnings`
--

CREATE TABLE `payroll_earnings` (
  `earning_id` int(11) NOT NULL,
  `payroll_id` int(11) NOT NULL,
  `type` enum('allowance','bonus') NOT NULL,
  `label` varchar(60) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `po_id` int(11) NOT NULL,
  `supply_officer_id` int(11) NOT NULL,
  `expense_id` int(11) DEFAULT NULL,
  `po_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `po_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL CHECK (`quantity` > 0),
  `unit_price` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `permission` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `permission`) VALUES
(1, 'Administrator', 'all'),
(2, 'Principal', 'view_all,approve_budget,approve_po,view_reports'),
(3, 'Teacher', 'manage_grades,manage_attendance,view_learners'),
(4, 'Registrar', 'manage_learners,manage_sections,view_grades'),
(5, 'Accountant', 'manage_budget,manage_expenses,manage_payroll'),
(6, 'Supply Officer', 'manage_inventory,manage_purchase_orders,manage_donations');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `section_id` int(11) NOT NULL,
  `grade_level` tinyint(4) NOT NULL,
  `section_name` varchar(50) NOT NULL,
  `adviser_user_id` int(11) NOT NULL,
  `school_year` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`section_id`, `grade_level`, `section_name`, `adviser_user_id`, `school_year`) VALUES
(1, 1, 'Sampaguita', 8, '2026-2027'),
(2, 1, 'Rosal', 9, '2026-2027'),
(3, 2, 'Camia', 10, '2026-2027'),
(4, 2, 'Orchid', 11, '2026-2027'),
(5, 3, 'Ilang-Ilang', 12, '2026-2027'),
(6, 3, 'Gumamela', 14, '2026-2027'),
(7, 4, 'Dahlia', 15, '2026-2027'),
(8, 4, 'Santan', 16, '2026-2027');

-- --------------------------------------------------------

--
-- Table structure for table `stock_in`
--

CREATE TABLE `stock_in` (
  `in_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `po_id` int(11) DEFAULT NULL,
  `donation_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL CHECK (`quantity` > 0),
  `received_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_out`
--

CREATE TABLE `stock_out` (
  `out_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL CHECK (`quantity` > 0),
  `issued_to` int(11) DEFAULT NULL,
  `issued_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_name`) VALUES
(5, 'Araling Panlipunan'),
(7, 'Edukasyon sa Pagpapakatao'),
(8, 'Edukasyong Pantahanan at Pangkabuhayan'),
(2, 'English'),
(1, 'Filipino'),
(6, 'MAPEH'),
(3, 'Mathematics'),
(4, 'Science');

-- --------------------------------------------------------

--
-- Table structure for table `trainings`
--

CREATE TABLE `trainings` (
  `training_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `training_date` date NOT NULL,
  `location_type` enum('inside','outside') NOT NULL,
  `venue` varchar(150) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training_attendees`
--

CREATE TABLE `training_attendees` (
  `training_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `sss_no` varchar(20) DEFAULT NULL,
  `philhealth_no` varchar(20) DEFAULT NULL,
  `pagibig_no` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role_id`, `first_name`, `last_name`, `email`, `password_hash`, `sss_no`, `philhealth_no`, `pagibig_no`) VALUES
(8, 3, 'Lorna', 'Soriano', 'lorna.soriano1@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '05-8602145-8', '21-\r\n083949066-8', NULL),
(9, 3, 'Allan', 'Macalinao', 'allan.macalinao2@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '81-1265844-\r\n0', '32-448452630-9', '6582-8025-8220'),
(10, 3, 'Ramon', 'Chavez', 'ramon.chavez3@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '05-1543829-9', '15-\r\n711649415-7', NULL),
(11, 3, 'Ramon', 'Fernandez', 'ramon.fernandez4@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '57-9511174-\r\n4', '32-568855765-2', '7355-6963-2792'),
(12, 3, 'Dennis', 'Salazar', 'dennis.salazar5@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '15-4742843-\r\n5', NULL, '1449-7660-8565'),
(13, 5, 'Elena', 'Ong', 'elena.ong6@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '78-8365506-2', '84-\r\n259967750-0', '1450-3784-9518'),
(14, 3, 'Imelda', 'Villanueva', 'imelda.villanueva7@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '01-2537392-\r\n4', '68-982104602-8', '3755-5597-4754'),
(15, 3, 'Juan', 'Macalinao', 'juan.macalinao8@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '07-5473548-\r\n6', '90-618847918-8', '7555-2182-4886'),
(16, 3, 'Lorna', 'Mendoza', 'lorna.mendoza9@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, NULL, '3368-\r\n8283-4728'),
(17, 3, 'Cesar', 'Rivera', 'cesar.rivera10@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '68-9832982-2', '90-\r\n044224852-7', '0226-9780-4385'),
(18, 3, 'Sheila', 'Garcia', 'sheila.garcia11@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '62-5280700-1', '45-\r\n028316632-3', '7352-8667-5347'),
(19, 5, 'Benjie', 'Ignacio', 'benjie.ignacio12@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '33-1159212-3', '36-\r\n082445607-8', '4572-1283-5769'),
(20, 3, 'Lorna', 'Hernandez', 'lorna.hernandez13@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '85-4177588-\r\n8', NULL, '4019-0187-9169'),
(21, 3, 'Noel', 'Jimenez', 'noel.jimenez14@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '02-5201612-8', '00-\r\n198152473-5', '7363-8560-7392'),
(22, 3, 'Rowena', 'Villanueva', 'rowena.villanueva15@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '97-\r\n9678073-6', '87-243854690-5', '8281-9539-1827'),
(23, 4, 'Arnel', 'Torres', 'arnel.torres16@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '66-0330428-\r\n4', NULL, '2038-1780-5780'),
(24, 3, 'Teresita', 'Macalinao', 'teresita.macalinao17@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '70-\r\n4121430-4', '07-418288983-7', '8538-6713-0066'),
(25, 3, 'Benjie', 'Garcia', 'benjie.garcia18@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '92-2328385-6', '27-\r\n105129837-2', '5278-1206-1769'),
(26, 3, 'Michael', 'Chavez', 'michael.chavez19@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '90-\r\n431634999-2', '8005-2791-3729'),
(27, 3, 'Mylene', 'Natividad', 'mylene.natividad20@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '12-0984264-\r\n0', '42-607911357-1', '4774-4796-7452'),
(28, 3, 'Elena', 'Jimenez', 'elena.jimenez21@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '33-4635213-6', '58-\r\n639848864-5', '7328-4093-4269'),
(29, 3, 'Carmen', 'Lim', 'carmen.lim22@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '09-409858463-\r\n8', '8498-5568-3068'),
(30, 3, 'Dennis', 'Mercado', 'dennis.mercado23@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '53-8965013-\r\n3', '96-726835081-1', '6179-5816-3540'),
(31, 5, 'Elena', 'Ocampo', 'elena.ocampo24@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '27-6113875-\r\n9', '15-327718621-0', '6177-0775-1062'),
(32, 3, 'Dennis', 'Lopez', 'dennis.lopez25@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '88-3615202-9', '44-\r\n613516199-4', '9943-9828-6408'),
(33, 3, 'Rommel', 'Navarro', 'rommel.navarro26@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '46-4397258-\r\n4', NULL, '9303-9955-1566'),
(34, 3, 'Rommel', 'Tan', 'rommel.tan27@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '15-6795965-0', '65-\r\n470567090-4', '8015-6464-4033'),
(35, 3, 'Ana', 'Ocampo', 'ana.ocampo28@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '05-9871988-9', '21-\r\n631111960-2', '8046-5873-0642'),
(36, 3, 'Mark', 'Lopez', 'mark.lopez29@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '96-017967720-\r\n4', '1263-4789-2352'),
(37, 3, 'Kristine', 'Perez', 'kristine.perez30@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '13-7615610-5', '14-\r\n833541488-1', '1378-5222-3841'),
(38, 3, 'Cecilia', 'Navarro', 'cecilia.navarro31@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '75-3325719-\r\n2', '48-085347042-4', '1341-4617-5442'),
(39, 3, 'Imelda', 'Bautista', 'imelda.bautista32@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '61-\r\n338005305-1', '8658-9305-9776'),
(40, 3, 'Ana', 'Lopez', 'ana.lopez33@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '53-8488568-1', '06-\r\n709072761-5', NULL),
(41, 3, 'Angelica', 'Torres', 'angelica.torres34@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '33-4370108-\r\n7', '62-394246466-8', '1665-3989-9745'),
(42, 5, 'Danilo', 'Dela Cruz', 'danilo.delacruz35@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '58-1342172-\r\n3', '34-967704410-4', '7516-8865-6114'),
(43, 3, 'Ramon', 'Quiroz', 'ramon.quiroz36@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '23-5953494-0', '29-\r\n474781824-4', '2619-5680-8010'),
(44, 3, 'Jose', 'Quiroz', 'jose.quiroz37@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '52-0070091-7', '39-\r\n273305703-0', '8778-1661-1463'),
(45, 3, 'Grace', 'Garcia', 'grace.garcia38@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '20-3830040-3', '04-\r\n263716715-5', '9301-2670-8129'),
(46, 3, 'Rowena', 'Abella', 'rowena.abella39@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '57-9299239-8', '33-\r\n702718615-8', '2999-1470-6755'),
(47, 3, 'Angelica', 'Evangelista', 'angelica.evangelista40@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '6\r\n516768259-7', '8124-1726-4366'),
(48, 3, 'Roberto', 'Dizon', 'roberto.dizon41@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '90-9208242-2', '42-\r\n628370950-6', '1889-8704-1517'),
(49, 3, 'Sheila', 'Bautista', 'sheila.bautista42@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '33-2526956-\r\n3', NULL, '2760-8219-6121'),
(50, 3, 'Teresita', 'Dizon', 'teresita.dizon43@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '70-\r\n022386969-5', '3274-6550-1351'),
(51, 4, 'Ana', 'Rosales', 'ana.rosales44@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '06-3717112-4', '51-\r\n658509868-0', '5431-6103-0225'),
(52, 3, 'Maria', 'Castillo', 'maria.castillo45@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '20-5114829-4', '83-\r\n419082386-1', '5212-2238-6378'),
(53, 3, 'Noel', 'Cabanlit', 'noel.cabanlit46@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '40-5424685-4', '42-\r\n764129744-7', '0471-3936-0550'),
(54, 3, 'Jasmine', 'Guinto', 'jasmine.guinto47@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '70-9605643-\r\n3', '79-268771099-6', '4694-0372-0568'),
(55, 3, 'Jerome', 'Tomas', 'jerome.tomas48@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '60-7568965-1', '48-\r\n078820396-2', '0987-6953-9711'),
(56, 3, 'Maria', 'Reyes', 'maria.reyes49@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '89-7600282-2', '70-\r\n169298442-7', '0624-4317-7466'),
(57, 3, 'Mark', 'Ramos', 'mark.ramos50@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '31-6777921-4', '53-\r\n447967252-1', '9903-3212-6686'),
(58, 3, 'Gerald', 'Castillo', 'gerald.castillo51@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '13-\r\n831294715-0', '2952-9207-4256'),
(59, 3, 'Christine', 'Cabanlit', 'christine.cabanlit52@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '37-\r\n1763452-6', '06-450114594-6', '9658-4500-7485'),
(60, 3, 'Ramon', 'Domingo', 'ramon.domingo53@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '01-3315604-\r\n0', '37-819596101-0', '5444-6151-5753'),
(61, 3, 'Rommel', 'Lopez', 'rommel.lopez54@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '10-2549092-\r\n1', '89-049953142-3', '3369-7951-6854'),
(62, 3, 'Roberto', 'Salazar', 'roberto.salazar55@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '48-0594980-\r\n6', '85-625284561-8', '6340-5613-5750'),
(63, 3, 'Liza', 'Hernandez', 'liza.hernandez56@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '26-6981433-\r\n1', '14-307477763-8', '6918-0441-8613'),
(64, 3, 'Nestor', 'Macalinao', 'nestor.macalinao57@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '69-5631439-\r\n5', NULL, '1807-5678-1724'),
(65, 3, 'Imelda', 'Mercado', 'imelda.mercado58@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '12-2028485-\r\n2', '58-025797817-6', '7849-9961-7978'),
(66, 3, 'Nestor', 'Pascual', 'nestor.pascual59@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '56-6055483-\r\n6', '88-785316244-8', '7748-3640-3201'),
(67, 6, 'Marilou', 'Garcia', 'marilou.garcia60@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '29-0357505-\r\n8', '77-854579101-6', '9293-8327-1745'),
(68, 3, 'Joshua', 'Torres', 'joshua.torres61@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '51-\r\n159378736-6', '4714-7323-1245'),
(69, 3, 'Carmen', 'Fernandez', 'carmen.fernandez62@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '77-\r\n1327440-4', '09-642824314-3', '9183-8149-5744'),
(70, 3, 'Rosario', 'Rivera', 'rosario.rivera63@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '27-\r\n125204265-1', '6269-5835-9027'),
(71, 3, 'Rosario', 'Bautista', 'rosario.bautista64@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '86-\r\n594605518-3', '0714-6555-7223'),
(72, 3, 'Mark', 'Dizon', 'mark.dizon65@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '30-2265490-8', '23-\r\n384305906-1', NULL),
(73, 3, 'Carmen', 'Andrada', 'carmen.andrada66@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '55-3548344-\r\n7', '51-995593929-8', '0361-3873-0375'),
(74, 3, 'Roberto', 'Soriano', 'roberto.soriano67@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '57-8605183-\r\n7', '25-398257537-0', '7308-0908-6277'),
(75, 3, 'Marites', 'Tomas', 'marites.tomas68@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '45-2743680-\r\n4', '04-172614225-1', NULL),
(76, 3, 'Roberto', 'Ocampo', 'roberto.ocampo69@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '57-6752605-\r\n8', '18-858938329-9', '7709-1317-5706'),
(77, 3, 'Ana', 'Torres', 'ana.torres70@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '67-6447978-3', '89-\r\n177603423-6', '9660-2683-7547'),
(78, 3, 'Mark', 'Mendoza', 'mark.mendoza71@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '47-7333743-\r\n6', NULL, '3044-6181-1833'),
(79, 3, 'Elena', 'Abella', 'elena.abella72@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '05-4049153-2', '87-\r\n078443173-6', '5127-2555-6517'),
(80, 3, 'John', 'Uy', 'john.uy73@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '60-0120266-2', '73-676669716-\r\n9', '3164-8919-8409'),
(81, 3, 'Fe', 'Ramos', 'fe.ramos74@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '79-7496224-5', '90-\r\n047184807-8', '9550-4397-4402'),
(82, 3, 'Grace', 'Castillo', 'grace.castillo75@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '60-7638653-5', '90-\r\n470876137-5', '9979-1622-6249'),
(83, 3, 'Eduardo', 'Torres', 'eduardo.torres76@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '07-8874549-\r\n2', '45-222504351-9', '0434-3817-2168'),
(84, 3, 'Teresita', 'Ignacio', 'teresita.ignacio77@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '56-8162104-\r\n8', '35-247875300-5', '9775-7488-7810'),
(85, 3, 'Imelda', 'Ocampo', 'imelda.ocampo78@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '10-2320930-\r\n6', '47-712376287-2', '4533-1618-8144'),
(86, 3, 'Teresita', 'Villanueva', 'teresita.villanueva79@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '00-\r\n1212066-6', '05-593282507-0', '6576-1265-2491'),
(87, 3, 'Teresita', 'Natividad', 'teresita.natividad80@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '11-\r\n4620325-8', '32-716339285-1', '0294-9244-2143'),
(88, 3, 'Ramon', 'Aquino', 'ramon.aquino81@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '77-2108357-\r\n9', '96-195309552-1', '1116-8728-5401'),
(89, 3, 'Danilo', 'Rivera', 'danilo.rivera82@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '72-1611211-6', '45-\r\n584195708-3', '0983-9439-4911'),
(90, 3, 'Gerald', 'Santos', 'gerald.santos83@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '14-7849920-4', '49-\r\n180535019-1', '6520-0346-8420'),
(91, 3, 'Teresita', 'Gonzales', 'teresita.gonzales84@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '76-4152497-\r\n7', '33-656200110-8', '5307-0015-3791'),
(92, 3, 'Maria', 'Mendoza', 'maria.mendoza85@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '71-7224599-\r\n4', '04-529313139-0', '2644-0818-6953'),
(93, 3, 'Arnel', 'Cruz', 'arnel.cruz86@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '13-249656799-\r\n5', '7946-4321-0772'),
(94, 3, 'Imelda', 'Rivera', 'imelda.rivera87@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '55-0900830-3', '49-\r\n352975077-7', '9440-5143-8159'),
(95, 3, 'Arnel', 'Salazar', 'arnel.salazar88@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '03-407512280-\r\n8', '6903-6345-4626'),
(96, 3, 'Mylene', 'Aguilar', 'mylene.aguilar89@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '72-1305161-\r\n6', '50-526517033-6', '9653-8648-2376'),
(97, 3, 'Allan', 'Aguilar', 'allan.aguilar90@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '34-2755603-4', '02-\r\n372961317-8', '7104-2491-8847'),
(98, 3, 'Allan', 'Lacson', 'allan.lacson91@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '22-8539598-9', '22-\r\n693109511-7', '0277-5216-2144'),
(99, 3, 'Zenaida', 'Soriano', 'zenaida.soriano92@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '43-9999596-\r\n5', NULL, '6205-5489-5864'),
(100, 3, 'Lorna', 'Andrada', 'lorna.andrada93@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '86-1625896-\r\n6', NULL, '5071-3534-9368'),
(101, 3, 'Arnel', 'Aquino', 'arnel.aquino94@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '78-0064173-5', '48-\r\n526818812-0', NULL),
(102, 3, 'Vilma', 'Salazar', 'vilma.salazar95@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '71-1005249-0', '51-\r\n429309241-0', '4057-4448-6071'),
(103, 3, 'Gerald', 'Mercado', 'gerald.mercado96@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '78-3184531-\r\n4', '02-544121174-0', '4589-2042-0468'),
(104, 6, 'Rey', 'Ignacio', 'rey.ignacio97@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '11-2515789-7', '94-\r\n864026718-6', NULL),
(105, 3, 'Angelica', 'Garcia', 'angelica.garcia98@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '85-9690307-\r\n4', '91-979510054-6', '8658-4619-5734'),
(106, 3, 'Allan', 'Mendoza', 'allan.mendoza99@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '78-5381296-\r\n3', '69-860401486-1', NULL),
(107, 3, 'Eduardo', 'Salazar', 'eduardo.salazar100@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '15-7438903-\r\n2', '70-698341903-2', '1927-2432-9896'),
(108, 3, 'Lorna', 'Lopez', 'lorna.lopez101@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '70-3642705-7', '54-\r\n081950739-2', '2391-1317-0905'),
(109, 3, 'Rey', 'Navarro', 'rey.navarro102@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '71-9668314-9', '85-\r\n093423040-5', '8735-9284-6312'),
(110, 6, 'Rosario', 'Andrada', 'rosario.andrada103@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '79-2627011-\r\n7', '44-651229257-9', '1736-2184-1554'),
(111, 3, 'Mylene', 'Perez', 'mylene.perez104@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '08-0222324-5', '50-\r\n543442531-2', '4129-4321-4456'),
(112, 3, 'Michael', 'Villanueva', 'michael.villanueva105@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '38-\r\n2328377-4', '85-012282228-4', '0730-4652-3903'),
(113, 3, 'Michael', 'Guinto', 'michael.guinto106@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '85-5479084-\r\n5', '38-399084164-4', '3207-6536-4604'),
(114, 3, 'Allan', 'Dizon', 'allan.dizon107@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '61-7840419-4', '65-\r\n426817353-1', '1759-1150-6021'),
(115, 3, 'Marites', 'Ramos', 'marites.ramos108@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '14-5494599-\r\n7', '16-473308694-3', '8444-6537-0500'),
(116, 3, 'Cecilia', 'Andrada', 'cecilia.andrada109@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '01-3914123-\r\n2', '01-783263368-7', NULL),
(117, 3, 'Arnel', 'Sison', 'arnel.sison110@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '80-7613420-7', '94-\r\n165572854-7', '6776-3448-8102'),
(118, 3, 'Paolo', 'Ramos', 'paolo.ramos111@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '35-1863544-6', '33-\r\n294303049-4', '7357-2071-0136'),
(119, 3, 'Luz', 'Cabanlit', 'luz.cabanlit112@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '30-4618669-4', '53-\r\n635492640-8', '6215-4771-2746'),
(120, 3, 'Roberto', 'Andrada', 'roberto.andrada113@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '29-\r\n858889510-8', '8325-9489-3549'),
(121, 3, 'Ramon', 'Gonzales', 'ramon.gonzales114@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '52-5832436-\r\n3', '47-684249158-8', '8190-6377-1172'),
(122, 3, 'Rommel', 'Quiroz', 'rommel.quiroz115@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '42-5649335-\r\n4', '62-073374592-6', '9325-8385-1534'),
(123, 3, 'Sheila', 'Macalinao', 'sheila.macalinao116@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '64-\r\n6428942-9', NULL, '7338-3662-0229'),
(124, 3, 'Luz', 'Rosales', 'luz.rosales117@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '29-9781547-8', '42-\r\n103778597-3', '2710-0171-5846'),
(125, 3, 'Allan', 'Quiroz', 'allan.quiroz118@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '50-4061872-5', '06-\r\n863037484-5', '1059-8134-1703'),
(126, 3, 'Rosario', 'Ramos', 'rosario.ramos119@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '24-9327960-\r\n3', '57-633755789-7', '8524-1324-8340'),
(127, 3, 'Lorna', 'Tan', 'lorna.tan120@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '34-2415468-2', '25-\r\n540537374-0', '2409-4407-4113'),
(128, 3, 'Gerald', 'Cabanlit', 'gerald.cabanlit121@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '05-\r\n017141765-9', '0144-9425-5269'),
(129, 3, 'Angelica', 'Torres', 'angelica.torres122@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '37-0839648-\r\n8', NULL, '8572-9958-4702'),
(130, 3, 'Dennis', 'Aguilar', 'dennis.aguilar123@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '24-5155760-\r\n4', NULL, '4277-5151-9747'),
(131, 3, 'Eduardo', 'Abella', 'eduardo.abella124@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '59-3226951-\r\n8', '50-847238733-5', '3431-2559-0222'),
(132, 3, 'Marilou', 'Cabanlit', 'marilou.cabanlit125@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '79-7656554-\r\n7', '25-672187870-1', NULL),
(133, 3, 'Joel', 'Bautista', 'joel.bautista126@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '93-\r\n351776874-5', '6500-1853-9769'),
(134, 3, 'Paolo', 'Ignacio', 'paolo.ignacio127@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '19-1127993-1', '31-\r\n130571786-5', '6100-6623-3455'),
(135, 3, 'Antonio', 'Flores', 'antonio.flores128@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '20-3023257-\r\n0', '74-074078728-2', '5723-9733-1219'),
(136, 4, 'Arnel', 'Reyes', 'arnel.reyes129@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '40-4576568-8', '47-\r\n067780576-4', '0034-9976-2569'),
(137, 3, 'Ramon', 'Pascual', 'ramon.pascual130@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '50-7572162-\r\n4', '66-745370867-2', '0472-8177-6039'),
(138, 3, 'Kristine', 'Ignacio', 'kristine.ignacio131@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '72-4637673-\r\n7', '85-304277209-2', '6410-3517-0435'),
(139, 3, 'Grace', 'Mercado', 'grace.mercado132@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '82-0801125-\r\n0', '65-308280886-4', '1526-3523-1806'),
(140, 3, 'Gerald', 'Evangelista', 'gerald.evangelista133@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '07-\r\n3742061-7', '75-259061764-1', '5776-3115-5126'),
(141, 6, 'Roberto', 'Rosales', 'roberto.rosales134@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '65-3387952-\r\n2', '07-777288420-6', '5345-4711-1125'),
(142, 3, 'Zenaida', 'Lim', 'zenaida.lim135@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '60-7354212-0', '83-\r\n332319670-7', '4018-7859-7029'),
(143, 3, 'Vilma', 'Salazar', 'vilma.salazar136@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '94-9238998-\r\n7', NULL, '6340-6016-4872'),
(144, 3, 'Allan', 'Abella', 'allan.abella137@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '05-9256570-8', '95-\r\n415374183-7', '0239-3207-1166'),
(145, 3, 'Angelica', 'Lopez', 'angelica.lopez138@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '26-6039406-\r\n0', '04-193258275-8', '4783-9425-6776'),
(146, 4, 'Marilou', 'Lacson', 'marilou.lacson139@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '50-3516108-\r\n9', '87-811585605-2', NULL),
(147, 3, 'Joel', 'Tomas', 'joel.tomas140@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '04-0264495-4', '14-\r\n950549303-3', '3283-2669-7579'),
(148, 3, 'Rey', 'Lopez', 'rey.lopez141@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '91-1235217-0', '65-\r\n644949158-6', '5893-7567-8224'),
(149, 3, 'Imelda', 'Abella', 'imelda.abella142@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '71-8011208-3', '14-\r\n042361644-7', '1532-3279-4744'),
(150, 3, 'Christine', 'Cabanlit', 'christine.cabanlit143@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '60-\r\n9462972-1', '43-861508617-2', '9654-0792-1125'),
(151, 1, 'Gerald', 'Ocampo', 'gerald.ocampo144@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '89-0012583-\r\n4', '51-085629957-0', '2119-7496-3555'),
(152, 3, 'Cecilia', 'Aguilar', 'cecilia.aguilar145@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '64-0255486-\r\n9', '52-457321475-5', '3089-9986-1211'),
(153, 3, 'Ricardo', 'Lopez', 'ricardo.lopez146@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '61-5969981-3', '94-\r\n134016405-0', '1659-8354-0950'),
(154, 3, 'Roberto', 'Rivera', 'roberto.rivera147@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '25-6540554-\r\n7', '33-558835105-5', '4233-2567-1042'),
(155, 3, 'Antonio', 'Ignacio', 'antonio.ignacio148@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '27-1743848-\r\n7', '45-776097302-1', '2686-0528-0024'),
(156, 3, 'Cesar', 'Ramos', 'cesar.ramos149@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '44-1345407-4', '29-\r\n348992789-5', '1222-1049-7998'),
(157, 3, 'Jose', 'Pascual', 'jose.pascual150@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '65-7003471-0', '50-\r\n111063197-3', '3944-2375-4061'),
(158, 3, 'Jocelyn', 'Ocampo', 'jocelyn.ocampo151@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '17-0049745-\r\n9', '50-610818187-2', '2654-3413-9365'),
(159, 3, 'Joel', 'Valdez', 'joel.valdez152@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '43-6589914-3', '13-\r\n096362770-0', '1729-6178-1759'),
(160, 3, 'Paolo', 'Ong', 'paolo.ong153@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '86-0704481-4', '98-\r\n083522526-5', '9540-1710-9529'),
(161, 3, 'Christine', 'Ignacio', 'christine.ignacio154@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '42-5105979-\r\n8', NULL, '4339-7743-2988'),
(162, 3, 'Jerome', 'Gonzales', 'jerome.gonzales155@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '22-\r\n0362740-7', '86-634624018-8', NULL),
(163, 3, 'Rey', 'Garcia', 'rey.garcia156@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '01-6721852-2', '36-\r\n765118580-8', '5404-8509-1444'),
(164, 3, 'Nestor', 'Sison', 'nestor.sison157@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '80-2008620-\r\n2', NULL, '2426-9301-0257'),
(165, 3, 'Michael', 'Hernandez', 'michael.hernandez158@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '85-\r\n2877177-2', '10-539093019-3', '0407-3360-1392'),
(166, 4, 'Joel', 'Aquino', 'joel.aquino159@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '95-9773386-6', '87-\r\n675048652-1', '6500-6285-4375'),
(167, 5, 'Rosario', 'Salazar', 'rosario.salazar160@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '58-2129692-\r\n8', NULL, NULL),
(168, 3, 'Vilma', 'Villanueva', 'vilma.villanueva161@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '89-6023933-\r\n2', '50-327087361-3', '9289-1734-6252'),
(169, 3, 'Juan', 'Lopez', 'juan.lopez162@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '37-0149031-0', '24-\r\n957556659-8', '4076-0400-8793'),
(170, 3, 'Marites', 'Padilla', 'marites.padilla163@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '31-0648740-\r\n2', '84-385225193-8', '1034-7122-8070'),
(171, 3, 'Rowena', 'Salazar', 'rowena.salazar164@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '20-9683864-\r\n0', '35-360216730-9', '9857-5749-0681'),
(172, 3, 'Rey', 'Ignacio', 'rey.ignacio165@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, NULL, '2053-9110-\r\n4575'),
(173, 3, 'Grace', 'Padilla', 'grace.padilla166@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '95-4182012-\r\n7', NULL, '4416-6380-9912'),
(174, 3, 'Christine', 'Torres', 'christine.torres167@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '23-5167799-\r\n6', '33-650613207-6', '7383-1546-2374'),
(175, 3, 'Arnel', 'Tan', 'arnel.tan168@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '51-9423730-5', '29-\r\n696663646-9', NULL),
(176, 3, 'Zenaida', 'Perez', 'zenaida.perez169@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '04-8741835-\r\n0', '97-026272745-0', NULL),
(177, 3, 'Nestor', 'Lopez', 'nestor.lopez170@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '55-0964599-0', '85-\r\n258495423-1', '2268-3205-1975'),
(178, 3, 'Joel', 'Flores', 'joel.flores171@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '20-4536208-3', '41-\r\n277307357-7', '1566-2486-3302'),
(179, 3, 'Carmen', 'Santos', 'carmen.santos172@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '47-0197931-\r\n9', '07-941756250-6', '5113-5288-2618'),
(180, 3, 'Rommel', 'Santos', 'rommel.santos173@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '43-7356283-\r\n5', '32-501765723-1', '2552-4189-5995'),
(181, 3, 'Michael', 'Evangelista', 'michael.evangelista174@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '92-\r\n3119742-4', '58-537940718-0', '6205-5348-5384'),
(182, 3, 'Cesar', 'Soriano', 'cesar.soriano175@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '34-9388726-5', '35-\r\n108645633-8', '9006-3915-5107'),
(183, 3, 'John', 'Uy', 'john.uy176@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '92-9705555-8', '46-\r\n053317411-8', '1327-2894-9938'),
(184, 5, 'Zenaida', 'Garcia', 'zenaida.garcia177@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '11-8714827-\r\n8', '38-513355376-7', NULL),
(185, 3, 'Jasmine', 'Reyes', 'jasmine.reyes178@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '22-2139339-\r\n2', '29-028061739-2', '3879-7225-1933'),
(186, 3, 'Roberto', 'Tomas', 'roberto.tomas179@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '38-2315917-\r\n2', NULL, '4933-3790-6660'),
(187, 3, 'John', 'Santos', 'john.santos180@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '96-7843062-8', '91-\r\n987991510-9', '6478-9401-8407'),
(188, 3, 'Cesar', 'Aquino', 'cesar.aquino181@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '27-9955061-\r\n0', NULL, '5144-3265-8995'),
(189, 3, 'Christine', 'Rosales', 'christine.rosales182@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '45-4572735-\r\n7', '34-274951187-9', NULL),
(190, 3, 'Antonio', 'Domingo', 'antonio.domingo183@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '04-\r\n6271244-3', '52-127951365-0', '4915-2054-6776'),
(191, 6, 'Sheila', 'Lacson', 'sheila.lacson184@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '38-8905481-1', '56-\r\n432677631-2', '1199-2906-0791'),
(192, 3, 'Antonio', 'Hernandez', 'antonio.hernandez185@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '46-\r\n8803436-3', '84-829914977-1', NULL),
(193, 2, 'Ramon', 'Domingo', 'ramon.domingo186@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '23-0143246-\r\n2', '25-628536717-3', NULL),
(194, 3, 'Grace', 'Ramos', 'grace.ramos187@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '61-1471116-8', '31-\r\n272887141-5', '1496-2359-6905'),
(195, 3, 'Paolo', 'Pascual', 'paolo.pascual188@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '21-9279361-\r\n7', NULL, NULL),
(196, 3, 'Danilo', 'Bautista', 'danilo.bautista189@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '29-8485034-\r\n5', '34-763668312-0', NULL),
(197, 3, 'Rosario', 'Jimenez', 'rosario.jimenez190@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '46-4110453-\r\n1', '59-787968810-1', '6018-0613-9826'),
(198, 3, 'Grace', 'Chavez', 'grace.chavez191@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '06-0511324-9', '06-\r\n457111578-9', '2732-1422-5063'),
(199, 3, 'Rommel', 'Perez', 'rommel.perez192@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '27-5140396-\r\n1', '29-653398455-3', '8539-5728-0620'),
(200, 3, 'Marites', 'Villanueva', 'marites.villanueva193@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '88-\r\n6815005-0', '05-951747736-7', '6441-7028-9402'),
(201, 5, 'Allan', 'Pascual', 'allan.pascual194@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '24-9430903-\r\n2', NULL, '6421-1845-8976'),
(202, 3, 'Rosario', 'Bautista', 'rosario.bautista195@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '46-5076697-\r\n7', '58-454595363-4', '9206-4280-3140'),
(203, 3, 'Juan', 'Cabanlit', 'juan.cabanlit196@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '52-4146804-2', '15-\r\n620745359-8', '6265-5240-1913'),
(204, 3, 'Juan', 'Mercado', 'juan.mercado197@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '62-6212455-\r\n2', '79-557321635-4', '3340-5508-7266'),
(205, 5, 'Vilma', 'Lopez', 'vilma.lopez198@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '23-1872162-8', '39-\r\n252735206-1', NULL),
(206, 3, 'Benjie', 'Jimenez', 'benjie.jimenez199@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '77-9821686-\r\n9', '35-975901705-7', '0238-2071-7490'),
(207, 3, 'Zenaida', 'Cruz', 'zenaida.cruz200@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '90-0602652-9', '23-\r\n166848312-3', '2946-8507-5694'),
(208, 3, 'Carmen', 'Andrada', 'carmen.andrada201@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '82-1072084-\r\n9', '55-326148840-5', '4919-5365-7729'),
(209, 6, 'Carmen', 'Salazar', 'carmen.salazar202@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '69-5249867-\r\n6', '13-497367257-8', '3905-7884-1187'),
(210, 3, 'Gerald', 'Santos', 'gerald.santos203@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '47-2326278-\r\n4', '48-751712046-3', '6844-5038-2485'),
(211, 3, 'Fe', 'Hernandez', 'fe.hernandez204@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '54-5772029-2', '72-\r\n577591943-8', '2490-3199-3647'),
(212, 3, 'Marilou', 'Natividad', 'marilou.natividad205@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '35-\r\n1236668-3', '71-937956987-1', '3493-2729-0430'),
(213, 3, 'Jerome', 'Flores', 'jerome.flores206@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '41-7301546-5', '55-\r\n002497826-8', '2569-5279-8030'),
(214, 3, 'Marilou', 'Bautista', 'marilou.bautista207@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '40-5144599-\r\n1', '93-909486050-9', '6411-1694-4977'),
(215, 3, 'Zenaida', 'Quiroz', 'zenaida.quiroz208@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '05-4831023-\r\n1', '03-245572097-6', NULL),
(216, 3, 'Arnel', 'Salazar', 'arnel.salazar209@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '01-4103335-2', '44-\r\n712177206-3', '0264-5340-6607'),
(217, 3, 'Arnel', 'Fernandez', 'arnel.fernandez210@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '31-2740643-\r\n8', '66-889447220-1', '6980-7325-4701'),
(218, 3, 'Luz', 'Salazar', 'luz.salazar211@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '78-0655784-7', '45-\r\n929456718-0', '8469-2064-7234'),
(219, 3, 'Mylene', 'Ocampo', 'mylene.ocampo212@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '61-3446119-\r\n8', '27-662818545-8', '1699-2953-6337'),
(220, 3, 'Nestor', 'Soriano', 'nestor.soriano213@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '88-1044386-\r\n9', '43-869936753-6', '7128-3409-1259'),
(221, 3, 'Jocelyn', 'Rivera', 'jocelyn.rivera214@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '88-0187038-\r\n6', '88-214980481-0', '0967-0960-5482'),
(222, 3, 'Zenaida', 'Santos', 'zenaida.santos215@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '82-0202901-\r\n7', '56-783240575-2', '7760-5766-9467'),
(223, 6, 'Michael', 'Aquino', 'michael.aquino216@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '57-0335927-\r\n7', '28-140989680-3', '7204-1019-3365'),
(224, 3, 'Grace', 'Uy', 'grace.uy217@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '18-5991658-6', NULL, '8151-\r\n6909-9470'),
(225, 3, 'Cecilia', 'Andrada', 'cecilia.andrada218@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '57-9633591-\r\n5', '69-065643714-3', NULL),
(226, 3, 'Fe', 'Bautista', 'fe.bautista219@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '95-4172702-7', '66-\r\n316038871-3', '5709-8918-1589'),
(227, 3, 'Rosario', 'Chavez', 'rosario.chavez220@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '63-5551419-\r\n2', '64-260045837-5', '1333-8441-9484'),
(228, 5, 'Antonio', 'Aguilar', 'antonio.aguilar221@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '88-2676801-\r\n1', '27-945686583-6', '2573-8536-1698'),
(229, 3, 'Cesar', 'Salazar', 'cesar.salazar222@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '57-1474417-1', '75-\r\n579059173-2', '0111-5219-3389'),
(230, 3, 'Juan', 'Ignacio', 'juan.ignacio223@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '40-0699467-4', '94-\r\n627385927-5', '6374-5611-1099'),
(231, 3, 'Danilo', 'Tomas', 'danilo.tomas224@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '34-2624663-9', '07-\r\n735405186-0', '8151-6050-5243'),
(232, 3, 'John', 'Aquino', 'john.aquino225@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '86-4815619-3', '51-\r\n991404309-6', '1839-8799-7786'),
(233, 3, 'Dennis', 'Cruz', 'dennis.cruz226@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '66-2387512-3', '17-\r\n426040775-3', '2076-4025-6414'),
(234, 3, 'Joshua', 'Ramos', 'joshua.ramos227@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '26-9747439-\r\n1', '59-892901462-7', '7869-6617-6864'),
(235, 3, 'Mark', 'Pascual', 'mark.pascual228@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '91-2796118-3', '77-\r\n204905713-8', '5147-3183-6658'),
(236, 3, 'Jocelyn', 'Evangelista', 'jocelyn.evangelista229@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '05-\r\n0760596-7', '72-776577064-7', '9740-3287-6720'),
(237, 3, 'Eduardo', 'Garcia', 'eduardo.garcia230@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '89-5659224-\r\n9', '57-679438331-3', '4508-2604-0982'),
(238, 3, 'Ramon', 'Mendoza', 'ramon.mendoza231@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '91-1287673-\r\n5', '66-232274020-7', '3289-5645-1064'),
(239, 3, 'Rowena', 'Macalinao', 'rowena.macalinao232@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '60-\r\n1233293-1', '17-396713956-8', '8533-3420-4291'),
(240, 3, 'Jocelyn', 'Reyes', 'jocelyn.reyes233@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '45-2836333-7', '06-\r\n561861398-0', '6664-8463-5432'),
(241, 3, 'Jerome', 'Mendoza', 'jerome.mendoza234@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '49-\r\n912955616-8', '3794-3450-9197'),
(242, 3, 'Cecilia', 'Gonzales', 'cecilia.gonzales235@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '54-5380307-\r\n4', NULL, '6804-5385-3877'),
(243, 3, 'Vilma', 'Ramos', 'vilma.ramos236@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '57-3604453-9', '75-\r\n731716218-8', '9195-8539-8217'),
(244, 3, 'John', 'Dela Cruz', 'john.delacruz237@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '74-5155102-\r\n2', '95-099655021-9', '0214-4235-6330'),
(245, 3, 'Cecilia', 'Cabanlit', 'cecilia.cabanlit238@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '84-6655474-\r\n9', '85-785371640-4', '2606-1906-7809'),
(246, 6, 'Rommel', 'Jimenez', 'rommel.jimenez239@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '32-\r\n4770866-5', '96-011194193-0', '8700-5375-9147'),
(247, 3, 'Noel', 'Rosales', 'noel.rosales240@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '01-5223707-3', '61-\r\n658664371-5', '5477-1227-0612'),
(248, 3, 'Christine', 'Soriano', 'christine.soriano241@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '53-\r\n1852573-6', '78-114098271-0', NULL),
(249, 3, 'Nestor', 'Guinto', 'nestor.guinto242@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '48-1880597-1', '53-\r\n567742722-2', '4079-6834-1342'),
(250, 3, 'Fe', 'Lim', 'fe.lim243@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '93-1047284-1', '77-944762266-\r\n4', '7680-8585-4941'),
(251, 3, 'Imelda', 'Rosales', 'imelda.rosales244@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '12-8372904-\r\n6', '98-986366990-2', '9944-4049-3135'),
(252, 3, 'Carmen', 'Tan', 'carmen.tan245@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '50-4328661-8', '88-\r\n885138110-8', NULL),
(253, 3, 'Fe', 'Perez', 'fe.perez246@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '59-9289211-8', '75-\r\n528925147-3', '7320-9655-0378'),
(254, 3, 'Ramon', 'Lacson', 'ramon.lacson247@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '68-9915773-\r\n8', '20-761994674-3', '9304-8422-3205'),
(255, 3, 'Rommel', 'Uy', 'rommel.uy248@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '75-8343013-\r\n4', NULL, '3002-9468-6507'),
(256, 3, 'Imelda', 'Quiroz', 'imelda.quiroz249@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '70-1973376-\r\n9', '95-400772119-1', '8995-3354-2139'),
(257, 3, 'Imelda', 'Tan', 'imelda.tan250@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '84-3594445-2', '79-\r\n070940839-3', NULL),
(258, 3, 'Elena', 'Quiroz', 'elena.quiroz251@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '78-3539405-5', '22-\r\n438945791-5', '2864-0486-5472'),
(259, 3, 'Maria', 'Evangelista', 'maria.evangelista252@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '66-\r\n8650682-6', '06-863013435-4', '5672-6881-7036'),
(260, 3, 'Dennis', 'Sison', 'dennis.sison253@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '38-3910643-1', '29-\r\n387048399-7', '3749-6419-9593'),
(261, 3, 'Antonio', 'Quiroz', 'antonio.quiroz254@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '42-\r\n506275821-9', '0046-7871-0934'),
(262, 4, 'Rowena', 'Mercado', 'rowena.mercado255@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '17-\r\n001333156-3', '2500-1008-2183'),
(263, 3, 'Cesar', 'Domingo', 'cesar.domingo256@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '04-5341830-\r\n4', '64-299386413-7', NULL),
(264, 3, 'Arnel', 'Abella', 'arnel.abella257@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '41-2799802-9', '27-\r\n611043589-0', '7046-3219-0454'),
(265, 3, 'Carmen', 'Salazar', 'carmen.salazar258@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '18-3164140-\r\n1', '74-849807646-8', '1524-1874-6493'),
(266, 3, 'Fe', 'Garcia', 'fe.garcia259@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '90-9957946-7', '23-\r\n978251712-7', '8066-9278-9001'),
(267, 6, 'Vilma', 'Navarro', 'vilma.navarro260@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '48-8128136-\r\n0', '47-057282074-4', '2490-2182-9846'),
(268, 3, 'Elena', 'Tan', 'elena.tan261@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '45-1697589-3', '71-\r\n361842232-3', '9551-1638-9373'),
(269, 3, 'Nestor', 'Lopez', 'nestor.lopez262@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '83-2690172-3', '55-\r\n143866832-6', '7471-8245-2077'),
(270, 3, 'Rowena', 'Padilla', 'rowena.padilla263@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '89-3635705-\r\n9', '38-413385402-6', NULL),
(271, 3, 'Michael', 'Guinto', 'michael.guinto264@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '27-\r\n625617345-8', '5154-4940-2012'),
(272, 3, 'Arnel', 'Dizon', 'arnel.dizon265@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '85-3582592-2', '50-\r\n802361135-2', '8705-3623-3742'),
(273, 3, 'Christine', 'Flores', 'christine.flores266@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '02-\r\n913680740-2', '9401-7706-6095'),
(274, 3, 'Ramon', 'Andrada', 'ramon.andrada267@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '56-2628343-\r\n3', '79-736250914-2', NULL),
(275, 3, 'Paolo', 'Pascual', 'paolo.pascual268@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '38-6973883-\r\n1', '38-230376524-6', '1450-1530-2606'),
(276, 3, 'Liza', 'Garcia', 'liza.garcia269@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '68-3668005-5', '32-\r\n035142196-5', '4573-9614-3879'),
(277, 3, 'Sheila', 'Soriano', 'sheila.soriano270@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '51-\r\n101542917-4', '3514-0695-5370'),
(278, 3, 'Rowena', 'Gonzales', 'rowena.gonzales271@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '17-\r\n0246002-9', '01-401903020-5', '5985-3433-1619');
INSERT INTO `users` (`user_id`, `role_id`, `first_name`, `last_name`, `email`, `password_hash`, `sss_no`, `philhealth_no`, `pagibig_no`) VALUES
(279, 3, 'Dennis', 'Jimenez', 'dennis.jimenez272@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '14-9611308-\r\n4', '29-144236003-1', '1195-6432-9203'),
(280, 3, 'Angelica', 'Andrada', 'angelica.andrada273@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '58-\r\n977569704-7', '1664-8819-3975'),
(281, 3, 'Liza', 'Lim', 'liza.lim274@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '71-6120397-0', NULL, '6943-\r\n0515-4213'),
(282, 3, 'Roberto', 'Valdez', 'roberto.valdez275@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '11-\r\n754812137-5', '3244-7485-5426'),
(283, 3, 'Juan', 'Dizon', 'juan.dizon276@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '19-5153827-6', '47-\r\n532052387-1', '0462-8098-0031'),
(284, 3, 'Rowena', 'Lopez', 'rowena.lopez277@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '86-2311512-\r\n0', NULL, '0446-8648-7004'),
(285, 4, 'Mylene', 'Mercado', 'mylene.mercado278@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '02-0751549-\r\n0', '35-573867889-8', '1531-3594-8738'),
(286, 3, 'Mylene', 'Lim', 'mylene.lim279@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '52-6652666-3', '28-\r\n022088909-2', '5487-9175-1856'),
(287, 3, 'Marilou', 'Perez', 'marilou.perez280@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '79-2802284-5', '24-\r\n849090820-8', '5125-6758-5145'),
(288, 5, 'Ramon', 'Rivera', 'ramon.rivera281@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '12-5883308-4', '85-\r\n150707781-4', '0311-5359-0916'),
(289, 6, 'Ricardo', 'Domingo', 'ricardo.domingo282@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '20-\r\n636398957-9', '8679-9883-6766'),
(290, 3, 'Ricardo', 'Evangelista', 'ricardo.evangelista283@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '81-\r\n8943284-2', NULL, '4658-2592-0944'),
(291, 3, 'Mylene', 'Garcia', 'mylene.garcia284@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '38-4085844-\r\n8', '39-716348059-0', '7029-2159-6883'),
(292, 3, 'Elena', 'Padilla', 'elena.padilla285@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '18-7846246-4', '37-\r\n342586012-8', '1871-9401-6886'),
(293, 3, 'Dennis', 'Garcia', 'dennis.garcia286@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '74-2491238-0', '91-\r\n198903453-0', '4649-1143-2430'),
(294, 3, 'Vilma', 'Macalinao', 'vilma.macalinao287@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '01-8720792-\r\n3', '62-798247518-3', NULL),
(295, 3, 'Rommel', 'Cruz', 'rommel.cruz288@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '85-9346833-0', '28-\r\n866683513-3', '1628-7637-7597'),
(296, 3, 'Sheila', 'Pascual', 'sheila.pascual289@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '80-8556084-\r\n3', '85-163816414-5', '7903-5647-7748'),
(297, 3, 'Rosario', 'Bautista', 'rosario.bautista290@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '72-2219346-\r\n1', '42-833410920-4', '1373-0467-2058'),
(298, 3, 'Liza', 'Santos', 'liza.santos291@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '62-1279898-2', '64-\r\n598430291-2', '7050-7563-3933'),
(299, 3, 'Paolo', 'Gonzales', 'paolo.gonzales292@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '91-8300685-\r\n7', '15-856783151-6', '0941-7653-0643'),
(300, 3, 'Cesar', 'Rivera', 'cesar.rivera293@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '34-4869300-5', '31-\r\n728739219-7', '9657-8666-9124'),
(301, 3, 'Antonio', 'Gonzales', 'antonio.gonzales294@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '42-\r\n2162170-0', '06-298667950-3', '6304-0170-8219'),
(302, 3, 'Teresita', 'Sison', 'teresita.sison295@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '33-9504343-7', '79-\r\n818308703-5', '6349-5400-8907'),
(303, 3, 'Roberto', 'Rosales', 'roberto.rosales296@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '19-7353800-\r\n3', '22-742983565-3', '1830-1609-9602'),
(304, 6, 'Roberto', 'Santos', 'roberto.santos297@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '63-9212702-\r\n0', '03-751697162-4', '7570-7211-5716'),
(305, 3, 'Gerald', 'Castillo', 'gerald.castillo298@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '66-8412523-\r\n3', '03-617335270-0', '5785-1156-1400'),
(306, 3, 'Nestor', 'Mendoza', 'nestor.mendoza299@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '72-\r\n343502328-2', '1773-2306-7855'),
(307, 3, 'Michael', 'Castillo', 'michael.castillo300@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '73-\r\n594875468-8', '3967-5472-1802'),
(308, 3, 'Paolo', 'Castillo', 'paolo.castillo301@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '04-7939373-6', '98-\r\n560868919-0', '6885-3106-9511'),
(309, 3, 'Antonio', 'Ramos', 'antonio.ramos302@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '15-8054797-\r\n8', '83-388161839-8', '2963-3453-2278'),
(310, 3, 'Teresita', 'Ong', 'teresita.ong303@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '75-835944952-\r\n6', '4581-7758-8225'),
(311, 3, 'John', 'Fernandez', 'john.fernandez304@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '41-\r\n114246873-6', '3389-2626-6003'),
(312, 3, 'Danilo', 'Soriano', 'danilo.soriano305@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '11-2572339-\r\n8', '41-390310046-9', '3119-9222-6961'),
(313, 3, 'Rowena', 'Quiroz', 'rowena.quiroz306@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '57-0935396-\r\n7', '30-342522923-8', '1937-8113-7388'),
(314, 3, 'Vilma', 'Dizon', 'vilma.dizon307@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '18-7558191-8', '26-\r\n132991354-3', '2850-0180-5626'),
(315, 3, 'Lorna', 'Domingo', 'lorna.domingo308@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '56-\r\n369698889-5', '6649-9899-2566'),
(316, 1, 'Christine', 'Rivera', 'christine.rivera309@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '60-1445077-\r\n0', '43-968517767-0', '9087-0077-4336'),
(317, 3, 'Mylene', 'Cruz', 'mylene.cruz310@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '20-225838192-\r\n2', '5463-0468-7036'),
(318, 3, 'Nestor', 'Gonzales', 'nestor.gonzales311@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '84-9296677-\r\n9', '32-739676514-4', '6970-8925-9473'),
(319, 3, 'Christine', 'Salazar', 'christine.salazar312@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '06-5139752-\r\n0', '62-625960057-4', '6429-4724-2692'),
(320, 3, 'Grace', 'Ong', 'grace.ong313@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '71-0053672-8', '97-\r\n331693414-2', '5391-8440-4127'),
(321, 5, 'Sheila', 'Villanueva', 'sheila.villanueva314@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '49-8559613-\r\n7', '46-632172636-7', '8524-6867-5334'),
(322, 3, 'Imelda', 'Valdez', 'imelda.valdez315@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '90-1463697-\r\n9', '93-958175942-6', '5397-2021-7376'),
(323, 3, 'Noel', 'Villanueva', 'noel.villanueva316@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '68-4610482-\r\n9', '88-132163690-0', '9168-1844-5551'),
(324, 3, 'Maria', 'Evangelista', 'maria.evangelista317@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '33-\r\n4384890-7', '31-408183691-7', '3475-3413-7897'),
(325, 3, 'Nestor', 'Abella', 'nestor.abella318@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '42-\r\n624847632-0', '3454-8587-7524'),
(326, 6, 'Zenaida', 'Valdez', 'zenaida.valdez319@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '21-8555064-\r\n9', '14-290139479-6', '0733-4527-9468'),
(327, 3, 'Mylene', 'Dizon', 'mylene.dizon320@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '04-\r\n179103638-5', '7112-7092-9962'),
(328, 3, 'Lorna', 'Abella', 'lorna.abella321@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '61-4802211-4', '32-\r\n842215939-3', '1561-2040-1244'),
(329, 3, 'Cesar', 'Ocampo', 'cesar.ocampo322@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '20-8618634-\r\n4', '54-068882023-1', NULL),
(330, 1, 'Fe', 'Evangelista', 'fe.evangelista323@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '83-2488710-\r\n2', '12-949708201-7', '2982-5027-5271'),
(331, 3, 'Marites', 'Hernandez', 'marites.hernandez324@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '21-\r\n2942736-3', '95-086530193-7', '2715-2639-8427'),
(332, 2, 'Marilou', 'Ignacio', 'marilou.ignacio325@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '93-\r\n470944617-7', '9454-4867-3379'),
(333, 3, 'Liza', 'Padilla', 'liza.padilla326@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '84-2244566-5', '15-\r\n525635399-8', '3547-8863-5657'),
(334, 3, 'Paolo', 'Abella', 'paolo.abella327@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '03-823660826-\r\n9', '7415-5356-5255'),
(335, 3, 'Dennis', 'Ignacio', 'dennis.ignacio328@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '95-7971829-\r\n0', '86-115935044-5', '1261-4443-0136'),
(336, 3, 'Cesar', 'Garcia', 'cesar.garcia329@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '24-1164160-9', '79-\r\n594787558-5', '4294-2705-6953'),
(337, 3, 'Zenaida', 'Guinto', 'zenaida.guinto330@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '18-6033040-\r\n8', '30-387903834-8', '1230-5036-2812'),
(338, 3, 'Cesar', 'Mendoza', 'cesar.mendoza331@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '51-6236546-\r\n0', '60-443376647-5', '5322-6385-7720'),
(339, 3, 'Michael', 'Mendoza', 'michael.mendoza332@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '86-\r\n8313246-9', '94-750091470-4', '5454-5746-9758'),
(340, 3, 'Jasmine', 'Navarro', 'jasmine.navarro333@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '09-6067416-\r\n7', '66-135098937-2', '0724-4324-3660'),
(341, 3, 'Luz', 'Tomas', 'luz.tomas334@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '37-1160795-6', '55-\r\n264155745-4', '2838-4233-0843'),
(342, 6, 'Sheila', 'Torres', 'sheila.torres335@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '52-5498815-8', '43-\r\n261445032-9', '3992-4986-3391'),
(343, 3, 'Cecilia', 'Villanueva', 'cecilia.villanueva336@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '99-\r\n4333335-7', '24-958218148-7', '3136-8958-5110'),
(344, 3, 'Arnel', 'Santos', 'arnel.santos337@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '31-4784108-9', '04-\r\n427345327-9', '0612-1955-8555'),
(345, 3, 'Rey', 'Ramos', 'rey.ramos338@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '59-2648464-1', '07-\r\n657796763-2', '4526-8209-2248'),
(346, 3, 'Elena', 'Chavez', 'elena.chavez339@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '12-3119612-7', '57-\r\n405951434-7', '2794-7221-5943'),
(347, 3, 'Elena', 'Aguilar', 'elena.aguilar340@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '62-4000178-6', '63-\r\n824707607-6', '2613-9975-0279'),
(348, 3, 'Roberto', 'Quiroz', 'roberto.quiroz341@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '64-2979484-\r\n2', '66-035520972-5', '4839-3973-9459'),
(349, 3, 'Jasmine', 'Cabanlit', 'jasmine.cabanlit342@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '79-\r\n0977803-9', '51-470242437-7', '8715-5204-9512'),
(350, 3, 'Michael', 'Fernandez', 'michael.fernandez343@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '91-\r\n8404367-0', '48-853529111-3', '3596-1739-4678'),
(351, 3, 'Joel', 'Mendoza', 'joel.mendoza344@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '70-5870221-\r\n6', NULL, '0327-3552-4502'),
(352, 3, 'Marilou', 'Castillo', 'marilou.castillo345@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '19-\r\n436506524-3', '3742-0670-4957'),
(353, 3, 'Cecilia', 'Lim', 'cecilia.lim346@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '11-1145809-9', '59-\r\n698980325-9', '1524-9895-2053'),
(354, 4, 'Zenaida', 'Aquino', 'zenaida.aquino347@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '07-1843940-\r\n0', '32-542925402-9', '4985-2375-0668'),
(355, 3, 'Imelda', 'Mercado', 'imelda.mercado348@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '74-1674793-\r\n4', '42-319915036-1', '2638-8167-1739'),
(356, 3, 'Antonio', 'Domingo', 'antonio.domingo349@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '81-\r\n2143503-3', '94-447555356-8', '5530-8287-5910'),
(357, 3, 'Benjie', 'Cabanlit', 'benjie.cabanlit350@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '36-5960979-\r\n9', '05-162642230-6', '0656-1756-2915'),
(358, 3, 'Marilou', 'Torres', 'marilou.torres351@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '81-6823068-\r\n9', '23-877166580-1', '3635-7794-9691'),
(359, 3, 'Zenaida', 'Pascual', 'zenaida.pascual352@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '53-5297943-\r\n9', NULL, '6469-1738-3690'),
(360, 3, 'Jerome', 'Chavez', 'jerome.chavez353@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '25-3152164-\r\n4', NULL, '2366-3376-8832'),
(361, 3, 'Marites', 'Hernandez', 'marites.hernandez354@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '77-\r\n9353803-3', '90-160422508-8', '7278-1409-0964'),
(362, 3, 'Michael', 'Chavez', 'michael.chavez355@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '49-\r\n621793983-5', '7053-3155-6177'),
(363, 3, 'Cecilia', 'Navarro', 'cecilia.navarro356@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '22-2632971-\r\n6', '43-475423368-6', '0786-7378-2984'),
(364, 3, 'Liza', 'Cruz', 'liza.cruz357@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '45-4378285-7', '44-\r\n216911461-3', NULL),
(365, 3, 'Zenaida', 'Jimenez', 'zenaida.jimenez358@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '50-8384682-\r\n7', '04-746270920-3', '9837-5066-2866'),
(366, 3, 'Eduardo', 'Uy', 'eduardo.uy359@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '29-3506064-2', '25-\r\n299089790-8', '2624-8161-5126'),
(367, 3, 'Jose', 'Lopez', 'jose.lopez360@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '88-1813580-\r\n4', NULL, '5014-9667-0676'),
(368, 3, 'Cesar', 'Soriano', 'cesar.soriano361@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '36-2691183-0', '67-\r\n806090018-6', '5448-1656-5520'),
(369, 3, 'Christine', 'Torres', 'christine.torres362@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '83-2473791-\r\n7', '88-105883947-5', '9326-5132-4064'),
(370, 3, 'Allan', 'Abella', 'allan.abella363@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '05-8971231-5', '72-\r\n769254112-3', '4178-1663-2193'),
(371, 4, 'Lorna', 'Rivera', 'lorna.rivera364@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '77-090816035-\r\n6', '3491-3364-3031'),
(372, 1, 'Antonio', 'Ignacio', 'antonio.ignacio365@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '16-8112652-\r\n9', '75-283180845-1', '9764-0442-5906'),
(373, 3, 'Jerome', 'Valdez', 'jerome.valdez366@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '78-1896595-\r\n2', '05-601180274-2', NULL),
(374, 3, 'Zenaida', 'Torres', 'zenaida.torres367@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '53-3393739-\r\n4', '11-715201564-3', '7566-3795-6936'),
(375, 3, 'Roberto', 'Guinto', 'roberto.guinto368@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '63-\r\n629242167-4', '0047-6892-1158'),
(376, 3, 'Gerald', 'Tomas', 'gerald.tomas369@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '18-3802108-4', '88-\r\n839967265-6', '8474-2269-9557'),
(377, 3, 'Lorna', 'Rosales', 'lorna.rosales370@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '76-2674464-6', '40-\r\n870447739-1', '5999-8569-6876'),
(378, 3, 'Carmen', 'Tomas', 'carmen.tomas371@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '58-9781882-\r\n7', '20-013467924-4', '0270-3713-6587'),
(379, 3, 'Rowena', 'Gonzales', 'rowena.gonzales372@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '38-\r\n5591545-5', '31-009587010-6', NULL),
(380, 3, 'Jerome', 'Garcia', 'jerome.garcia373@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '64-0422083-\r\n3', NULL, '5339-3399-6147'),
(381, 3, 'Rowena', 'Flores', 'rowena.flores374@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '84-9113660-\r\n9', '52-519519428-4', '1232-4025-7767'),
(382, 3, 'Marilou', 'Ong', 'marilou.ong375@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '10-5310502-2', '08-\r\n912935099-0', '1340-1939-1635'),
(383, 3, 'Dennis', 'Soriano', 'dennis.soriano376@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '20-3993073-\r\n9', '14-593149688-0', '8275-2224-6911'),
(384, 3, 'Juan', 'Jimenez', 'juan.jimenez377@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '44-5431705-6', '73-\r\n945097247-1', '0269-3391-8417'),
(385, 3, 'Grace', 'Uy', 'grace.uy378@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '85-2647161-2', '06-\r\n992432225-5', '4206-6703-4447'),
(386, 3, 'Nestor', 'Macalinao', 'nestor.macalinao379@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '88-\r\n4973034-4', '62-134077913-3', '6110-9121-1153'),
(387, 3, 'Vilma', 'Rivera', 'vilma.rivera380@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '78-4070718-8', '81-\r\n521579003-7', '9056-6961-0444'),
(388, 3, 'Maria', 'Macalinao', 'maria.macalinao381@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '97-4842221-\r\n6', '72-702197581-1', '3101-4504-8767'),
(389, 3, 'Juan', 'Guinto', 'juan.guinto382@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '25-5397890-2', '69-\r\n952290851-5', '1812-8904-8540'),
(390, 3, 'Ana', 'Villanueva', 'ana.villanueva383@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '76-7805310-\r\n1', '85-061253924-6', '8136-1572-2347'),
(391, 3, 'Maria', 'Flores', 'maria.flores384@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '37-3204297-0', '99-\r\n038297487-8', '4902-3464-0464'),
(392, 3, 'Rommel', 'Rivera', 'rommel.rivera385@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '68-7941923-\r\n5', '27-951668956-1', '7384-6610-0364'),
(393, 3, 'Jerome', 'Pascual', 'jerome.pascual386@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '49-\r\n682345563-8', '4504-6220-2144'),
(394, 3, 'Liza', 'Tan', 'liza.tan387@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '55-0939416-1', '17-\r\n438958971-5', '5071-9684-6364'),
(395, 3, 'Fe', 'Mercado', 'fe.mercado388@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '20-6187738-5', '72-\r\n558514673-4', NULL),
(396, 3, 'Liza', 'Hernandez', 'liza.hernandez389@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, NULL, '9527\r\n0551-6310'),
(397, 3, 'Jose', 'Lacson', 'jose.lacson390@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '41-4200082-0', '56-\r\n596914762-5', '1796-1791-6607'),
(398, 3, 'Ramon', 'Jimenez', 'ramon.jimenez391@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '74-4698810-\r\n5', NULL, '8237-6489-5307'),
(399, 3, 'Cesar', 'Aquino', 'cesar.aquino392@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '58-4914669-7', '02-\r\n021951176-5', '0538-8306-7755'),
(400, 3, 'Joel', 'Salazar', 'joel.salazar393@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '92-0599208-4', '51-\r\n149710750-0', '4588-6484-6664'),
(401, 3, 'Marites', 'Ignacio', 'marites.ignacio394@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '20-5129168-\r\n0', '33-503871291-6', '4235-5243-4685'),
(402, 3, 'Roberto', 'Ocampo', 'roberto.ocampo395@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '12-\r\n7798392-1', '03-582434247-0', '6735-2628-9421'),
(403, 3, 'Christine', 'Flores', 'christine.flores396@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '63-7192484-\r\n2', '71-618298555-5', '7158-7549-3537'),
(404, 3, 'Michael', 'Perez', 'michael.perez397@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '95-8111852-\r\n1', '02-048575084-7', '8641-2902-4176'),
(405, 3, 'Antonio', 'Padilla', 'antonio.padilla398@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '14-7652755-\r\n5', '91-209794565-2', '4662-3950-3057'),
(406, 3, 'Vilma', 'Mercado', 'vilma.mercado399@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '57-6457334-\r\n9', '23-721765824-2', '4514-6177-9967'),
(407, 5, 'Marites', 'Dela Cruz', 'marites.delacruz400@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '37-\r\n2119500-5', '96-758384186-1', '6338-8442-4443'),
(408, 3, 'Roberto', 'Lopez', 'roberto.lopez401@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '03-0384626-\r\n7', '11-992316277-9', '6803-0968-5604'),
(409, 3, 'Joshua', 'Villanueva', 'joshua.villanueva402@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '08-\r\n0886761-2', '01-719386481-7', NULL),
(410, 3, 'Allan', 'Castillo', 'allan.castillo403@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '95-2223297-8', '68-\r\n722160104-0', NULL),
(411, 3, 'Mylene', 'Castillo', 'mylene.castillo404@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '12-3106878-\r\n9', '36-379239117-7', '2328-3651-2755'),
(412, 3, 'Antonio', 'Dela Cruz', 'antonio.delacruz405@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '14-\r\n6312173-6', '28-462117245-1', '2667-0012-0871'),
(413, 3, 'Ana', 'Tan', 'ana.tan406@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '95-4720033-3', '47-\r\n768245615-5', '1936-3903-7918'),
(414, 3, 'Jose', 'Macalinao', 'jose.macalinao407@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '31-5671252-\r\n6', '58-396845396-8', '2289-1762-3057'),
(415, 3, 'John', 'Uy', 'john.uy408@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '68-4766542-6', '58-\r\n230291230-5', '6250-8454-1738'),
(416, 3, 'Ramon', 'Sison', 'ramon.sison409@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '13-\r\n731997331-7', '6104-1116-6413'),
(417, 3, 'Fe', 'Quiroz', 'fe.quiroz410@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '75-7299822-3', '77-\r\n100604091-0', '6751-3576-4849'),
(418, 3, 'Cesar', 'Mendoza', 'cesar.mendoza411@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '60-1244730-\r\n9', '97-743849615-4', '9945-6508-9333'),
(419, 3, 'Luz', 'Perez', 'luz.perez412@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '87-119727761-\r\n8', '7083-9668-3166'),
(420, 3, 'Fe', 'Rivera', 'fe.rivera413@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '61-6459545-0', '57-\r\n651822964-0', '8654-8522-7337'),
(421, 3, 'Mark', 'Natividad', 'mark.natividad414@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '78-8370376-\r\n4', '83-528436421-7', '9487-7225-3165'),
(422, 3, 'Mark', 'Reyes', 'mark.reyes415@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '22-3353747-4', '19-\r\n766909162-2', '6030-9698-9059'),
(423, 3, 'Paolo', 'Garcia', 'paolo.garcia416@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '51-0117732-8', '18-\r\n223943513-1', '3849-0523-0509'),
(424, 3, 'Luz', 'Evangelista', 'luz.evangelista417@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '48-0279456-\r\n6', '89-171295910-1', '3427-2346-7591'),
(425, 3, 'Teresita', 'Navarro', 'teresita.navarro418@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '78-3599798-\r\n1', '18-315337555-6', NULL),
(426, 3, 'Dennis', 'Torres', 'dennis.torres419@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '16-0631569-2', '92-\r\n538885446-7', '1710-7157-9550'),
(427, 3, 'Roberto', 'Guinto', 'roberto.guinto420@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '52-2230306-\r\n6', '71-602212990-2', '7870-8830-0855'),
(428, 3, 'Paolo', 'Salazar', 'paolo.salazar421@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '43-7564323-6', '73-\r\n902512941-2', '3897-4179-4411'),
(429, 3, 'Jasmine', 'Guinto', 'jasmine.guinto422@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '90-\r\n652031957-3', '9570-3508-6702'),
(430, 3, 'Kristine', 'Santos', 'kristine.santos423@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '65-7350358-\r\n1', '61-458234640-4', '5648-5062-0454'),
(431, 3, 'Elena', 'Salazar', 'elena.salazar424@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '19-6547453-4', '22-\r\n297982986-6', '6345-6787-2091'),
(432, 3, 'Ramon', 'Quiroz', 'ramon.quiroz425@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '33-6826510-\r\n8', '70-143895973-9', '4605-8533-3976'),
(433, 3, 'Vilma', 'Uy', 'vilma.uy426@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '77-2966182-9', '96-\r\n801625665-3', NULL),
(434, 3, 'Antonio', 'Soriano', 'antonio.soriano427@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '38-2680105-\r\n1', '41-684815110-2', '7309-7043-3522'),
(435, 3, 'Imelda', 'Salazar', 'imelda.salazar428@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '58-\r\n077414346-1', '4392-4465-7815'),
(436, 3, 'Rey', 'Padilla', 'rey.padilla429@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '40-7337707-5', '47-\r\n321661919-8', '3156-3808-9389'),
(437, 3, 'Michael', 'Lim', 'michael.lim430@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '15-053550534-\r\n1', '1663-7884-5393'),
(438, 4, 'Rommel', 'Macalinao', 'rommel.macalinao431@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '39-\r\n5969552-9', '29-459853798-2', '3319-0598-9456'),
(439, 3, 'Zenaida', 'Guinto', 'zenaida.guinto432@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '76-4350624-\r\n0', '38-021185424-4', '1282-3586-2008'),
(440, 3, 'Benjie', 'Dizon', 'benjie.dizon433@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '06-7510717-7', '69-\r\n784388287-1', '3222-0611-2614'),
(441, 3, 'Ana', 'Torres', 'ana.torres434@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '50-8301919-5', '93-\r\n082355273-2', '5566-7406-2802'),
(442, 3, 'Noel', 'Navarro', 'noel.navarro435@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '11-4135209-5', '59-\r\n406339983-4', '5004-9960-6120'),
(443, 3, 'Elena', 'Santos', 'elena.santos436@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '07-\r\n540113137-1', '1640-5785-2224'),
(444, 3, 'Paolo', 'Mercado', 'paolo.mercado437@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '55-6271304-\r\n3', '30-994982074-0', '1767-7100-6806'),
(445, 3, 'Michael', 'Valdez', 'michael.valdez438@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '11-2893232-\r\n5', '93-090987020-5', NULL),
(446, 3, 'Arnel', 'Mendoza', 'arnel.mendoza439@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '60-7317201-\r\n0', '75-715691657-8', '4601-2341-0703'),
(447, 3, 'Rommel', 'Uy', 'rommel.uy440@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '73-4588254-\r\n5', NULL, '9767-7518-6085'),
(448, 3, 'Juan', 'Aquino', 'juan.aquino441@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '25-8855685-8', '96-\r\n239970452-3', '9224-8321-4325'),
(449, 3, 'Kristine', 'Chavez', 'kristine.chavez442@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '82-4324192-\r\n3', '86-088873048-6', '1990-4960-8823'),
(450, 3, 'Roberto', 'Mercado', 'roberto.mercado443@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '07-\r\n3848011-3', '44-094978271-5', '2925-8260-4126'),
(451, 3, 'Mark', 'Sison', 'mark.sison444@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '48-4690311-3', '95-\r\n739993809-6', '1790-2364-1503'),
(452, 3, 'Fe', 'Quiroz', 'fe.quiroz445@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '60-3476034-0', NULL, '1089-\r\n1930-8430'),
(453, 6, 'Dennis', 'Abella', 'dennis.abella446@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '68-\r\n780972012-0', '1240-9713-0748'),
(454, 3, 'Jerome', 'Chavez', 'jerome.chavez447@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '86-4286214-\r\n3', '43-909303285-1', NULL),
(455, 3, 'Arnel', 'Ocampo', 'arnel.ocampo448@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '20-6958656-\r\n4', '56-482322148-5', '0327-1450-8686'),
(456, 3, 'Kristine', 'Andrada', 'kristine.andrada449@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '09-9548208-\r\n2', NULL, '2443-0220-8900'),
(457, 3, 'Benjie', 'Padilla', 'benjie.padilla450@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '38-1762238-3', '51-\r\n137838433-4', '7476-7528-3923'),
(458, 3, 'Paolo', 'Quiroz', 'paolo.quiroz451@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '88-1312506-4', '84-\r\n665362506-9', '7368-5105-7125'),
(459, 3, 'Imelda', 'Macalinao', 'imelda.macalinao452@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '84-\r\n0525795-2', '24-159244044-0', '9730-4250-8395'),
(460, 3, 'Ricardo', 'Rosales', 'ricardo.rosales453@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '99-9553539-\r\n7', '81-050886627-0', '4123-9085-4284'),
(461, 3, 'Angelica', 'Dizon', 'angelica.dizon454@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '50-5270859-\r\n7', '39-942730453-1', '1007-9291-6057'),
(462, 3, 'Fe', 'Cabanlit', 'fe.cabanlit455@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '37-0834841-1', '56-\r\n913393854-5', '0238-5122-3578'),
(463, 3, 'Marilou', 'Valdez', 'marilou.valdez456@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '95-5482308-\r\n7', '86-322634279-3', '5264-0020-8205'),
(464, 3, 'Ramon', 'Soriano', 'ramon.soriano457@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '30-2778630-\r\n4', '73-744954042-8', '6651-4118-4353'),
(465, 3, 'Mylene', 'Chavez', 'mylene.chavez458@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '20-\r\n878967560-1', '3151-0132-5391'),
(466, 3, 'Sheila', 'Ramos', 'sheila.ramos459@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '22-2505247-7', '50-\r\n868041958-1', '1534-1040-8958'),
(467, 3, 'Lorna', 'Rosales', 'lorna.rosales460@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '85-3093307-5', '31-\r\n738856654-3', NULL),
(468, 3, 'Christine', 'Ong', 'christine.ong461@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '03-4606278-0', '43-\r\n548342139-9', '1298-9468-1046'),
(469, 3, 'Eduardo', 'Aguilar', 'eduardo.aguilar462@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '47-1753582-\r\n5', '96-659958711-3', '2065-1589-9200'),
(470, 2, 'Maria', 'Quiroz', 'maria.quiroz463@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '68-0350819-2', '35-\r\n058160968-2', '2922-9952-0105'),
(471, 3, 'Nestor', 'Aquino', 'nestor.aquino464@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '51-5307616-\r\n1', '23-805928216-9', NULL),
(472, 3, 'Benjie', 'Santos', 'benjie.santos465@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '98-\r\n205680482-9', '3747-4358-8762'),
(473, 3, 'Mylene', 'Hernandez', 'mylene.hernandez466@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '68-\r\n3918307-4', '21-825971469-4', '9460-4228-8941'),
(474, 3, 'Joel', 'Macalinao', 'joel.macalinao467@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '32-9414984-\r\n3', '13-856498873-9', '2939-0885-6853'),
(475, 3, 'Maria', 'Dela Cruz', 'maria.delacruz468@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '52-0761111-\r\n8', '68-207485666-0', NULL),
(476, 6, 'Fe', 'Macalinao', 'fe.macalinao469@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '88-6718924-4', '00-\r\n334744021-2', '9189-1698-1110'),
(477, 3, 'Allan', 'Aguilar', 'allan.aguilar470@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '32-6146644-4', '10-\r\n759989494-8', '7442-7289-8639'),
(478, 1, 'Angelica', 'Rosales', 'angelica.rosales471@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '32-\r\n966070022-3', '2341-3454-6056'),
(479, 3, 'Jose', 'Salazar', 'jose.salazar472@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '61-5175837-6', '61-\r\n459363675-1', '7387-6906-4103'),
(480, 3, 'Grace', 'Valdez', 'grace.valdez473@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '61-7300865-5', '47-\r\n751260000-9', '6908-3722-0641'),
(481, 3, 'Teresita', 'Aguilar', 'teresita.aguilar474@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '38-7831980-\r\n3', '72-242690650-8', '8691-1868-0046'),
(482, 3, 'Jerome', 'Domingo', 'jerome.domingo475@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '70-\r\n2112307-9', '70-952705188-4', '1032-1154-4368'),
(483, 3, 'Noel', 'Villanueva', 'noel.villanueva476@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '28-9497238-\r\n4', '96-120927966-9', '3385-8138-3530'),
(484, 3, 'Zenaida', 'Perez', 'zenaida.perez477@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '85-9018757-\r\n1', '34-238727301-2', '5664-2529-1079'),
(485, 3, 'Grace', 'Gonzales', 'grace.gonzales478@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '86-0102506-\r\n3', '83-377055654-3', '5056-7449-0947'),
(486, 3, 'Mylene', 'Mendoza', 'mylene.mendoza479@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '80-\r\n7881647-2', '74-775712432-8', '9025-4372-0418'),
(487, 3, 'Paolo', 'Lacson', 'paolo.lacson480@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '34-0258533-1', '60-\r\n465128620-4', '4025-6023-2274'),
(488, 3, 'Cesar', 'Aguilar', 'cesar.aguilar481@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '11-8081987-\r\n7', NULL, '5867-4756-5356'),
(489, 3, 'Christine', 'Rosales', 'christine.rosales482@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '91-5193442-\r\n4', '27-382209040-3', '6578-7392-1977'),
(490, 3, 'Vilma', 'Evangelista', 'vilma.evangelista483@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '51-\r\n1647270-7', '42-945838586-7', '5397-8094-7835'),
(491, 3, 'Noel', 'Evangelista', 'noel.evangelista484@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '26-3405407-\r\n0', '43-023089880-5', '0697-8518-7536'),
(492, 3, 'Christine', 'Castillo', 'christine.castillo485@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '80-0784567-\r\n6', '93-215414470-6', '3536-8002-5470'),
(493, 3, 'Rowena', 'Uy', 'rowena.uy486@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '14-2530633-2', '10-\r\n579658500-1', NULL),
(494, 3, 'Noel', 'Garcia', 'noel.garcia487@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '25-9696587-6', '00-\r\n441333397-8', '0496-4100-9165'),
(495, 3, 'Grace', 'Aquino', 'grace.aquino488@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '25-\r\n102036414-6', '4983-7081-1033'),
(496, 3, 'Luz', 'Lacson', 'luz.lacson489@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '52-5963607-6', '00-\r\n729426467-1', '5858-0611-3762'),
(497, 3, 'Zenaida', 'Cabanlit', 'zenaida.cabanlit490@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '76-8863545-\r\n1', '36-513621208-8', '0847-3672-8440'),
(498, 3, 'Gerald', 'Flores', 'gerald.flores491@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '09-6388894-1', '08-\r\n897032993-2', '7683-5420-9411'),
(499, 3, 'Sheila', 'Garcia', 'sheila.garcia492@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '12-4619447-4', '12-\r\n543589086-4', '0187-5919-9399'),
(500, 3, 'Ricardo', 'Pascual', 'ricardo.pascual493@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '25-5450105-\r\n1', '01-559997655-9', NULL),
(501, 3, 'Angelica', 'Soriano', 'angelica.soriano494@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '77-\r\n375311410-9', '6554-6456-4856'),
(502, 3, 'Imelda', 'Aquino', 'imelda.aquino495@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '66-8426378-\r\n9', '56-264884047-9', '4096-5210-4649'),
(503, 3, 'Ricardo', 'Navarro', 'ricardo.navarro496@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '46-\r\n602338809-5', '6894-8086-6315'),
(504, 3, 'Joshua', 'Rosales', 'joshua.rosales497@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '85-4512724-\r\n5', '06-568038878-7', '3187-3214-5494'),
(505, 3, 'Carmen', 'Bautista', 'carmen.bautista498@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '10-4472856-\r\n0', '35-210949956-3', '5371-6672-6030'),
(506, 3, 'Fe', 'Ramos', 'fe.ramos499@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', NULL, '88-538530889-\r\n1', NULL),
(507, 3, 'Rey', 'Andrada', 'rey.andrada500@ces.example.ph', '9a4aabf0e5cf71cae2cea646613ce7e2a5919fa758e56819704be25a3a2c1f0b', '73-2271987-6', '84-\r\n822729137-8', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD UNIQUE KEY `learner_id` (`learner_id`,`attendance_date`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `budget_lines`
--
ALTER TABLE `budget_lines`
  ADD PRIMARY KEY (`budget_line_id`);

--
-- Indexes for table `damage_reports`
--
ALTER TABLE `damage_reports`
  ADD PRIMARY KEY (`damage_id`),
  ADD KEY `out_id` (`out_id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`donation_id`),
  ADD KEY `budget_line_id` (`budget_line_id`);

--
-- Indexes for table `donation_items`
--
ALTER TABLE `donation_items`
  ADD PRIMARY KEY (`donation_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expense_id`),
  ADD KEY `budget_line_id` (`budget_line_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`),
  ADD UNIQUE KEY `learner_id` (`learner_id`,`subject_id`,`grading_period`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `guardians`
--
ALTER TABLE `guardians`
  ADD PRIMARY KEY (`guardian_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `learners`
--
ALTER TABLE `learners`
  ADD PRIMARY KEY (`learner_id`),
  ADD UNIQUE KEY `lrn` (`lrn`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `learner_guardians`
--
ALTER TABLE `learner_guardians`
  ADD PRIMARY KEY (`learner_id`,`guardian_id`),
  ADD KEY `guardian_id` (`guardian_id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `guardian_id` (`guardian_id`),
  ADD KEY `attendance_id` (`attendance_id`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`payroll_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`period_start`,`period_end`);

--
-- Indexes for table `payroll_deductions`
--
ALTER TABLE `payroll_deductions`
  ADD PRIMARY KEY (`deduction_id`),
  ADD KEY `payroll_id` (`payroll_id`);

--
-- Indexes for table `payroll_earnings`
--
ALTER TABLE `payroll_earnings`
  ADD PRIMARY KEY (`earning_id`),
  ADD KEY `payroll_id` (`payroll_id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`po_id`),
  ADD KEY `supply_officer_id` (`supply_officer_id`),
  ADD KEY `expense_id` (`expense_id`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`po_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_id`),
  ADD UNIQUE KEY `grade_level` (`grade_level`,`section_name`,`school_year`),
  ADD KEY `adviser_user_id` (`adviser_user_id`);

--
-- Indexes for table `stock_in`
--
ALTER TABLE `stock_in`
  ADD PRIMARY KEY (`in_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `po_id` (`po_id`),
  ADD KEY `donation_id` (`donation_id`);

--
-- Indexes for table `stock_out`
--
ALTER TABLE `stock_out`
  ADD PRIMARY KEY (`out_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `issued_to` (`issued_to`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD UNIQUE KEY `subject_name` (`subject_name`);

--
-- Indexes for table `trainings`
--
ALTER TABLE `trainings`
  ADD PRIMARY KEY (`training_id`);

--
-- Indexes for table `training_attendees`
--
ALTER TABLE `training_attendees`
  ADD PRIMARY KEY (`training_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `budget_lines`
--
ALTER TABLE `budget_lines`
  MODIFY `budget_line_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `damage_reports`
--
ALTER TABLE `damage_reports`
  MODIFY `damage_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `donation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guardians`
--
ALTER TABLE `guardians`
  MODIFY `guardian_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `learners`
--
ALTER TABLE `learners`
  MODIFY `learner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `payroll_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_deductions`
--
ALTER TABLE `payroll_deductions`
  MODIFY `deduction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_earnings`
--
ALTER TABLE `payroll_earnings`
  MODIFY `earning_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `po_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `stock_in`
--
ALTER TABLE `stock_in`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_out`
--
ALTER TABLE `stock_out`
  MODIFY `out_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `trainings`
--
ALTER TABLE `trainings`
  MODIFY `training_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=508;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`learner_id`) REFERENCES `learners` (`learner_id`);

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `damage_reports`
--
ALTER TABLE `damage_reports`
  ADD CONSTRAINT `damage_reports_ibfk_1` FOREIGN KEY (`out_id`) REFERENCES `stock_out` (`out_id`);

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`budget_line_id`) REFERENCES `budget_lines` (`budget_line_id`);

--
-- Constraints for table `donation_items`
--
ALTER TABLE `donation_items`
  ADD CONSTRAINT `donation_items_ibfk_1` FOREIGN KEY (`donation_id`) REFERENCES `donations` (`donation_id`),
  ADD CONSTRAINT `donation_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`budget_line_id`) REFERENCES `budget_lines` (`budget_line_id`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`learner_id`) REFERENCES `learners` (`learner_id`),
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

--
-- Constraints for table `learners`
--
ALTER TABLE `learners`
  ADD CONSTRAINT `learners_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`);

--
-- Constraints for table `learner_guardians`
--
ALTER TABLE `learner_guardians`
  ADD CONSTRAINT `learner_guardians_ibfk_1` FOREIGN KEY (`learner_id`) REFERENCES `learners` (`learner_id`),
  ADD CONSTRAINT `learner_guardians_ibfk_2` FOREIGN KEY (`guardian_id`) REFERENCES `guardians` (`guardian_id`);

--
-- Constraints for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD CONSTRAINT `notification_logs_ibfk_1` FOREIGN KEY (`guardian_id`) REFERENCES `guardians` (`guardian_id`),
  ADD CONSTRAINT `notification_logs_ibfk_2` FOREIGN KEY (`attendance_id`) REFERENCES `attendance` (`attendance_id`);

--
-- Constraints for table `payroll`
--
ALTER TABLE `payroll`
  ADD CONSTRAINT `payroll_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `payroll_deductions`
--
ALTER TABLE `payroll_deductions`
  ADD CONSTRAINT `payroll_deductions_ibfk_1` FOREIGN KEY (`payroll_id`) REFERENCES `payroll` (`payroll_id`);

--
-- Constraints for table `payroll_earnings`
--
ALTER TABLE `payroll_earnings`
  ADD CONSTRAINT `payroll_earnings_ibfk_1` FOREIGN KEY (`payroll_id`) REFERENCES `payroll` (`payroll_id`);

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `purchase_orders_ibfk_1` FOREIGN KEY (`supply_officer_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `purchase_orders_ibfk_2` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`expense_id`);

--
-- Constraints for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD CONSTRAINT `purchase_order_items_ibfk_1` FOREIGN KEY (`po_id`) REFERENCES `purchase_orders` (`po_id`),
  ADD CONSTRAINT `purchase_order_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`);

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`adviser_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `stock_in`
--
ALTER TABLE `stock_in`
  ADD CONSTRAINT `stock_in_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  ADD CONSTRAINT `stock_in_ibfk_2` FOREIGN KEY (`po_id`) REFERENCES `purchase_orders` (`po_id`),
  ADD CONSTRAINT `stock_in_ibfk_3` FOREIGN KEY (`donation_id`) REFERENCES `donations` (`donation_id`);

--
-- Constraints for table `stock_out`
--
ALTER TABLE `stock_out`
  ADD CONSTRAINT `stock_out_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  ADD CONSTRAINT `stock_out_ibfk_2` FOREIGN KEY (`issued_to`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `training_attendees`
--
ALTER TABLE `training_attendees`
  ADD CONSTRAINT `training_attendees_ibfk_1` FOREIGN KEY (`training_id`) REFERENCES `trainings` (`training_id`),
  ADD CONSTRAINT `training_attendees_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
