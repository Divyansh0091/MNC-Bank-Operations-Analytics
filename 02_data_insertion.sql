CREATE TABLE Executive_Master (
    Executive_ID INT PRIMARY KEY,
    Executive_Name VARCHAR(50),
    Training_Status VARCHAR(20),
    Department VARCHAR(30)
);
select * from executive_ma

CREATE TABLE Operational_Logs (
    Log_ID INT PRIMARY KEY,
    Executive_ID INT,
    Log_Date DATE,
    Shift VARCHAR(10),
    Volume_Processed INT,
    Error_Count INT,
    Performance_Score DECIMAL(5,2),
    FOREIGN KEY (Executive_ID) REFERENCES Executive_Master(Executive_ID)
);

INSERT INTO Executive_Master (Executive_ID, Executive_Name, Training_Status, Department) VALUES
(1, 'Divyansh Soni', 'Certified', 'Retail Banking'),
(2, 'Pawan Kumar', 'Certified', 'Corporate Loans'),
(3, 'Aarav Sharma', 'Non-Certified', 'Wealth Management'),
(4, 'Amit Verma', 'Certified', 'Retail Banking'),
(5, 'Rahul Malhotra', 'Non-Certified', 'Corporate Loans');

INSERT INTO Operational_Logs (Log_ID, Executive_ID, Log_Date, Shift, Volume_Processed, Error_Count, Performance_Score) VALUES
(1, 1, '2025-01-02', 'Morning', 220, 2, 92.50),
(2, 2, '2025-01-02', 'Night', 190, 4, 82.00),
(3, 3, '2025-01-03', 'Morning', 210, 7, 71.50),
(4, 4, '2025-01-03', 'Night', 205, 3, 85.00),
(5, 5, '2025-01-04', 'Morning', 180, 8, 62.00),
(6, 1, '2025-01-10', 'Morning', 235, 1, 95.00),
(7, 2, '2025-01-12', 'Night', 210, 5, 80.50),
(8, 3, '2025-01-15', 'Morning', 195, 9, 64.00),
(9, 4, '2025-01-18', 'Night', 220, 2, 89.00),
(10, 5, '2025-01-20', 'Morning', 175, 6, 68.50),
(11, 1, '2025-02-01', 'Morning', 240, 0, 98.00),
(12, 2, '2025-02-03', 'Night', 185, 3, 84.50),
(13, 3, '2025-02-05', 'Morning', 200, 6, 73.00),
(14, 4, '2025-02-08', 'Night', 215, 2, 90.00),
(15, 5, '2025-02-12', 'Morning', 190, 7, 65.50),
(16, 1, '2025-03-02', 'Morning', 250, 1, 96.50),
(17, 2, '2025-03-05', 'Night', 195, 4, 83.00),
(18, 3, '2025-03-10', 'Morning', 205, 8, 68.00),
(19, 4, '2025-03-15', 'Night', 220, 3, 87.50),
(20, 5, '2025-03-20', 'Morning', 180, 5, 71.00),
(21, 1, '2025-04-05', 'Night', 190, 3, 84.00), 
(22, 2, '2025-04-10', 'Morning', 260, 2, 94.00),
(23, 3, '2025-04-15', 'Night', 170, 10, 52.00),
(24, 4, '2025-05-01', 'Morning', 245, 1, 95.50),
(25, 5, '2025-05-15', 'Night', 200, 8, 63.00),
(26, 1, '2025-06-01', 'Morning', 230, 2, 91.00),
(27, 2, '2025-06-15', 'Night', 205, 4, 81.50),
(28, 3, '2025-07-01', 'Morning', 215, 7, 72.00),
(29, 4, '2025-08-01', 'Night', 210, 3, 86.00),
(30, 5, '2025-09-01', 'Morning', 185, 6, 67.00),
(31, 1, '2025-10-01', 'Morning', 410, 3, 93.00), 
(32, 2, '2025-10-05', 'Night', 380, 5, 84.00),
(33, 3, '2025-11-12', 'Morning', 395, 12, 61.00), 
(34, 4, '2025-11-20', 'Night', 420, 4, 89.50),
(35, 5, '2025-12-01', 'Morning', 360, 9, 64.00),
(36, 1, '2025-12-15', 'Morning', 430, 1, 98.50),
(37, 2, '2025-12-20', 'Night', 390, 6, 81.00),
(38, 3, '2025-12-24', 'Morning', 370, 11, 59.00),
(39, 4, '2025-12-28', 'Night', 415, 3, 90.00),
(40, 5, '2025-12-30', 'Morning', 350, 8, 66.00),
(41, 1, '2026-01-05', 'Morning', 230, 1, 96.00),
(42, 2, '2026-01-15', 'Night', 210, 4, 83.50),
(43, 3, '2026-02-10', 'Morning', 200, 6, 74.00),
(44, 4, '2026-03-01', 'Night', 225, 2, 91.50),
(45, 5, '2026-04-12', 'Morning', 195, 7, 68.00),
(46, 1, '2026-05-01', 'Morning', 245, 0, 99.00),
(47, 2, '2026-05-20', 'Night', 215, 3, 86.00),
(48, 3, '2026-06-01', 'Morning', 210, 8, 69.50),
(49, 4, '2026-06-10', 'Night', 230, 2, 92.00),
(50, 5, '2026-06-15', 'Morning', 190, 5, 72.50);

