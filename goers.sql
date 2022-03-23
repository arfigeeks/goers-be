-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for osx10.16 (x86_64)
--
-- Host: 127.0.0.1    Database: goers
-- ------------------------------------------------------
-- Server version	10.5.9-MariaDB-1:10.5.9+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Sport','sport','ACTIVE','2022-03-21 02:32:43',1,'2022-03-21 02:32:43',1,NULL,NULL),(2,'Education','education','ACTIVE','2022-03-21 02:33:30',1,'2022-03-21 02:33:30',1,NULL,NULL),(3,'Workshop','workshop','ACTIVE','2022-03-21 02:33:30',1,'2022-03-21 02:33:30',1,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (4,'Arfi Yanto Susilo','arfi@gmail.com',NULL,'081231872312',1,'$2y$10$a4Zlwk495WLAJfKmIWeL7uiV9YwGyM7VwNc8/7Ue9WVs/kT.gjqjK','ACTIVE','2022-03-23 11:24:27',9999,'2022-03-23 11:24:27',0,NULL,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_categories`
--

DROP TABLE IF EXISTS `event_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `event_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_categories`
--

LOCK TABLES `event_categories` WRITE;
/*!40000 ALTER TABLE `event_categories` DISABLE KEYS */;
INSERT INTO `event_categories` VALUES (1,1,1,'2022-03-21 03:44:30',NULL,'2022-03-21 03:44:30',NULL,NULL,NULL);
/*!40000 ALTER TABLE `event_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_images`
--

DROP TABLE IF EXISTS `event_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_images`
--

LOCK TABLES `event_images` WRITE;
/*!40000 ALTER TABLE `event_images` DISABLE KEYS */;
INSERT INTO `event_images` VALUES (1,1,'https://d3hzxw6fwm263k.cloudfront.net/uploads/events/photos/1639957104-za0hjVg9qxXrUkJgTGKuZ13rYw8x2l7n.jpeg','2022-03-21 02:39:03',2,'2022-03-21 02:39:03',2,NULL,NULL),(2,1,'https://d3hzxw6fwm263k.cloudfront.net/uploads/events/photos/1640688954-80I1UPEVyfxmepUsPtQ5hGtLN5RDculE.jpg','2022-03-21 02:40:38',2,'2022-03-21 02:40:38',2,NULL,NULL);
/*!40000 ALTER TABLE `event_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_schedules`
--

DROP TABLE IF EXISTS `event_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_schedules` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `max_quantity` int(5) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_schedules`
--

