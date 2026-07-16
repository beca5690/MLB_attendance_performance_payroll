-- ==========================================================
-- MLB Attendance Analysis
-- Build Final Analysis Dataset
-- ==========================================================

-- Remove existing tables if they already exist
DROP TABLE IF EXISTS teams_clean;
DROP TABLE IF EXISTS payroll_clean;
DROP TABLE IF EXISTS mlb_analysis;

-- Create a cleaned teams table (2015–2024)
CREATE TABLE teams_clean AS
SELECT
    year,
    team_code,
    team_name,
    wins,
    losses,
    home_games,
    attendance
FROM teams
WHERE year BETWEEN 2015 AND 2024;

-- Create a cleaned payroll table (2015–2024)
CREATE TABLE payroll_clean AS
SELECT
    team_code,
    team_name,
    year,
    total_payroll
FROM payroll
WHERE year BETWEEN 2015 AND 2024;

-- Join attendance and payroll data
CREATE TABLE mlb_analysis AS
SELECT
    t.year,
    p.team_code,
    t.team_name,
    t.wins,
    t.losses,

    ROUND(
        1.0 * t.wins / (t.wins + t.losses),
        3
    ) AS win_pct,

    t.home_games,
    t.attendance,

    ROUND(
        1.0 * t.attendance / t.home_games,
        0
    ) AS avg_attendance,

    p.total_payroll

FROM teams_clean AS t

JOIN payroll_clean AS p

ON p.year = t.year
AND p.team_code =
    CASE t.team_code
        WHEN 'LAN' THEN 'LAD'
        WHEN 'NYA' THEN 'NYY'
        WHEN 'NYN' THEN 'NYM'
        WHEN 'CHA' THEN 'CHW'
        WHEN 'CHN' THEN 'CHC'
        WHEN 'SLN' THEN 'STL'
        WHEN 'SFN' THEN 'SF'
        WHEN 'SDN' THEN 'SD'
        WHEN 'TBA' THEN 'TB'
        WHEN 'KCA' THEN 'KC'
        WHEN 'ANA' THEN 'LAA'
        WHEN 'WAS' THEN 'WSH'
        ELSE t.team_code
    END;

-- Add a numeric payroll column
ALTER TABLE mlb_analysis
ADD COLUMN payroll_numeric INTEGER;

-- Convert payroll strings into numeric values
UPDATE mlb_analysis
SET payroll_numeric =
CAST(
    REPLACE(
        REPLACE(total_payroll, '$', ''),
        ',', ''
    ) AS INTEGER
);

-- Verify average payroll by team
SELECT
    team_name,
    ROUND(AVG(payroll_numeric), 0) AS avg_payroll
FROM mlb_analysis
GROUP BY team_name
ORDER BY avg_payroll DESC;

-- Verify average attendance by team
SELECT
    team_name,
    ROUND(AVG(avg_attendance), 0) AS avg_attendance
FROM mlb_analysis
GROUP BY team_name
ORDER BY avg_attendance DESC;
