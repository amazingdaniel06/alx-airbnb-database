-- database_index.sql

-- user table
CREATE INDEX idx_user_user_id ON user(user_id);

-- booking table
CREATE INDEX idx_booking_user_id ON booking(user_id);
CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_booking_start_date ON booking(start_date);

-- property table
CREATE INDEX idx_property_property_id ON property(property_id);

EXPLAIN SELECT
    pb.property_id,
    property.name AS property_name,
    pb.total_bookings,
    ROW_NUMBER() OVER (ORDER BY pb.total_bookings DESC) AS row_number_rank,
    RANK() OVER (ORDER BY pb.total_bookings DESC) AS rank_rank
FROM (
    SELECT
        booking.property_id,
        COUNT(booking.booking_id) AS total_bookings
    FROM
        booking
    GROUP BY
        booking.property_id
) AS pb
JOIN property
  ON pb.property_id = property.property_id;

