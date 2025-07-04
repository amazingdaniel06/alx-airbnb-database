SAMPLE USER DATA;
INSERT INTO user 
(user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) 
VALUES 
(1, 'Daniel', 'Arku', 'daniel@example.com', 'passwordhash', '1234567890', ' guest ', NOW());
INSERT INTO user 
(user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) 
VALUES 
(2, 'Stefan', 'Atta', 'stefan@example.com', 'passhash', '0987654321', ' host ', NOW());
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
