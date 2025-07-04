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

