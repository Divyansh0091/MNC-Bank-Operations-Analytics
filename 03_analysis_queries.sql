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

-- Analysis: Add operational insights queries
Add 03_analysis_queries.sql to include SQL scripts for calculating performance metrics and growth trends.



