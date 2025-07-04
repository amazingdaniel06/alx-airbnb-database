SELECT
    booking.booking_id,
    booking.start_date,
    booking.end_date,
    
    user.user_id,
    user.first_name,
    user.email,
    
    property.property_id,
    property.name AS property_name,
    
    payment.payment_id,
    payment.amount,
    payment.payment_method,
    payment.booking_id
    
FROM
    booking
INNER JOIN user
    ON booking.user_id = user.user_id
INNER JOIN property
    ON booking.property_id = property.property_id
LEFT JOIN payment
    ON booking.booking_id = payment.booking_id;

