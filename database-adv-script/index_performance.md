-- database_index.sql

-- user table
CREATE INDEX idx_user_user_id ON user(user_id);

-- booking table
CREATE INDEX idx_booking_user_id ON booking(user_id);
CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_booking_start_date ON booking(start_date);

-- property table
CREATE INDEX idx_property_property_id ON property(property_id);
