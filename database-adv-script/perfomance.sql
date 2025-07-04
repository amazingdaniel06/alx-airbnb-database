EXPLAIN ANALYZE
SELECT
    booking.booking_id,
    booking.start_date,
    booking.end_date,
    user.first_name,
    user.email,
    property.name AS property_name,
    payment.amount,
    payment.payment_date,
    payment.status
FROM
    booking
INNER JOIN user
    ON booking.user_id = user.user_id
INNER JOIN property
    ON booking.property_id = property.property_id
LEFT JOIN payment
    ON booking.booking_id = payment.booking_id
WHERE
    booking.start_date >= '2024-01-01'
    AND booking.status = 'confirmed'
LIMIT 100;
