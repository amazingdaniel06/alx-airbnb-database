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
    property.property_id = review.property_id;