INSERT INTO Operational_Logs 
SELECT Log_ID + 50, Executive_ID, Log_Date + INTERVAL '1 day', Shift, Volume_Processed + 5, Error_Count, Performance_Score - 0.5 FROM Operational_Logs;

INSERT INTO Operational_Logs 
SELECT Log_ID + 100, Executive_ID, Log_Date + INTERVAL '3 days', Shift, Volume_Processed - 3, Error_Count, Performance_Score + 0.2 FROM Operational_Logs WHERE Log_ID <= 100;

INSERT INTO Operational_Logs 
SELECT Log_ID + 200, Executive_ID, Log_Date + INTERVAL '7 days', Shift, Volume_Processed + 10, Error_Count, Performance_Score - 1.2 FROM Operational_Logs WHERE Log_ID <= 200;

INSERT INTO Operational_Logs 
SELECT Log_ID + 400, Executive_ID, Log_Date + INTERVAL '14 days', Shift, Volume_Processed - 8, Error_Count, Performance_Score + 0.8 FROM Operational_Logs WHERE Log_ID <= 400;

INSERT INTO Operational_Logs 
SELECT Log_ID + 800, Executive_ID, Log_Date + INTERVAL '28 days', Shift, Volume_Processed + 12, Error_Count, Performance_Score - 0.4 FROM Operational_Logs WHERE Log_ID <= 800;


SELECT COUNT(*) FROM Operational_Logs;

select * from executive_master;
select * from operational_logs;

SELECT 
    TO_CHAR(Log_Date, 'YYYY-MM') AS Operation_Month,
    SUM(Volume_Processed) AS Total_Volume,

    LAG(SUM(Volume_Processed), 1) OVER (ORDER BY TO_CHAR(Log_Date, 'YYYY-MM')) AS Previous_Month_Volume,
    ROUND(
        ((SUM(Volume_Processed) - LAG(SUM(Volume_Processed), 1) OVER (ORDER BY TO_CHAR(Log_Date, 'YYYY-MM'))) / 
        NULLIF(LAG(SUM(Volume_Processed), 1) OVER (ORDER BY TO_CHAR(Log_Date, 'YYYY-MM')), 0)::numeric) * 100, 2
    ) AS MoM_Growth_Percent
FROM Operational_Logs
GROUP BY TO_CHAR(Log_Date, 'YYYY-MM')
ORDER BY Operation_Month;




