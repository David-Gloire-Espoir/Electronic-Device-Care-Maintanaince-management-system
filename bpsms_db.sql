-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2024 at 02:56 AM
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
-- Database: `bpsms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand_list`
--

CREATE TABLE `brand_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `image_path` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand_list`
--

INSERT INTO `brand_list` (`id`, `name`, `image_path`, `delete_flag`, `status`, `date_created`, `date_updated`) VALUES
(8, 'Canon', 'uploads/brands/8.jpeg?v=1712018221', 0, 1, '2024-04-02 02:37:01', '2024-04-02 02:37:01'),
(9, 'Dell', 'uploads/brands/9.jpeg?v=1712018235', 0, 1, '2024-04-02 02:37:15', '2024-04-02 02:37:15'),
(10, 'Sony', 'uploads/brands/10.jpeg?v=1712018252', 0, 1, '2024-04-02 02:37:32', '2024-04-02 02:37:32'),
(11, 'Hp', 'uploads/brands/11.jpeg?v=1712018268', 0, 1, '2024-04-02 02:37:48', '2024-04-02 02:37:48'),
(12, 'Acer', 'uploads/brands/12.jpeg?v=1712018281', 0, 1, '2024-04-02 02:38:01', '2024-04-02 02:38:01');

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `status`, `delete_flag`, `date_created`) VALUES
(10, 'Computer', 1, 0, '2024-04-02 02:38:33'),
(11, 'Printer', 1, 0, '2024-04-02 02:38:52'),
(12, 'Camera', 1, 0, '2024-04-02 02:39:01'),
(13, 'Security Camera', 1, 0, '2024-04-02 02:39:13'),
(14, 'Others', 1, 0, '2024-04-02 02:39:32'),
(15, 'Accessories', 1, 0, '2024-04-02 02:40:48'),
(16, 'Mobile phone', 1, 0, '2024-04-02 02:40:58'),
(17, 'Lighting', 1, 0, '2024-04-02 02:41:08');

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_added` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mechanics_list`
--

CREATE TABLE `mechanics_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mechanics_list`
--

