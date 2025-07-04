SELECT 
    booking.booking_id,
    booking.property_id,
    booking.start_date,
    user.user_id,
    user.first_name,
    user.email
FROM 
    booking
INNER JOIN 
    user
ON 
    booking.user_id = user.user_id;

SELECT 
    property.property_id,
    property.name,
    review.review_id,
    review.rating,
    review.user_id
FROM 
    property
LEFT JOIN 
    review
ON 
    property.property_id = review.property_id
ORDER BY 
    property.property_id;

FULL OUTER JOIN;
SELECT 
    user.user_id,
    user.first_name,
    user.email,
    booking.booking_id,
    booking.property_id,
    booking.start_date
FROM 
    user
LEFT JOIN 
    booking
ON 
    user.user_id = booking.user_id

UNION

SELECT 
    user.user_id,
    user.first_name,
    user.email,
    booking.booking_id,
    booking.property_id,
    booking.start_date
FROM 
    booking
LEFT JOIN 
    user
ON 
    booking.user_id = user.user_id;
