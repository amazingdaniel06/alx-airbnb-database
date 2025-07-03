USER TABLE;
CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `role` enum(' guest',' host',' admin') NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
  
PROPERTY TABLE;
CREATE TABLE `property` (
  `property_id` int NOT NULL,
  `host_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(45) NOT NULL,
  `location` varchar(225) NOT NULL,
  `pricepernight` decimal(10,2) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`property_id`),
  KEY `host_id_idx` (`host_id`),
  CONSTRAINT `ht` FOREIGN KEY (`host_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
  
BOOKING TABLE;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL,
  `property_id` int NOT NULL,
  `user_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status_at` enum(' pending',' confirmed',' canceled') NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `property_id_idx` (`property_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `pt` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`) ON DELETE CASCADE,
  CONSTRAINT `ur` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

PAYMENT TABLE;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `booking_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum(' credit_card',' paypal',' mobile_money') NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `booking_id_idx` (`booking_id`),
  CONSTRAINT `bk` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
  
REVIEW TABLE;
CREATE TABLE `review` (
  `review_id` int NOT NULL,
  `property_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rating` int NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `property_id_idx` (`property_id`),
  KEY `user_idx` (`user_id`),
  CONSTRAINT `pt_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`) ON DELETE CASCADE,
  CONSTRAINT `ur_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
  
MASSAGE TABLE
CREATE TABLE `message` (
  `message_id` int NOT NULL,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `message_body` text NOT NULL,
  `sent_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `sender_id_idx` (`sender_id`),
  KEY `recipient_id_idx` (`receiver_id`),
  CONSTRAINT `rr` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `sr` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


SAMPLE USER DATA;
INSERT INTO user 
(user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) 
VALUES 
(1, 'Daniel', 'Arku', 'daniel@example.com', 'passwordhash', '1234567890', ' guest ', NOW());

SAMPLE PROPERTY DATA;
INSERT INTO Property 
(property_id, host_id, name, description, location, pricepernight, created_at, updated_at) 
VALUES 
(1, 1, 'ADairbnb', 'Beach sideview', 'LA', 2000.00, NOW(), NOW());

SAMPLE BOOKING DATA;
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status_at, created_at)
VALUES
(1, 1, 1, '2025-07-01', '2025-07-05', 10000.00, ' pending', NOW());

SAMPLE PAYMENT DATA;
INSERT INTO payment (payment_id, booking_id, amount, payment_method)
VALUES
(1, 1, 10000.00, ' credit_card' )
  
SAMPLE REVIEW DATA;
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  (0001, 1, 1, 5, 'Wonderful stay, will come back!', NOW());

SAMPLE MESSAGE DATA;
INSERT INTO Message (message_id, sender_id, receiver_id, message_body, sent_at)
VALUES
  (1, 1, 001, 'Hello, I have a question about my booking.', NOW());