INSERT INTO `mechanics_list` (`id`, `name`, `contact`, `email`, `status`, `date_created`) VALUES
(3, 'Uwiduhaye Pacifique', '0788882134', 'uwiduhaye@gmail.com', 1, '2024-04-02 02:55:28');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `ref_code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `total_amount` float NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending,1 = packed, 2 = for delivery, 3 = on the way, 4 = delivered, 5=cancelled',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `models` text NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `image_path` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `brand_id`, `category_id`, `name`, `models`, `description`, `price`, `status`, `image_path`, `delete_flag`, `date_created`, `date_updated`) VALUES
(6, 10, 11, 'Sony UP-DR150 Digital Photo Printer', '2023', '&lt;p data-sider-select-id=&quot;57a1291c-227b-4745-8809-b085f8a76e8e&quot;&gt;Sony UP-DR150 Digital Photo Printer:&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Specifications:&lt;/p&gt;&lt;p&gt;- Print Technology: Dye Sublimation thermal printing&lt;/p&gt;&lt;p&gt;- Print Resolution: 300 dpi&lt;/p&gt;&lt;p&gt;- Print Speed: Approximately 6x8&quot; print in approximately 40 seconds&lt;/p&gt;&lt;p&gt;- Paper Sizes: 3.5 x 5&quot;, 4 x 6&quot;, 5 x 7&quot;, and 6 x 8&quot;&lt;/p&gt;&lt;p&gt;- Connectivity: USB 2.0&lt;/p&gt;&lt;p&gt;- Print Capacity: Up to 10 prints per pass&lt;/p&gt;&lt;p&gt;- Compatibility: Windows and Mac OS&lt;/p&gt;&lt;p&gt;- Dimensions: 12.8 x 14.2 x 6.5&quot; (W x D x H)&lt;/p&gt;&lt;p&gt;- Weight: 24.3 lbs&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Key Features:&lt;/p&gt;&lt;p&gt;- High-quality, professional-grade photo printing with vibrant colors and sharp images&lt;/p&gt;&lt;p&gt;- Fast printing speed for quick turnaround times&lt;/p&gt;&lt;p&gt;- Multiple paper size options for versatile printing capabilities&lt;/p&gt;&lt;p&gt;- Easy connectivity with USB 2.0 interface for seamless operation&lt;/p&gt;&lt;p&gt;- Compact and space-saving design for convenient placement in various settings&lt;/p&gt;&lt;p&gt;- Supports Windows and Mac operating systems for broad compatibility&lt;/p&gt;&lt;p&gt;- Suitable for event photography, photo studios, photo booths, and other professional printing applications.&lt;/p&gt;', 620000, 1, 'uploads/products/6.jpeg?v=1712019050', 0, '2024-04-02 02:50:50', '2024-04-02 02:50:50'),
(7, 11, 10, 'HP Pavilion Desktop TP01-1026', '2022', '&lt;p data-sider-select-id=&quot;472f4dd1-5359-4b12-b9ce-39515a7506d0&quot;&gt;HP Pavilion Desktop TP01-1026:&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Specifications:&lt;/p&gt;&lt;p&gt;- Processor: 10th Gen Intel Core i5-10400 6-Core Processor (2.9 GHz base frequency, up to 4.3 GHz with Intel Turbo Boost Technology)&lt;/p&gt;&lt;p&gt;- Memory: 8GB DDR4-2666 SDRAM (upgradeable to 32GB)&lt;/p&gt;&lt;p&gt;- Storage: 256GB PCIe NVMe M.2 Solid State Drive + 1TB 7200RPM SATA hard drive&lt;/p&gt;&lt;p&gt;- Graphics: Intel UHD Graphics 630&lt;/p&gt;&lt;p&gt;- Operating System: Windows 10 Home&lt;/p&gt;&lt;p&gt;- Optical Drive: DVD-Writer&lt;/p&gt;&lt;p&gt;- Connectivity: Realtek Wi-Fi 5 (1x1) and Bluetooth 4.2 combo, 10/100/1000 Base-T Network&lt;/p&gt;&lt;p&gt;- Front I/O Ports: 1 x headphone/microphone combo, 1 x USB 3.1 Gen 1 Type-C, 1 x USB 3.1 Gen 1 Type-A&lt;/p&gt;&lt;p&gt;- Rear I/O Ports: 4 x USB 2.0 Type-A, 2 x USB 3.1 Gen 1 Type-A, 1 x HDMI, 1 x VGA, 1 x 3-in-1 memory card reader&lt;/p&gt;&lt;p&gt;- Expansion Slots: 1 PCIe x16, 1 PCIe x1, 2 M.2&lt;/p&gt;&lt;p&gt;- Power Supply: 180W Gold efficiency power supply&lt;/p&gt;&lt;p&gt;- Dimensions: 13.28 x 6.12 x 11.93 inches&lt;/p&gt;&lt;p&gt;- Weight: 13.14 pounds&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Key Features:&lt;/p&gt;&lt;p&gt;- Powerful 10th Gen Intel Core i5 processor for smooth multitasking and performance&lt;/p&gt;&lt;p&gt;- Ample memory and storage options for faster boot-up times and application responsiveness&lt;/p&gt;&lt;p&gt;- Dual storage configuration with SSD for fast boot-up and HDD for ample storage space&lt;/p&gt;&lt;p&gt;- Integrated Intel UHD Graphics for everyday multimedia tasks&lt;/p&gt;&lt;p&gt;- Windows 10 Home operating system for a familiar and user-friendly interface&lt;/p&gt;&lt;p&gt;- Built-in DVD-Writer for disc-based media and backup&lt;/p&gt;&lt;p&gt;- Wireless and Bluetooth connectivity options for cable-free networking and peripherals&lt;/p&gt;&lt;p&gt;- Multiple USB ports and card reader for easy connectivity and data transfer&lt;/p&gt;&lt;p&gt;- Expansion slots for future upgrade options&lt;/p&gt;&lt;p&gt;- Compact and sleek design suitable for home or office environments.&lt;/p&gt;', 750000, 1, 'uploads/products/7.jpeg?v=1712019154', 0, '2024-04-02 02:52:34', '2024-04-02 02:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `request_meta`
--

CREATE TABLE `request_meta` (
  `request_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_list`
--

CREATE TABLE `service_list` (
  `id` int(30) NOT NULL,
  `service` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_list`
--