LOCK TABLES `event_schedules` WRITE;
/*!40000 ALTER TABLE `event_schedules` DISABLE KEYS */;
INSERT INTO `event_schedules` VALUES (1,1,'[ONSITE] 200hr Yoga Teacher Training','2022-04-04','07:00:00','19:00:00',13000000,10,'General Information:\n\n- Class available for 4-25 April 2022\n\n- Class start from 7am - 7pm\n\n- Please come 5 min. before your session\n\n- If you arrive after the class starts, please wait at the door until the teacher lets you in.\n\n- Use your ticket at the selected time and date \n\n- Tickets are Non Refundable & Non Re schedule\n\n- Ticket cannot compile with other promotion\n\n- Buyer MUST filled the personal data when ordering the ticket\n\n- Please turn off your phone during class. Photos are allowed post-class.\n\n- We provide yoga mats and other properties except for yoga towel. Please bring your own yoga towel or Sarong to put on the yoga mat and please put the hall properties back in their proper place after use.\n\n- Children under the age of 10 are not permitted to join classes.\n\n- No pets are allowed in the class.\n\n- Serenity Yoga is not responsible for any items stored or left behind and any loss at the studios. Please make sure to keep all belongings with you.\n\n- Do not force your body if you are sick, serenity is not responsible for any risks and injury.\n\nExample of Daily Schedule:\n\n7.00 – 7.30 Mantra & Meditation\n\n7.30 – 9.00 Morning Yoga Class\n\n9.00 – 10.30 Alkaline Vegan/Vegetarian Breakfast\n\n10.30 – 1.00 Yoga Philosophy & Anatomy\n\n1.00 – 3.00 Lunch & Free Time\n\n3.00 – 4.30 Adjustments, Asana Lab & Sequencing\n\n4.30 – 5.30 Strength & Flexibility Training\n\n5.30 – 6.30 Candlelight Yin Yoga\n\n6.30 onward Sunset, Dinner and Free Time\n\nHow to use ticket:\n\n- Present your e-ticket via mobile phone or printed\n\nImportant notes:\n\n- Get instant confirmation by email. If you do not receive an email from us, please check your Spam folder or contact our Customer Services (CS) through whatsApp (+62 811 1058 8333)\n\nWhat to bring (optional):\n\n1. A bottle for drinking water (you can refill your water botle near the yoga reception. We also offer free drinking water in all the yoga studios)\n\n2. A change of clothes (we have changing rooms which can be used)\n\n3. Sports towel\n\n4. Your own yoga mat (Serenity already provides yoga mats, bolsters, and blocks to use)\n\n\nPrice Includes\n- 200hr Yoga Alliance Certification\n\n- Daily Morning Meditation with Monk\n\n- Daily Vinyasa Yoga classes\n\n- Candlelight Evening Yin Yoga classes\n\n- Understanding Ayurveda with Dr. Joshi\n\n- Special Guest Teacher\n\n- Yoga Philosophy with Monk\n\n- Yoga Anatomy & Physiology\n\n- In-depth Workshops: Strength, Flexibility & Heart Opening\n\n- Acro Yoga & Thai Massage Workshops\n\n- Ecstatic Dance classes\n\n- Pranayama breathwork\n\n- Ancient Sanskrit Mantras\n\n- Group Singing & Kirtan\n\n- Intro to Ashtanga Vinyasa\n\n- Yoga Teacher Training Manual & Resources\n\n- Free Balinese Healing Massage\n\n- Free Vegan/Vegetarian Breakfasts\n\n- Traditional Balinese Opening Ceremony\n\n- Unlimited Purified Drinking Water\n\n- Free Eco T - shirt & Bag\n\n- Airport pick up included\n\n- Optional Weekend Activities: Eucalyptus Sauna & steam in nature, Surf Lessons with local teacher, Balinese cultural activities, Yoga movie night & Amo Spa with cold plunge!\n\n- The course topics:\n\n• Yoga asana fundamentals\n\n• History of yoga - What is yoga?\n\n• Understanding Chakras\n\n• Vinyasa & hatha yoga \n\n• Yin & restorative yoga\n\n• Teaching skills & voice development \n\n• Teaching methodology \n\n• In-depth yoga philosophy \n\n• The yoga sutras of patanjali\n\n• Ancient matras from India\n\n• Yoga therapy \n\n• Sanskrit terminology\n\n• Teaching skills, becoming a teacher\n\n• Yoga sequencing \n\n• Anatomy and physiology\n\n• Nutrition & yoga lifestyle\n\n• Meditation techniques\n\n• Pranayama breathing techniques \n\n• Adjustments and healing\n\n• Ayurveda medicine with Dr. Joshi\n\n• Understanding the Bandhas\n\n• Yoga Business in the modern world \n\n\nPrice Excludes\n- accomodation\n\n- additional class/ training','2022-03-21 03:47:06',2,'2022-03-21 03:47:06',2,NULL,NULL),(2,1,'[ONSITE] 200hr Yoga Teacher Training','2022-04-05','07:00:00','19:00:00',13000000,10,'General Information:  - Class available for 4-25 April 2022  - Class start from 7am - 7pm  - Please come 5 min. before your session  - If you arrive after the class starts, please wait at the door until the teacher lets you in.  - Use your ticket at the selected time and date   - Tickets are Non Refundable & Non Re schedule  - Ticket cannot compile with other promotion  - Buyer MUST filled the personal data when ordering the ticket  - Please turn off your phone during class. Photos are allowed post-class.  - We provide yoga mats and other properties except for yoga towel. Please bring your own yoga towel or Sarong to put on the yoga mat and please put the hall properties back in their proper place after use.  - Children under the age of 10 are not permitted to join classes.  - No pets are allowed in the class.  - Serenity Yoga is not responsible for any items stored or left behind and any loss at the studios. Please make sure to keep all belongings with you.  - Do not force your body if you are sick, serenity is not responsible for any risks and injury.  Example of Daily Schedule:  7.00 – 7.30 Mantra & Meditation  7.30 – 9.00 Morning Yoga Class  9.00 – 10.30 Alkaline Vegan/Vegetarian Breakfast  10.30 – 1.00 Yoga Philosophy & Anatomy  1.00 – 3.00 Lunch & Free Time  3.00 – 4.30 Adjustments, Asana Lab & Sequencing  4.30 – 5.30 Strength & Flexibility Training  5.30 – 6.30 Candlelight Yin Yoga  6.30 onward Sunset, Dinner and Free Time  How to use ticket:  - Present your e-ticket via mobile phone or printed  Important notes:  - Get instant confirmation by email. If you do not receive an email from us, please check your Spam folder or contact our Customer Services (CS) through whatsApp (+62 811 1058 8333)  What to bring (optional):  1. A bottle for drinking water (you can refill your water botle near the yoga reception. We also offer free drinking water in all the yoga studios)  2. A change of clothes (we have changing rooms which can be used)  3. Sports towel  4. Your own yoga mat (Serenity already provides yoga mats, bolsters, and blocks to use)   Price Includes - 200hr Yoga Alliance Certification  - Daily Morning Meditation with Monk  - Daily Vinyasa Yoga classes  - Candlelight Evening Yin Yoga classes  - Understanding Ayurveda with Dr. Joshi  - Special Guest Teacher  - Yoga Philosophy with Monk  - Yoga Anatomy & Physiology  - In-depth Workshops: Strength, Flexibility & Heart Opening  - Acro Yoga & Thai Massage Workshops  - Ecstatic Dance classes  - Pranayama breathwork  - Ancient Sanskrit Mantras  - Group Singing & Kirtan  - Intro to Ashtanga Vinyasa  - Yoga Teacher Training Manual & Resources  - Free Balinese Healing Massage  - Free Vegan/Vegetarian Breakfasts  - Traditional Balinese Opening Ceremony  - Unlimited Purified Drinking Water  - Free Eco T - shirt & Bag  - Airport pick up included  - Optional Weekend Activities: Eucalyptus Sauna & steam in nature, Surf Lessons with local teacher, Balinese cultural activities, Yoga movie night & Amo Spa with cold plunge!  - The course topics:  • Yoga asana fundamentals  • History of yoga - What is yoga?  • Understanding Chakras  • Vinyasa & hatha yoga   • Yin & restorative yoga  • Teaching skills & voice development   • Teaching methodology   • In-depth yoga philosophy   • The yoga sutras of patanjali  • Ancient matras from India  • Yoga therapy   • Sanskrit terminology  • Teaching skills, becoming a teacher  • Yoga sequencing   • Anatomy and physiology  • Nutrition & yoga lifestyle  • Meditation techniques  • Pranayama breathing techniques   • Adjustments and healing  • Ayurveda medicine with Dr. Joshi  • Understanding the Bandhas  • Yoga Business in the modern world    Price Excludes - accomodation  - additional class/ training','2022-03-21 03:47:34',2,'2022-03-21 03:47:34',2,NULL,NULL),(3,1,'[ONSITE] 200hr Yoga Teacher Training','2022-04-06','07:00:00','19:00:00',13000000,10,'General Information:  - Class available for 4-25 April 2022  - Class start from 7am - 7pm  - Please come 5 min. before your session  - If you arrive after the class starts, please wait at the door until the teacher lets you in.  - Use your ticket at the selected time and date   - Tickets are Non Refundable & Non Re schedule  - Ticket cannot compile with other promotion  - Buyer MUST filled the personal data when ordering the ticket  - Please turn off your phone during class. Photos are allowed post-class.  - We provide yoga mats and other properties except for yoga towel. Please bring your own yoga towel or Sarong to put on the yoga mat and please put the hall properties back in their proper place after use.  - Children under the age of 10 are not permitted to join classes.  - No pets are allowed in the class.  - Serenity Yoga is not responsible for any items stored or left behind and any loss at the studios. Please make sure to keep all belongings with you.  - Do not force your body if you are sick, serenity is not responsible for any risks and injury.  Example of Daily Schedule:  7.00 – 7.30 Mantra & Meditation  7.30 – 9.00 Morning Yoga Class  9.00 – 10.30 Alkaline Vegan/Vegetarian Breakfast  10.30 – 1.00 Yoga Philosophy & Anatomy  1.00 – 3.00 Lunch & Free Time  3.00 – 4.30 Adjustments, Asana Lab & Sequencing  4.30 – 5.30 Strength & Flexibility Training  5.30 – 6.30 Candlelight Yin Yoga  6.30 onward Sunset, Dinner and Free Time  How to use ticket:  - Present your e-ticket via mobile phone or printed  Important notes:  - Get instant confirmation by email. If you do not receive an email from us, please check your Spam folder or contact our Customer Services (CS) through whatsApp (+62 811 1058 8333)  What to bring (optional):  1. A bottle for drinking water (you can refill your water botle near the yoga reception. We also offer free drinking water in all the yoga studios)  2. A change of clothes (we have changing rooms which can be used)  3. Sports towel  4. Your own yoga mat (Serenity already provides yoga mats, bolsters, and blocks to use)   Price Includes - 200hr Yoga Alliance Certification  - Daily Morning Meditation with Monk  - Daily Vinyasa Yoga classes  - Candlelight Evening Yin Yoga classes  - Understanding Ayurveda with Dr. Joshi  - Special Guest Teacher  - Yoga Philosophy with Monk  - Yoga Anatomy & Physiology  - In-depth Workshops: Strength, Flexibility & Heart Opening  - Acro Yoga & Thai Massage Workshops  - Ecstatic Dance classes  - Pranayama breathwork  - Ancient Sanskrit Mantras  - Group Singing & Kirtan  - Intro to Ashtanga Vinyasa  - Yoga Teacher Training Manual & Resources  - Free Balinese Healing Massage  - Free Vegan/Vegetarian Breakfasts  - Traditional Balinese Opening Ceremony  - Unlimited Purified Drinking Water  - Free Eco T - shirt & Bag  - Airport pick up included  - Optional Weekend Activities: Eucalyptus Sauna & steam in nature, Surf Lessons with local teacher, Balinese cultural activities, Yoga movie night & Amo Spa with cold plunge!  - The course topics:  • Yoga asana fundamentals  • History of yoga - What is yoga?  • Understanding Chakras  • Vinyasa & hatha yoga   • Yin & restorative yoga  • Teaching skills & voice development   • Teaching methodology   • In-depth yoga philosophy   • The yoga sutras of patanjali  • Ancient matras from India  • Yoga therapy   • Sanskrit terminology  • Teaching skills, becoming a teacher  • Yoga sequencing   • Anatomy and physiology  • Nutrition & yoga lifestyle  • Meditation techniques  • Pranayama breathing techniques   • Adjustments and healing  • Ayurveda medicine with Dr. Joshi  • Understanding the Bandhas  • Yoga Business in the modern world    Price Excludes - accomodation  - additional class/ training','2022-03-21 03:47:34',2,'2022-03-21 03:47:34',2,NULL,NULL),(4,1,'[ONSITE] 200hr Yoga Teacher Training','2022-04-07','07:00:00','19:00:00',13000000,10,'General Information:  - Class available for 4-25 April 2022  - Class start from 7am - 7pm  - Please come 5 min. before your session  - If you arrive after the class starts, please wait at the door until the teacher lets you in.  - Use your ticket at the selected time and date   - Tickets are Non Refundable & Non Re schedule  - Ticket cannot compile with other promotion  - Buyer MUST filled the personal data when ordering the ticket  - Please turn off your phone during class. Photos are allowed post-class.  - We provide yoga mats and other properties except for yoga towel. Please bring your own yoga towel or Sarong to put on the yoga mat and please put the hall properties back in their proper place after use.  - Children under the age of 10 are not permitted to join classes.  - No pets are allowed in the class.  - Serenity Yoga is not responsible for any items stored or left behind and any loss at the studios. Please make sure to keep all belongings with you.  - Do not force your body if you are sick, serenity is not responsible for any risks and injury.  Example of Daily Schedule:  7.00 – 7.30 Mantra & Meditation  7.30 – 9.00 Morning Yoga Class  9.00 – 10.30 Alkaline Vegan/Vegetarian Breakfast  10.30 – 1.00 Yoga Philosophy & Anatomy  1.00 – 3.00 Lunch & Free Time  3.00 – 4.30 Adjustments, Asana Lab & Sequencing  4.30 – 5.30 Strength & Flexibility Training  5.30 – 6.30 Candlelight Yin Yoga  6.30 onward Sunset, Dinner and Free Time  How to use ticket:  - Present your e-ticket via mobile phone or printed  Important notes:  - Get instant confirmation by email. If you do not receive an email from us, please check your Spam folder or contact our Customer Services (CS) through whatsApp (+62 811 1058 8333)  What to bring (optional):  1. A bottle for drinking water (you can refill your water botle near the yoga reception. We also offer free drinking water in all the yoga studios)  2. A change of clothes (we have changing rooms which can be used)  3. Sports towel  4. Your own yoga mat (Serenity already provides yoga mats, bolsters, and blocks to use)   Price Includes - 200hr Yoga Alliance Certification  - Daily Morning Meditation with Monk  - Daily Vinyasa Yoga classes  - Candlelight Evening Yin Yoga classes  - Understanding Ayurveda with Dr. Joshi  - Special Guest Teacher  - Yoga Philosophy with Monk  - Yoga Anatomy & Physiology  - In-depth Workshops: Strength, Flexibility & Heart Opening  - Acro Yoga & Thai Massage Workshops  - Ecstatic Dance classes  - Pranayama breathwork  - Ancient Sanskrit Mantras  - Group Singing & Kirtan  - Intro to Ashtanga Vinyasa  - Yoga Teacher Training Manual & Resources  - Free Balinese Healing Massage  - Free Vegan/Vegetarian Breakfasts  - Traditional Balinese Opening Ceremony  - Unlimited Purified Drinking Water  - Free Eco T - shirt & Bag  - Airport pick up included  - Optional Weekend Activities: Eucalyptus Sauna & steam in nature, Surf Lessons with local teacher, Balinese cultural activities, Yoga movie night & Amo Spa with cold plunge!  - The course topics:  • Yoga asana fundamentals  • History of yoga - What is yoga?  • Understanding Chakras  • Vinyasa & hatha yoga   • Yin & restorative yoga  • Teaching skills & voice development   • Teaching methodology   • In-depth yoga philosophy   • The yoga sutras of patanjali  • Ancient matras from India  • Yoga therapy   • Sanskrit terminology  • Teaching skills, becoming a teacher  • Yoga sequencing   • Anatomy and physiology  • Nutrition & yoga lifestyle  • Meditation techniques  • Pranayama breathing techniques   • Adjustments and healing  • Ayurveda medicine with Dr. Joshi  • Understanding the Bandhas  • Yoga Business in the modern world    Price Excludes - accomodation  - additional class/ training','2022-03-21 03:47:34',2,'2022-03-21 03:47:34',2,NULL,NULL);
/*!40000 ALTER TABLE `event_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `status` varchar(15) DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'200hr Yoga Teacher Training','200hr-yoga-teacher-training','https://d3hzxw6fwm263k.cloudfront.net/uploads/events/photos/1640688954-80I1UPEVyfxmepUsPtQ5hGtLN5RDculE.jpg','Welcome to the yoga studio at Serenity Eco Guesthouse - Canggu, Bali. We provide all level (beginner-intermediate) yoga classes every day. Built in 2010, our space offers beautiful scenery away from the busy streets surrounded by trees, nature, and permaculture gardens. When you join our classes, you become part of a loving, health-conscious, and friendly community. People of all ages, skill levels, and backgrounds are welcome with open arms.','Jl. Nelayan, Canggu, Kec. Kuta Utara, Kabupaten Badung, Bali 80361',NULL,NULL,'ACTIVE','2022-03-21 03:45:26',2,'2022-03-21 03:45:26',2,NULL,NULL);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `event_id` bigint(20) NOT NULL,
  `event_schedule_id` bigint(20) NOT NULL,
  `price` bigint(20) NOT NULL,
  `quantity` int(5) NOT NULL,
  `total_tax` decimal(15,2) DEFAULT NULL,
  `total_discount` decimal(15,2) DEFAULT NULL,
  `amount_before_discount` decimal(15,2) DEFAULT NULL,
  `amount_after_discount` decimal(15,2) DEFAULT NULL,
  `grand_total` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,3,1,2,10000000,1,0.00,0.00,10000000.00,NULL,10000000.00,'2022-03-23 15:01:18',4,'2022-03-23 15:05:43',4,'2022-03-23 15:05:43',NULL),(2,4,1,2,10000000,1,0.00,0.00,10000000.00,10000000.00,10000000.00,'2022-03-23 15:07:30',4,'2022-03-23 15:26:25',4,NULL,NULL),(3,5,1,2,10000000,1,0.00,0.00,10000000.00,NULL,10000000.00,'2022-03-23 15:07:32',4,'2022-03-23 15:07:32',4,NULL,NULL);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `order_reference` varchar(20) DEFAULT NULL,
  `total_line_items` decimal(15,2) DEFAULT NULL,
  `total_tax` decimal(15,2) DEFAULT NULL,
  `total_discount` decimal(15,2) DEFAULT NULL,
  `grand_total` decimal(15,2) DEFAULT NULL,
  `status` varchar(15) DEFAULT 'CART',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,0,NULL,NULL,NULL,NULL,NULL,'CART','2022-03-23 14:58:39',4,'2022-03-23 14:58:39',4,NULL,NULL),(2,1,0,NULL,NULL,NULL,NULL,NULL,'CART','2022-03-23 14:59:00',4,'2022-03-23 14:59:00',4,NULL,NULL),(3,1,0,NULL,NULL,NULL,NULL,NULL,'CART','2022-03-23 15:01:18',4,'2022-03-23 15:01:18',4,NULL,NULL),(4,4,1,'TX20220323-0001',10000000.00,0.00,0.00,10000000.00,'UNPAID','2022-03-23 15:07:30',4,'2022-03-23 15:26:25',4,NULL,NULL),(5,4,0,NULL,NULL,NULL,NULL,NULL,'CART','2022-03-23 15:07:32',4,'2022-03-23 15:07:32',4,NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `number` varchar(40) DEFAULT NULL,
  `paid_amount` decimal(20,2) DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\Customer',4,'auth_token','ce4c445ca02a8aead943b0c77ed70fdaa56be95aca0d60500676dbf73b92dd7d','[\"*\"]',NULL,'2022-03-23 11:32:48','2022-03-23 11:32:48'),(2,'App\\Models\\Customer',4,'auth_token','6f83e2bef91e8def1047d3446eab93d5c9c12b56e6581815470a145d86f2e756','[\"*\"]','2022-03-23 15:06:07','2022-03-23 11:39:59','2022-03-23 15:06:07'),(3,'App\\Models\\Customer',4,'auth_token','5e3ef903d2b32f13d584f924d5f16f4a11a5039741db2c883bc854e67de54efa','[\"*\"]','2022-03-23 16:06:14','2022-03-23 11:46:26','2022-03-23 16:06:14');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@gmail.com',NULL,'$2a$10$JWinVbZxd1anlXBXoe4WVO/o7evoIftr3VZwuIQ0Vt731Xozm1AE2',NULL,NULL,NULL),(2,'Serenity Bali','serenity@gmail.com',NULL,'$2a$10$JWinVbZxd1anlXBXoe4WVO/o7evoIftr3VZwuIQ0Vt731Xozm1AE2',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-23 23:08:10
