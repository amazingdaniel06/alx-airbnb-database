USER TABLE;
CREATE TABLE User (
  user_id UUID PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20),
  role ENUM('guest', 'host', 'admin') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX (email)
);
PROPERTY TABLE;
CREATE TABLE Property (
  property_id UUID PRIMARY KEY,
  host_id UUID NOT NULL,
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  location VARCHAR(255) NOT NULL,
  pricepernight DECIMAL(10, 2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (host_id) REFERENCES User(user_id) ON DELETE CASCADE,
  INDEX (property_id)
);
BOOKING TABLE;
CREATE TABLE Booking (
  booking_id UUID PRIMARY KEY,
  property_id UUID NOT NULL,
  user_id UUID NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL(10, 2) NOT NULL,
  status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
  INDEX (property_id),
  INDEX (booking_id)
);
PAYMENT TABLE;
CREATE TABLE Payment (
  payment_id UUID PRIMARY KEY,
  booking_id UUID NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
  FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE,
  INDEX (booking_id)
);
REVIEW TABLE;
CREATE TABLE Review (
  review_id UUID PRIMARY KEY,
  property_id UUID NOT NULL,
  user_id UUID NOT NULL,
  rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
  comment TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);
MASSAGE TABLE
CREATE TABLE Message (
  message_id UUID PRIMARY KEY,
  sender_id UUID NOT NULL,
  recipient_id UUID NOT NULL,
  message_body TEXT NOT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (sender_id) REFERENCES User(user_id) ON DELETE CASCADE,
  FOREIGN KEY (recipient_id) REFERENCES User(user_id) ON DELETE CASCADE
);



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
