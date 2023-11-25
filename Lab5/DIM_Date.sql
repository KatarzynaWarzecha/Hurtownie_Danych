USE cw4

CREATE TABLE DIM_Date (
    DateKey INT PRIMARY KEY,
    [Date] DATE,
    Year INT,
    Quarter INT,
    Month INT,
    Week INT,
    Day INT,
    DayOfWeek INT,
    DayOfYear INT,
    IsWeekend BIT,
    IsHoliday BIT, -- You may want to add holiday information
    -- Add more attributes as needed
);
 
-- Populate the Date Dimension table
DECLARE @StartDate DATE = '2000-01-01';
DECLARE @EndDate DATE = '2030-12-31';
 
-- You can adjust the start and end dates as needed
 
WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO DIM_Date (
        DateKey,
        [Date],
        Year,
        Quarter,
        Month,
        Week,
        Day,
        DayOfWeek,
        DayOfYear,
        IsWeekend
    )
    VALUES (
        CONVERT(INT, CONVERT(CHAR(8), @StartDate, 112)),
        @StartDate,
        YEAR(@StartDate),
        DATEPART(QUARTER, @StartDate),
        MONTH(@StartDate),
        DATEPART(WEEK, @StartDate),
        DAY(@StartDate),
        DATEPART(WEEKDAY, @StartDate),
        DATEPART(DAYOFYEAR, @StartDate),
        CASE WHEN DATEPART(WEEKDAY, @StartDate) IN (1, 7) THEN 1 ELSE 0 END
    );
 
    SET @StartDate = DATEADD(DAY, 1, @StartDate);
END;