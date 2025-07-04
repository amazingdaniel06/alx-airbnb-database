 SELECT 
    user.user_id,
    user.first_name,
    user.email,
    COUNT(booking.booking_id) AS total_bookings
FROM 
    user
LEFT JOIN 
    booking
ON 
    user.user_id = booking.user_id
GROUP BY 
    user.user_id,
    user.first_name,
    user.email;

SELECT
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
