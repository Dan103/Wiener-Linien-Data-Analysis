-- export_queries.sql
-- ================================================
-- Stage 1: Export query results to CSV
-- Run each SELECT and then export the result set as indicated
-- ================================================

--------------------------------------------------------------------------------
-- 1) BASIC COMPARISON OF ANNUAL TICKETS VS. RIDERSHIP (RIDES PER TICKET)
-- Export this result as q1_tickets_vs_rides.csv
--------------------------------------------------------------------------------
SELECT
    ant.data_year,
    ant.ticket_count AS annual_passes,
    (r.bus + r.tram + r.underground) AS total_rides,
    (r.bus + r.tram + r.underground) / ant.ticket_count AS rides_per_ticket
FROM vienna_mobility.annual_tickets AS ant
JOIN vienna_mobility.ridership AS r
  ON ant.data_year = r.data_year
ORDER BY ant.data_year;

--------------------------------------------------------------------------------
-- 2) AGGREGATED RIDERSHIP BY YEAR
-- (OPTIONAL: only if you need grand totals separately)
-- Export this result as q4_agg_ridership.csv
--------------------------------------------------------------------------------
SELECT
    data_year,
    SUM(bus) AS bus_total,
    SUM(tram) AS tram_total,
    SUM(underground) AS underground_total,
    SUM(bus + tram + underground) AS grand_total
FROM vienna_mobility.ridership
GROUP BY data_year
ORDER BY data_year;


--------------------------------------------------------------------------------
-- 3) CAR OWNERSHIP BY DISTRICT (CARS PER 1 000 INHABITANTS)
-- Export this result as q5_cars_per_1000.csv
--------------------------------------------------------------------------------
SELECT 
    data_year,
    district,
    SUM(passenger_cars) / SUM(population) * 1000 AS cars_per_1000
FROM vienna_mobility.pkw_population
GROUP BY data_year, district
ORDER BY data_year, cars_per_1000 DESC;


--------------------------------------------------------------------------------
-- 4) HIGHEST-USAGE MODE EACH YEAR
-- Export this result as q10_top_mode.csv
--------------------------------------------------------------------------------
SELECT 
    data_year,
    CASE
        WHEN bicycle >= GREATEST(car, public_transport, by_foot) THEN 'Bicycle'
        WHEN car     >= GREATEST(bicycle, public_transport, by_foot) THEN 'Car'
        WHEN public_transport >= GREATEST(bicycle, car, by_foot) THEN 'Public Transport'
        ELSE 'On Foot'
    END AS top_mode
FROM vienna_mobility.mode_share
ORDER BY data_year;
