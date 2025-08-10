
SELECT * FROM Jomato_App;

CREATE FUNCTION dbo.StuffChickenIntoQuickBites (@itemName NVARCHAR(255))
RETURNS NVARCHAR(255)
AS
BEGIN
    RETURN 
        CASE 
            WHEN CHARINDEX('Quick Bites', @itemName) > 0 
            THEN REPLACE(@itemName, 'Quick Bites', 'Quick Chicken Bites')
            ELSE @itemName
        END
END

SELECT dbo.StuffChickenIntoQuickBites('Quick bites Platter') AS ModifiedItem -- Returns "Quick Chicken Bites Platter"

SELECT dbo.StuffChickenIntoQuickBites('Veg Pizza') AS ModifiedItem          -- Returns 'Veg Pizza'

--2. Use the function to display the restaurant name and cuisine type which has the
 --maximum number of rating
SELECT 
    RestaurantName,
    dbo.StuffChickenIntoQuickBites(RestaurantType) AS ModifiedRestaurantType,
    CuisinesType,
    [No_of_Rating] AS RatingCount
FROM 
    Jomato_App
WHERE 
    [No_of_Rating] = (
        SELECT MAX([No_of_Rating]) FROM Jomato_App
    );


SELECT
    RestaurantName,
    Rating,
    
    -- 3. Rating Status
    CASE 
        WHEN Rating > 4 THEN 'Excellent'
        WHEN Rating > 3.5 AND Rating <= 4 THEN 'Good'
        WHEN Rating > 3 AND Rating <= 3.5 THEN 'Average'
        WHEN Rating <= 3 THEN 'Bad'
        ELSE 'Not Rated'
    END AS RatingStatus,

    -- 4. Numeric Transformations
    CEILING(CAST(Rating AS FLOAT)) AS RatingCeil,
    FLOOR(CAST(Rating AS FLOAT)) AS RatingFloor,
    ABS(CAST(Rating AS FLOAT)) AS RatingAbsolute,

    -- Date Handling
    GETDATE() AS CurrentDate,
    YEAR(GETDATE()) AS Year,
    DATENAME(MONTH, GETDATE()) AS Month_Name,
    DAY(GETDATE()) AS Day

FROM
    Jomato_App;
--5. Display the restaurant type and total average cost using rollup.
SELECT
    RestaurantType,
    SUM([AverageCost]) AS TotalAverageCost
FROM
    Jomato_App
GROUP BY ROLLUP(RestaurantType);