INSERT INTO `service_list` (`id`, `service`, `description`, `status`, `delete_flag`, `date_created`) VALUES
(5, 'Repair', '&lt;ol style=&quot;font-family: &quot;Helvetica Neue&quot;, &quot;TeX Gyre Heros&quot;, &quot;Nimbus Sans L&quot;, &quot;Liberation Sans&quot;, Roboto, sans-serif; margin: 7px 0px 0px; padding-top: 10px; padding-bottom: 10px; padding-left: 20px; color: rgb(255, 255, 255); font-size: 18px; background-color: rgba(0, 0, 0, 0.1);&quot;&gt;&lt;li style=&quot;margin: 7px 0px 0px; text-align: left; padding-top: 5px; padding-bottom: 5px;&quot;&gt;&lt;p data-sider-select-id=&quot;97067cb1-e937-4d02-9ae3-091e4dedb146&quot; style=&quot;margin: 7px 0px 0px; padding-top: 5px; padding-bottom: 5px; white-space-collapse: preserve;&quot;&gt;&lt;b data-sider-select-id=&quot;5fd3ecf5-eaff-42b4-a015-9ecd3fc3f767&quot;&gt;Repair:&lt;/b&gt;&lt;span style=&quot;font-weight: initial;&quot;&gt; Electronic device care management involves providing repair services for devices that have experienced malfunctions, damage, or hardware failures. Repair services may include diagnosing the issue, replacing faulty components, and testing the device to ensure it is functioning properly.&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ol&gt;', 1, 0, '2024-04-02 02:44:41'),
(6, 'Troubleshooting', '&lt;ol style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, &amp;quot;TeX Gyre Heros&amp;quot;, &amp;quot;Nimbus Sans L&amp;quot;, &amp;quot;Liberation Sans&amp;quot;, Roboto, sans-serif; margin: 7px 0px 0px; padding-top: 10px; padding-bottom: 10px; padding-left: 20px; color: rgb(255, 255, 255); font-size: 18px; background-color: rgba(0, 0, 0, 0.1);&quot;&gt;&lt;li style=&quot;margin: 7px 0px 0px; text-align: left; padding-top: 5px; padding-bottom: 5px;&quot;&gt;&lt;p data-sider-select-id=&quot;5ecf3094-bd8b-45f7-88d8-ac5f21783137&quot; style=&quot;margin: 7px 0px 0px; padding-top: 5px; padding-bottom: 5px; white-space-collapse: preserve;&quot;&gt;&lt;b data-sider-select-id=&quot;2ef8d015-04df-47ff-ace7-7cd4c03e0692&quot;&gt;Troubleshooting&lt;/b&gt;&lt;span style=&quot;font-weight: initial;&quot;&gt;: Troubleshooting is a key service in electronic device care management where technicians identify and address software-related issues impacting device performance. This includes debugging software, resolving system errors, and addressing connectivity problems to restore the device to optimal working condition.&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ol&gt;', 1, 0, '2024-04-02 02:45:14'),
(7, 'Maintenance', '&lt;ol style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, &amp;quot;TeX Gyre Heros&amp;quot;, &amp;quot;Nimbus Sans L&amp;quot;, &amp;quot;Liberation Sans&amp;quot;, Roboto, sans-serif; margin: 7px 0px 0px; padding-top: 10px; padding-bottom: 10px; padding-left: 20px; color: rgb(255, 255, 255); font-size: 18px; background-color: rgba(0, 0, 0, 0.1);&quot;&gt;&lt;li style=&quot;margin: 7px 0px 0px; text-align: left; padding-top: 5px; padding-bottom: 5px;&quot;&gt;&lt;p data-sider-select-id=&quot;27dd0b99-8b85-4c20-b72e-1bd5708c3134&quot; style=&quot;margin: 7px 0px 0px; padding-top: 5px; padding-bottom: 5px; white-space-collapse: preserve;&quot;&gt;&lt;b data-sider-select-id=&quot;20a5edbc-d743-4531-b525-da87b3c6fcfa&quot;&gt;Maintenance&lt;/b&gt;&lt;span style=&quot;font-weight: initial;&quot;&gt;: Regular maintenance services ensure that electronic devices remain in good working order by performing routine tasks such as cleaning the device, updating software, and optimizing performance settings. Maintenance also includes checking for signs of wear and tear, addressing minor issues before they escalate, and keeping devices up-to-date with the latest security patches.&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ol&gt;', 1, 0, '2024-04-02 02:45:34'),
(8, 'Data Backup and Recovery', '&lt;ol style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, &amp;quot;TeX Gyre Heros&amp;quot;, &amp;quot;Nimbus Sans L&amp;quot;, &amp;quot;Liberation Sans&amp;quot;, Roboto, sans-serif; margin: 7px 0px 0px; padding-top: 10px; padding-bottom: 10px; padding-left: 20px; color: rgb(255, 255, 255); font-size: 18px; background-color: rgba(0, 0, 0, 0.1);&quot;&gt;&lt;li style=&quot;font-weight: initial; margin: 7px 0px 0px; text-align: left; padding-top: 5px; padding-bottom: 5px;&quot;&gt;&lt;p data-sider-select-id=&quot;bd88a65c-da5d-4f84-9275-414707e98960&quot; style=&quot;font-weight: initial; margin: 7px 0px 0px; padding-top: 5px; padding-bottom: 5px; white-space-collapse: preserve;&quot;&gt;Data Backup and Recovery: Electronic device care management encompasses services related to data backup and recovery to protect important files and information stored on devices. This involves setting up automated backup systems, restoring data in case of device failure, and implementing data recovery procedures to recover lost or deleted files.&lt;/p&gt;&lt;/li&gt;&lt;/ol&gt;', 1, 0, '2024-04-02 02:45:52'),
(9, 'Security Management', '&lt;ol style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, &amp;quot;TeX Gyre Heros&amp;quot;, &amp;quot;Nimbus Sans L&amp;quot;, &amp;quot;Liberation Sans&amp;quot;, Roboto, sans-serif; margin: 7px 0px 0px; padding-top: 10px; padding-bottom: 10px; padding-left: 20px; color: rgb(255, 255, 255); font-size: 18px; background-color: rgba(0, 0, 0, 0.1);&quot;&gt;&lt;li style=&quot;margin: 7px 0px 0px; text-align: left; padding-top: 5px; padding-bottom: 5px;&quot;&gt;&lt;p data-sider-select-id=&quot;d49cb2a8-ca1d-460e-89c2-fa253fe05afd&quot; style=&quot;margin: 7px 0px 0px; padding-top: 5px; padding-bottom: 5px; white-space-collapse: preserve;&quot;&gt;&lt;b data-sider-select-id=&quot;b5621b5c-8f06-4370-923e-539f6d9a4abd&quot;&gt;Security Management&lt;/b&gt;&lt;span style=&quot;font-weight: initial;&quot;&gt;: Security management services in electronic device care involve implementing measures to protect devices from cyber threats, such as malware, viruses, and unauthorized access. This includes installing security software, setting up firewalls, and educating users on best practices for maintaining device security.&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ol&gt;', 1, 0, '2024-04-02 02:46:11'),
(10, 'Upgrades and Enhancements', '&lt;ol style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, &amp;quot;TeX Gyre Heros&amp;quot;, &amp;quot;Nimbus Sans L&amp;quot;, &amp;quot;Liberation Sans&amp;quot;, Roboto, sans-serif; margin: 7px 0px 0px; padding-top: 10px; padding-bottom: 10px; padding-left: 20px; color: rgb(255, 255, 255); font-size: 18px; background-color: rgba(0, 0, 0, 0.1);&quot;&gt;&lt;li style=&quot;margin: 7px 0px 0px; text-align: left; padding-top: 5px; padding-bottom: 5px;&quot;&gt;&lt;p data-sider-select-id=&quot;399e373d-85ad-4379-9491-265bf655e518&quot; style=&quot;margin: 7px 0px 0px; padding-top: 5px; padding-bottom: 5px; white-space-collapse: preserve;&quot;&gt;&lt;b data-sider-select-id=&quot;619697f4-38c3-40f2-a916-b4fdc364c957&quot;&gt;Upgrades and Enhancements&lt;/b&gt;&lt;span style=&quot;font-weight: initial;&quot;&gt;: Device care management may also include services for upgrading hardware components or enhancing software features to improve device performance and functionality. This can involve installing new hardware, upgrading operating systems, and optimizing device settings for better user experience.&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ol&gt;', 1, 0, '2024-04-02 02:46:31');

