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
  CONSTRAINT `host_id` FOREIGN KEY (`host_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
BOOKING TABLE;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL,
  `property_id` int NOT NULL,
  `user_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum(' pending',' confirmed',' canceled') NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `property_id_idx` (`property_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`) ON DELETE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
);
PAYMENT TABLE;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `booking_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum(' credit_card',' paypal',' mobile_money') NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `booking_id_idx` (`booking_id`),
  CONSTRAINT `booking_id` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE CASCADE
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
  CONSTRAINT `` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`) ON DELETE CASCADE,
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
MASSAGE TABLE
CREATE TABLE `message` (
  `messaged_id` int NOT NULL,
  `send_id` int NOT NULL,
  `receipent_id` int NOT NULL,
  `message_body` text NOT NULL,
  `sent_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`messaged_id`),
  KEY `sender_id_idx` (`send_id`),
  KEY `recipient_id_idx` (`receipent_id`),
  CONSTRAINT `recipient_id` FOREIGN KEY (`receipent_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `sender_id` FOREIGN KEY (`send_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


SAMPLE USER DATA;
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('uuid-1111', 'John', 'Doe', 'john@example.com', 'hashedpass123', '1234567890', 'guest'),
  ('uuid-2222', 'Alice', 'Smith', 'alice@example.com', 'hashedpass456', '0987654321', 'host'),
  ('uuid-3333', 'Admin', 'User', 'admin@example.com', 'hashedpass789', NULL, 'admin');
SAMPLE PROPERTY DATA;
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('prop-1111', 'uuid-2222', 'Cozy Studio', 'A lovely small studio apartment.', 'New York', 100.00),
  ('prop-2222', 'uuid-2222', 'Beach House', 'Oceanfront property with 3 bedrooms.', 'Miami', 300.00);
SAMPLE BOOKING DATA;
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('book-1111', 'prop-1111', 'uuid-1111', '2025-07-01', '2025-07-05', 400.00, 'confirmed'),
  ('book-2222', 'prop-2222', 'uuid-1111', '2025-08-10', '2025-08-15', 1500.00, 'pending');
SAMPLE PAYMENT DATA;
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  ('pay-1111', 'book-1111', 400.00, 'credit_card');
SAMPLE REVIEW DATA;
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  ('rev-1111', 'prop-1111', 'uuid-1111', 5, 'Wonderful stay, will come back!');
SAMPLE MESSAGE DATA;
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  ('msg-1111', 'uuid-1111', 'uuid-2222', 'Hello, I have a question about my booking.');
