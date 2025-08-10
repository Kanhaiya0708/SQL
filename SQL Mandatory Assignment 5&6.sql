--1. Stored Procedure — Restaurants with Table Booking Not 'No'

CREATE PROCEDURE GetRestaurantsWithTableBooking
AS
BEGIN
    SELECT RestaurantName, RestaurantType, CuisinesType
    FROM Jomato_App
    WHERE TableBooking = 'Yes';
END;
GO

EXEC GetRestaurantsWithTableBooking;

--2. Transaction — Update 'Cafe' to 'Cafeteria' in CuisinesType with Rollback

BEGIN TRANSACTION;

UPDATE Jomato_App
SET CuisinesType = REPLACE(CuisinesType, 'Cafe', 'Cafeteria')
WHERE CuisinesType LIKE '%Cafe%';

-- Check updated rows
SELECT RestaurantName, CuisinesType
FROM Jomato_App
WHERE CuisinesType LIKE '%Cafeteria%';

ROLLBACK;  -- Undo changes

-- Verify rollback
SELECT RestaurantName, CuisinesType
FROM Jomato_App
WHERE CuisinesType LIKE '%Cafe%';

--3. Top 5 Areas by Highest Average Restaurant Rating
WITH AreaRatings AS (
    SELECT Area, AVG(Rating) AS AvgRating
    FROM Jomato_App
    WHERE Rating IS NOT NULL
    GROUP BY Area
),
Ranked AS (
    SELECT Area, AvgRating,
           ROW_NUMBER() OVER (ORDER BY AvgRating DESC) AS rn
    FROM AreaRatings
)
SELECT Area, AvgRating
FROM Ranked
WHERE rn <= 5;

--4. WHILE Loop – Print Numbers from 1 to 50
DECLARE @counter INT = 1;

WHILE @counter <= 50
BEGIN
    PRINT @counter;
    SET @counter += 1;
END;

--5. View – Top 5 Highest Rated Restaurants
CREATE OR ALTER VIEW Top5HighestRatedRestaurants
AS
SELECT TOP 5 RestaurantName, Area, Rating
FROM Jomato_App
WHERE Rating IS NOT NULL
ORDER BY Rating DESC;
GO

-- Query the view
SELECT * FROM Top5HighestRatedRestaurants;

--6. Trigger – Log New Restaurant Insertions
-- Create a log table to store trigger messages
CREATE TABLE InsertLog (
    LogID INT IDENTITY PRIMARY KEY,
    Message NVARCHAR(255),
    LogDate DATETIME DEFAULT GETDATE()
);
GO

-- Create trigger on Jomato_App for inserts
CREATE TRIGGER trgAfterRestaurantInsert
ON Jomato_App
AFTER INSERT
AS
BEGIN
    DECLARE @name NVARCHAR(255);
    SELECT @name = RestaurantName FROM inserted;

    INSERT INTO InsertLog (Message)
    VALUES ('New restaurant added: ' + @name);

    PRINT 'New restaurant added: ' + @name; -- This shows in SSMS message tab
END;
GO

-- Test Trigger
INSERT INTO Jomato_App (
    OrderId,
    RestaurantName,
    RestaurantType,
    Rating,
    No.of.Rating,
    AverageCost,
    OnlineOrder,
    TableBooking,
    CuisinesType,
    Area,
    LocalAddress,
    Delivery time
)
VALUES (
    999999,
    'Test Cafe Insert',
    'Cafe',
    4.8,
    100,
    800,
    'Yes',
    'Yes',
    'Cafe, Beverages',
    'HSR',
    'HSR Layout',
    40
);


-- View logs
SELECT * FROM InsertLog;






