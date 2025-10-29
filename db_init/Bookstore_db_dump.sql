-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: Bookstore_db
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `author` varchar(150) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int DEFAULT '0',
  `seller_id` bigint DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'The Silent Patient','Alex Michaelides','Thriller',499.00,20,2,'https://critic.thhsclassic.com/wp-content/uploads/2022/12/69249081977__1B7AF782-D325-4373-876C-2F8414F324CF-675x900.jpg'),(2,'Atomic Habits','James Clear','Self-help',399.00,30,2,'https://jamesclear.com/wp-content/uploads/2025/06/atomic-habits-dots.png'),(3,'Ikigai','Héctor García','Philosophy',350.00,25,2,'https://cdn.shopify.com/s/files/1/1163/9680/products/Ikigai_Book.jpg?v=1536585232'),(4,'The Alchemist','Paulo Coelho','Fiction',299.00,40,3,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz_LjCHPGl5Xm2tO2TiNf01LRqbvUBRT_5gQ&s'),(5,'1984','George Orwell','Dystopian',450.00,35,3,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeh-Rh6Xmg9cN2g8p8Sdl4m8KDlu1hTpjmg&s'),(6,'To Kill a Mockingbird','Harper Lee','Classic',420.00,22,3,'https://bfbooks.com/cdn/shop/files/To_Kill_a_Mockingbird_Harper_Lee_processed.jpg?v=1751405957&width=546'),(7,'The Psychology of Money','Morgan Housel','Finance',380.00,50,3,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5YBdT06AzpkwlDPK4pSZFMjjaglEJqSQzYQ&s'),(8,'Deep Work','Cal Newport','Productivity',410.00,25,4,'https://thewriting.dev/content/images/2021/08/CalNewportDeepWork.jpg'),(9,'Can’t Hurt Me','David Goggins','Biography',499.00,30,4,'https://bookwormsdenn.com/cdn/shop/files/17.png?v=1711011105'),(10,'Rich Dad Poor Dad','Robert Kiyosaki','Finance',390.00,40,4,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg5PAv5-ESxj5bypvhNjzFZP6W_JWcL1HnMA&s'),(11,'Sapiens','Yuval Noah Harari','History',520.00,20,5,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0FxCfM-_t-RbeO2sctksNPeHO2cPndNQPLg&s'),(12,'Becoming','Michelle Obama','Biography',480.00,18,5,'https://icrrd.com/public/media/15-05-2021-133510becoming-michelle-obama.jpg'),(13,'Educated','Tara Westover','Biography',450.00,22,5,'https://www.adorebooks.in/wp-content/uploads/2024/08/Educated-Tara-Westover.jpg'),(14,'The Subtle Art of Not Giving a F*ck','Mark Manson','Self-help',399.00,28,6,'https://www.apnibook.in/wp-content/uploads/2023/09/Untitled-design-2022-06-23T194849.247.jpg'),(15,'The Power of Now','Eckhart Tolle','Spirituality',420.00,30,6,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLLcqnfRpkOoz6wN3wP_ckh4J47WwOLxb0Ng&s'),(16,'Think Like a Monk','Jay Shetty','Self-help',410.00,35,6,'https://www.frontlist.in/storage/uploads/2021/06/BeLessAwful.com-Jay-Shetty_Think-Like-a-Monk-book.jpg'),(17,'The 5 AM Club','Robin Sharma','Motivational',390.00,40,2,'https://i0.wp.com/leoberrygifts.com/wp-content/uploads/2023/10/the-5am-club-book.jpeg?fit=1600%2C1199&ssl=1'),(18,'Man’s Search for Meaning','Viktor Frankl','Philosophy',370.00,15,2,'https://images-eu.ssl-images-amazon.com/images/I/61MdAtnimVL._AC_UL210_SR210,210_.jpg'),(19,'The Book Thief','Markus Zusak','Fiction',460.00,22,2,'https://www.adorebooks.in/wp-content/uploads/2022/02/Untitled-design-91-1.jpg'),(20,'The Hobbit','J.R.R. Tolkien','Fantasy',520.00,25,3,'https://www.thoughtco.com/thmb/8ioUx2MObPyOISPCi4Ej_vY-by0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/ScreenShot2019-03-06at2.19.49PM-5c8049af46e0fb00011bf42b.jpg'),(21,'Harry Potter and the Sorcerer’s Stone','J.K. Rowling','Fantasy',550.00,50,3,'https://images-eu.ssl-images-amazon.com/images/I/91NjWLufnNL._AC_UL600_SR600,600_.jpg'),(22,'Harry Potter and the Chamber of Secrets','J.K. Rowling','Fantasy',560.00,50,3,'https://www.apnibook.in/wp-content/uploads/2023/09/Untitled-design-2022-04-10T061455.502-1.jpg'),(23,'Harry Potter and the Prisoner of Azkaban','J.K. Rowling','Fantasy',580.00,50,3,'https://www.crossword.in/cdn/shop/files/crosswordonline-books-default-title-harry-potter-and-the-prisoner-of-azkaban-40471522738393.jpg?v=1746656497'),(24,'The Great Gatsby','F. Scott Fitzgerald','Classic',350.00,30,4,'https://images-eu.ssl-images-amazon.com/images/I/71YF1hHLw7L._AC_UL210_SR210,210_.jpg'),(25,'Dune','Frank Herbert','Science Fiction',600.00,25,4,'https://www.crossword.in/cdn/shop/files/god-emperor-of-dune-reissue-paperback-herbert-frank-bk0496054-42501773590745.jpg?v=1746609476'),(26,'Inferno','Dan Brown','Thriller',490.00,25,4,'https://www.crossword.in/cdn/shop/products/crosswordonline-books-default-title-inferno-hardcover-dan-brown-paperback-dan-brown-paperback-40370833424601.jpg?v=1745712807'),(27,'Angels & Demons','Dan Brown','Thriller',480.00,25,5,'https://talekart.com/wp-content/uploads/2020/12/Angels-Demons.webp'),(28,'Digital Fortress','Dan Brown','Thriller',450.00,20,5,'https://talekart.com/wp-content/uploads/2021/02/Dan-Brown.webp'),(29,'Origin','Dan Brown','Thriller',500.00,30,6,'https://i5.walmartimages.com/asr/969df910-6637-4410-abc7-1ac43bb609a3.1c5ce94f8f20604fd2e7f9e88546328c.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF'),(30,'The Da Vinci Code','Dan Brown','Thriller',520.00,35,6,'https://www.majesticreaders.com/thumb/booksimg/450/600/10237/PIC_201806020914_10237_1.jpg');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `book_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `price_at_purchase` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,2,2,399.00),(2,1,4,1,299.00),(3,2,5,1,450.00),(4,2,3,1,350.00),(5,3,10,2,390.00),(6,4,19,1,460.00),(7,4,7,2,380.00),(8,5,8,1,410.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_id` bigint NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('PENDING','COMPLETED','CANCELLED') DEFAULT 'PENDING',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,8,'2025-01-11 18:30:00',1350.00,'COMPLETED'),(2,9,'2025-01-14 18:30:00',780.00,'PENDING'),(3,10,'2025-01-16 18:30:00',1100.00,'COMPLETED'),(4,11,'2025-01-17 18:30:00',1550.00,'COMPLETED'),(5,12,'2025-01-19 18:30:00',480.00,'PENDING');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN'),(3,'CUSTOMER'),(2,'SELLER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@bookstore.com','$2a$12$NQHo9UKK0NeMpo0EybEELe0zjvE6wsoEM/f1aPeOAuefPW2TqV5J6',1,'2025-10-29 13:40:15'),(2,'Maddy & Brothers','seller1@store.com','$2a$12$CvivMzF.bxGo0LPAXMOHY.a0TYsIRAfSyBvbql98e7QXXQ74RNz8.',2,'2025-10-29 13:40:15'),(3,'Kishore Kanna publishers','seller2@store.com','$2a$12$CvivMzF.bxGo0LPAXMOHY.a0TYsIRAfSyBvbql98e7QXXQ74RNz8.',2,'2025-10-29 13:40:15'),(4,'Sasha prints','seller3@store.com','$2a$12$CvivMzF.bxGo0LPAXMOHY.a0TYsIRAfSyBvbql98e7QXXQ74RNz8.',2,'2025-10-29 13:40:15'),(5,'Poppy Publishers','seller4@store.com','$2a$12$CvivMzF.bxGo0LPAXMOHY.a0TYsIRAfSyBvbql98e7QXXQ74RNz8.',2,'2025-10-29 13:40:15'),(6,'Zeke Press','seller5@store.com','$2a$12$CvivMzF.bxGo0LPAXMOHY.a0TYsIRAfSyBvbql98e7QXXQ74RNz8.',2,'2025-10-29 13:40:15'),(7,'Alice','alice@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3,'2025-10-29 13:40:15'),(8,'Bob','bob@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3,'2025-10-29 13:40:15'),(9,'Charlie','charlie@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3,'2025-10-29 13:40:15'),(10,'David','david@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3,'2025-10-29 13:40:15'),(11,'Emma','emma@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3,'2025-10-29 13:40:15'),(12,'Frank','frank@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3,'2025-10-29 13:40:15'),(13,'Grace','grace@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3,'2025-10-29 13:40:15'),(14,'Hannah','hannah@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3,'2025-10-29 13:40:15'),(15,'Ivan','ivan@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3,'2025-10-29 13:40:15'),(16,'Julia','julia@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3,'2025-10-29 13:40:15'),(17,'Kevin','kevin@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3,'2025-10-29 13:40:15'),(18,'Linda','linda@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3,'2025-10-29 13:40:15'),(19,'Mike','mike@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3,'2025-10-29 13:40:15'),(20,'Nora','nora@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3,'2025-10-29 13:40:15'),(21,'Oliver','oliver@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3,'2025-10-29 13:40:15');
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

-- Dump completed on 2025-10-29 19:14:01