-- --------------------------------------------------------

--
-- Table structure for table `service_requests`
--

CREATE TABLE `service_requests` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `service_type` text NOT NULL,
  `mechanic_id` int(30) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_list`
--

CREATE TABLE `stock_list` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1= IN, 2= Out',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_list`
--

INSERT INTO `stock_list` (`id`, `product_id`, `quantity`, `type`, `date_created`) VALUES
(9, 7, 131, 1, '2024-04-02 02:53:37'),
(10, 6, 13, 1, '2024-04-02 02:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Device Care Parts & Services Management System'),
(6, 'short_name', 'Device Care Management System'),
(11, 'logo', 'uploads/1642728480_logo.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/brands/Which Apple Products Are Really Worth Your Money_ (Updated) _ Gear Patrol.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(6, 'Claire', 'Blake', 'cblake', 'cd74fae0a3adf459f73bbf187607ccea', 'uploads/1632990840_ava.jpg', NULL, 2, '2021-09-30 16:34:02', '2021-09-30 16:35:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand_list`
--
ALTER TABLE `brand_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- Indexes for table `mechanics_list`
--
ALTER TABLE `mechanics_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `request_meta`
--
ALTER TABLE `request_meta`
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `service_list`
--
ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `mechanic_id` (`mechanic_id`);

--
-- Indexes for table `stock_list`
--
ALTER TABLE `stock_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand_list`
--
ALTER TABLE `brand_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mechanics_list`
--
ALTER TABLE `mechanics_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `service_list`
--
ALTER TABLE `service_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `service_requests`
--
ALTER TABLE `service_requests`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stock_list`
--
ALTER TABLE `stock_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `request_meta`
--
ALTER TABLE `request_meta`
  ADD CONSTRAINT `request_meta_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `service_requests` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD CONSTRAINT `service_requests_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_requests_ibfk_2` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanics_list` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `stock_list`
--
ALTER TABLE `stock_list`
  ADD CONSTRAINT `stock_list_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
