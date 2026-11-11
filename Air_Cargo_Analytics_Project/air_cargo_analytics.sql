#CREATE DATABASE air_cargo_analytics;
USE air_cargo_analytics;
SELECT COUNT(*) AS total_records
FROM cargo_activity;
SELECT *
FROM cargo_activity
LIMIT 10;
SELECT
    COUNT(*) AS total_records,
    COUNT(`Cargo Weight LBS`) AS valid_weights,
    SUM(`Cargo Weight LBS`) AS total_cargo_weight
FROM cargo_activity;
SELECT
    `GEO Summary`,
    SUM(`Cargo Weight LBS`) AS total_cargo_weight,
    COUNT(*) AS total_records
FROM cargo_activity
GROUP BY `GEO Summary`
ORDER BY total_cargo_weight DESC;
SELECT
    `Operating Airline`,
    SUM(`Cargo Weight LBS`) AS total_cargo_weight,
    COUNT(*) AS total_records
FROM cargo_activity
GROUP BY `Operating Airline`
ORDER BY total_cargo_weight DESC
LIMIT 10;
SELECT
    DATE_FORMAT(
        STR_TO_DATE(`Activity Period Start Date`, '%d-%m-%Y'),
        '%Y-%m'
    ) AS cargo_month,
    SUM(`Cargo Weight LBS`) AS total_cargo_weight,
    COUNT(*) AS total_records
FROM cargo_activity
GROUP BY cargo_month
ORDER BY cargo_month;
SELECT
    `Cargo Aircraft Type`,
    SUM(`Cargo Weight LBS`) AS total_cargo_weight,
    COUNT(*) AS total_records
FROM cargo_activity
GROUP BY `Cargo Aircraft Type`
ORDER BY total_cargo_weight DESC;
SELECT
    `GEO Region`,
    SUM(`Cargo Weight LBS`) AS total_cargo_weight,
    COUNT(*) AS total_records
FROM cargo_activity
GROUP BY `GEO Region`
ORDER BY total_cargo_weight DESC;
SELECT
    `Activity Type Code`,
    SUM(`Cargo Weight LBS`) AS total_cargo_weight,
    COUNT(*) AS total_records
FROM cargo_activity
GROUP BY `Activity Type Code`
ORDER BY total_cargo_weight DESC;
SELECT
    `GEO Summary`,
    SUM(`Cargo Weight LBS`) AS total_cargo_weight,
    ROUND(
        SUM(`Cargo Weight LBS`) * 100.0 /
        (SELECT SUM(`Cargo Weight LBS`)
         FROM cargo_activity), 2
    ) AS cargo_percentage
FROM cargo_activity
GROUP BY `GEO Summary`
ORDER BY total_cargo_weight DESC;
SELECT
    `GEO Summary`,
    `Cargo Aircraft Type`,
    COUNT(*) AS total_records,
    SUM(`Cargo Weight LBS`) AS total_cargo_weight,
    ROUND(AVG(`Cargo Weight LBS`), 2) AS avg_cargo_weight
FROM cargo_activity
GROUP BY
    `GEO Summary`,
    `Cargo Aircraft Type`
ORDER BY total_cargo_weight DESC;
SELECT
    DATE_FORMAT(
        STR_TO_DATE(`Activity Period Start Date`, '%m-%d-%Y'),
        '%Y-%m'
    ) AS cargo_month,
    SUM(`Cargo Weight LBS`) AS total_cargo_weight,
    COUNT(*) AS total_records
FROM cargo_activity
GROUP BY cargo_month
ORDER BY cargo_month;
SELECT
    `GEO Summary`,
    SUM(`Cargo Weight LBS`) AS total_cargo_weight,
    ROUND(
        SUM(`Cargo Weight LBS`) * 100.0 /
        (SELECT SUM(`Cargo Weight LBS`)
         FROM cargo_activity), 2
    ) AS cargo_percentage
FROM cargo_activity
GROUP BY `GEO Summary`
ORDER BY total_cargo_weight DESC;
SELECT
    `Operating Airline`,
    SUM(`Cargo Weight LBS`) AS total_cargo_weight,
    COUNT(*) AS total_records
FROM cargo_activity
GROUP BY `Operating Airline`
ORDER BY total_cargo_weight DESC
LIMIT 10;
SELECT
    `Operating Airline`,
    COUNT(*) AS total_records,
    ROUND(AVG(`Cargo Weight LBS`), 2) AS avg_cargo_weight,
    SUM(`Cargo Weight LBS`) AS total_cargo_weight
FROM cargo_activity
GROUP BY `Operating Airline`
ORDER BY avg_cargo_weight DESC
LIMIT 10;
SELECT
    `Cargo Aircraft Type`,
    COUNT(*) AS total_records,
    SUM(`Cargo Weight LBS`) AS total_cargo_weight,
    ROUND(AVG(`Cargo Weight LBS`), 2) AS avg_cargo_weight
FROM cargo_activity
GROUP BY `Cargo Aircraft Type`
ORDER BY total_cargo_weight DESC;
SELECT
    `GEO Region`,
    COUNT(*) AS total_records,
    SUM(`Cargo Weight LBS`) AS total_cargo_weight,
    ROUND(
        SUM(`Cargo Weight LBS`) * 100.0 /
        (SELECT SUM(`Cargo Weight LBS`)
         FROM cargo_activity), 2
    ) AS cargo_percentage
FROM cargo_activity
GROUP BY `GEO Region`
ORDER BY total_cargo_weight DESC;
SELECT
    DATE_FORMAT(
        STR_TO_DATE(`Activity Period Start Date`, '%m-%d-%Y'),
        '%Y'
    ) AS cargo_year,
    SUM(`Cargo Weight LBS`) AS total_cargo_weight,
    COUNT(*) AS total_records
FROM cargo_activity
GROUP BY cargo_year
ORDER BY cargo_year;
SELECT
    `GEO Summary`,
    SUM(`Cargo Weight LBS`) AS total_cargo_weight,
    COUNT(*) AS total_records,
    ROUND(
        SUM(`Cargo Weight LBS`) * 100.0 /
        (SELECT SUM(`Cargo Weight LBS`)
         FROM cargo_activity), 2
    ) AS cargo_percentage
FROM cargo_activity
GROUP BY `GEO Summary`
ORDER BY total_cargo_weight DESC;
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT `Operating Airline`) AS total_airlines,
    SUM(`Cargo Weight LBS`) AS total_cargo_lbs,
    ROUND(AVG(`Cargo Weight LBS`), 2) AS avg_cargo_lbs
FROM cargo_activity;