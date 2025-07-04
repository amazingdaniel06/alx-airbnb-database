SELECT 
    property.property_id,
    property.name
FROM 
    property
WHERE 
    property.property_id IN (
        SELECT 
            review.property_id
        FROM 
            review
        GROUP BY 
            review.property_id
        HAVING 
            AVG(review.rating) > 4.0
    );

