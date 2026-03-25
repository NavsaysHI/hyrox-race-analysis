-- =====================================================
-- HYROX Race Analysis -- Male Doubles Elite Performance
-- Target: Sub 60 Minutes -- Top 6% of Global Field
-- Seasons 4 to 6 (2021-2023) -- 28,047 doubles results
-- =====================================================

-- Q1: What station times do sub 60 teams average vs the rest?
SELECT
    CASE
        WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600
             THEN 'Sub 1:00 (Elite Target)'
        WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 4500
             THEN '1:00 to 1:15'
        WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 5400
             THEN '1:15 to 1:30'
        ELSE 'Over 1:30'
    END AS performance_group,
    COUNT(*) AS num_teams,
    ROUND(AVG(CAST(SUBSTR(work_1,1,INSTR(work_1,':')-1) AS INT)*3600 + CAST(SUBSTR(work_1,INSTR(work_1,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_1,INSTR(work_1,':')+4,2) AS INT)),0) AS avg_skierg_secs,
    ROUND(AVG(CAST(SUBSTR(work_2,1,INSTR(work_2,':')-1) AS INT)*3600 + CAST(SUBSTR(work_2,INSTR(work_2,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_2,INSTR(work_2,':')+4,2) AS INT)),0) AS avg_sledpush_secs,
    ROUND(AVG(CAST(SUBSTR(work_3,1,INSTR(work_3,':')-1) AS INT)*3600 + CAST(SUBSTR(work_3,INSTR(work_3,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_3,INSTR(work_3,':')+4,2) AS INT)),0) AS avg_sledpull_secs,
    ROUND(AVG(CAST(SUBSTR(work_4,1,INSTR(work_4,':')-1) AS INT)*3600 + CAST(SUBSTR(work_4,INSTR(work_4,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_4,INSTR(work_4,':')+4,2) AS INT)),0) AS avg_burpee_secs,
    ROUND(AVG(CAST(SUBSTR(work_5,1,INSTR(work_5,':')-1) AS INT)*3600 + CAST(SUBSTR(work_5,INSTR(work_5,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_5,INSTR(work_5,':')+4,2) AS INT)),0) AS avg_rowing_secs,
    ROUND(AVG(CAST(SUBSTR(work_6,1,INSTR(work_6,':')-1) AS INT)*3600 + CAST(SUBSTR(work_6,INSTR(work_6,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_6,INSTR(work_6,':')+4,2) AS INT)),0) AS avg_farmers_secs,
    ROUND(AVG(CAST(SUBSTR(work_7,1,INSTR(work_7,':')-1) AS INT)*3600 + CAST(SUBSTR(work_7,INSTR(work_7,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_7,INSTR(work_7,':')+4,2) AS INT)),0) AS avg_sandbag_secs,
    ROUND(AVG(CAST(SUBSTR(work_8,1,INSTR(work_8,':')-1) AS INT)*3600 + CAST(SUBSTR(work_8,INSTR(work_8,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_8,INSTR(work_8,':')+4,2) AS INT)),0) AS avg_wallballs_secs
FROM hyrox_results_clean
WHERE division = 'doubles'
  AND gender = 'male'
  AND total_time IS NOT NULL
GROUP BY performance_group
ORDER BY MIN(CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 +
             CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 +
             CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT));


-- Q2: What run pace do sub 60 teams hold across all 8 runs?
SELECT
    CASE
        WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600
             THEN 'Sub 1:00 (Elite Target)'
        WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 4500
             THEN '1:00 to 1:15'
        ELSE 'Over 1:15'
    END AS performance_group,
    COUNT(*) AS num_teams,
    ROUND(AVG(CAST(SUBSTR(run_1,1,INSTR(run_1,':')-1) AS INT)*3600 + CAST(SUBSTR(run_1,INSTR(run_1,':')+1,2) AS INT)*60 + CAST(SUBSTR(run_1,INSTR(run_1,':')+4,2) AS INT)),0) AS avg_run1_secs,
    ROUND(AVG(CAST(SUBSTR(run_2,1,INSTR(run_2,':')-1) AS INT)*3600 + CAST(SUBSTR(run_2,INSTR(run_2,':')+1,2) AS INT)*60 + CAST(SUBSTR(run_2,INSTR(run_2,':')+4,2) AS INT)),0) AS avg_run2_secs,
    ROUND(AVG(CAST(SUBSTR(run_3,1,INSTR(run_3,':')-1) AS INT)*3600 + CAST(SUBSTR(run_3,INSTR(run_3,':')+1,2) AS INT)*60 + CAST(SUBSTR(run_3,INSTR(run_3,':')+4,2) AS INT)),0) AS avg_run3_secs,
    ROUND(AVG(CAST(SUBSTR(run_4,1,INSTR(run_4,':')-1) AS INT)*3600 + CAST(SUBSTR(run_4,INSTR(run_4,':')+1,2) AS INT)*60 + CAST(SUBSTR(run_4,INSTR(run_4,':')+4,2) AS INT)),0) AS avg_run4_secs,
    ROUND(AVG(CAST(SUBSTR(run_5,1,INSTR(run_5,':')-1) AS INT)*3600 + CAST(SUBSTR(run_5,INSTR(run_5,':')+1,2) AS INT)*60 + CAST(SUBSTR(run_5,INSTR(run_5,':')+4,2) AS INT)),0) AS avg_run5_secs,
    ROUND(AVG(CAST(SUBSTR(run_6,1,INSTR(run_6,':')-1) AS INT)*3600 + CAST(SUBSTR(run_6,INSTR(run_6,':')+1,2) AS INT)*60 + CAST(SUBSTR(run_6,INSTR(run_6,':')+4,2) AS INT)),0) AS avg_run6_secs,
    ROUND(AVG(CAST(SUBSTR(run_7,1,INSTR(run_7,':')-1) AS INT)*3600 + CAST(SUBSTR(run_7,INSTR(run_7,':')+1,2) AS INT)*60 + CAST(SUBSTR(run_7,INSTR(run_7,':')+4,2) AS INT)),0) AS avg_run7_secs,
    ROUND(AVG(CAST(SUBSTR(run_8,1,INSTR(run_8,':')-1) AS INT)*3600 + CAST(SUBSTR(run_8,INSTR(run_8,':')+1,2) AS INT)*60 + CAST(SUBSTR(run_8,INSTR(run_8,':')+4,2) AS INT)),0) AS avg_run8_secs
FROM hyrox_results_clean
WHERE division = 'doubles'
  AND gender = 'male'
  AND total_time IS NOT NULL
GROUP BY performance_group
ORDER BY MIN(CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 +
             CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 +
             CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT));


-- Q3: Time distribution analysis -- where do sub 60 teams spend their time?
SELECT
    CASE
        WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600
             THEN 'Sub 1:00 (Elite Target)'
        WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 4500
             THEN '1:00 to 1:15'
        ELSE 'Over 1:15'
    END AS performance_group,
    COUNT(*) AS num_teams,
    ROUND(AVG(CAST(SUBSTR(run_time,1,INSTR(run_time,':')-1) AS INT)*3600 +
        CAST(SUBSTR(run_time,INSTR(run_time,':')+1,2) AS INT)*60 +
        CAST(SUBSTR(run_time,INSTR(run_time,':')+4,2) AS INT)),0) AS avg_run_time_secs,
    ROUND(AVG(CAST(SUBSTR(work_time,1,INSTR(work_time,':')-1) AS INT)*3600 +
        CAST(SUBSTR(work_time,INSTR(work_time,':')+1,2) AS INT)*60 +
        CAST(SUBSTR(work_time,INSTR(work_time,':')+4,2) AS INT)),0) AS avg_work_time_secs,
    ROUND(AVG(CAST(SUBSTR(roxzone_time,1,INSTR(roxzone_time,':')-1) AS INT)*3600 +
        CAST(SUBSTR(roxzone_time,INSTR(roxzone_time,':')+1,2) AS INT)*60 +
        CAST(SUBSTR(roxzone_time,INSTR(roxzone_time,':')+4,2) AS INT)),0) AS avg_roxzone_secs,
    ROUND(AVG(CAST(SUBSTR(run_time,1,INSTR(run_time,':')-1) AS INT)*3600 +
        CAST(SUBSTR(run_time,INSTR(run_time,':')+1,2) AS INT)*60 +
        CAST(SUBSTR(run_time,INSTR(run_time,':')+4,2) AS INT)) * 100.0 /
    AVG(CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 +
        CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 +
        CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)),1) AS run_pct_of_total,
    ROUND(AVG(CAST(SUBSTR(work_time,1,INSTR(work_time,':')-1) AS INT)*3600 +
        CAST(SUBSTR(work_time,INSTR(work_time,':')+1,2) AS INT)*60 +
        CAST(SUBSTR(work_time,INSTR(work_time,':')+4,2) AS INT)) * 100.0 /
    AVG(CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 +
        CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 +
        CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)),1) AS work_pct_of_total,
    ROUND(AVG(CAST(SUBSTR(roxzone_time,1,INSTR(roxzone_time,':')-1) AS INT)*3600 +
        CAST(SUBSTR(roxzone_time,INSTR(roxzone_time,':')+1,2) AS INT)*60 +
        CAST(SUBSTR(roxzone_time,INSTR(roxzone_time,':')+4,2) AS INT)) * 100.0 /
    AVG(CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 +
        CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 +
        CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)),1) AS roxzone_pct_of_total
FROM hyrox_results_clean
WHERE division = 'doubles'
  AND gender = 'male'
  AND total_time IS NOT NULL
  AND run_time IS NOT NULL
  AND work_time IS NOT NULL
GROUP BY performance_group
ORDER BY MIN(CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 +
             CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 +
             CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT));


-- Q4: Station time gap between sub 60 and sub 75 teams
SELECT 'SkiErg' AS station,
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600 THEN CAST(SUBSTR(work_1,1,INSTR(work_1,':')-1) AS INT)*3600 + CAST(SUBSTR(work_1,INSTR(work_1,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_1,INSTR(work_1,':')+4,2) AS INT) END),0) AS avg_sub60_secs,
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) BETWEEN 3601 AND 4500 THEN CAST(SUBSTR(work_1,1,INSTR(work_1,':')-1) AS INT)*3600 + CAST(SUBSTR(work_1,INSTR(work_1,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_1,INSTR(work_1,':')+4,2) AS INT) END),0) AS avg_sub75_secs,
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600 THEN CAST(SUBSTR(work_1,1,INSTR(work_1,':')-1) AS INT)*3600 + CAST(SUBSTR(work_1,INSTR(work_1,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_1,INSTR(work_1,':')+4,2) AS INT) END) - AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) BETWEEN 3601 AND 4500 THEN CAST(SUBSTR(work_1,1,INSTR(work_1,':')-1) AS INT)*3600 + CAST(SUBSTR(work_1,INSTR(work_1,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_1,INSTR(work_1,':')+4,2) AS INT) END),0) AS time_gap_secs
FROM hyrox_results_clean WHERE division = 'doubles' AND gender = 'male'
UNION ALL
SELECT 'Sled Push',
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600 THEN CAST(SUBSTR(work_2,1,INSTR(work_2,':')-1) AS INT)*3600 + CAST(SUBSTR(work_2,INSTR(work_2,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_2,INSTR(work_2,':')+4,2) AS INT) END),0),
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) BETWEEN 3601 AND 4500 THEN CAST(SUBSTR(work_2,1,INSTR(work_2,':')-1) AS INT)*3600 + CAST(SUBSTR(work_2,INSTR(work_2,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_2,INSTR(work_2,':')+4,2) AS INT) END),0),
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600 THEN CAST(SUBSTR(work_2,1,INSTR(work_2,':')-1) AS INT)*3600 + CAST(SUBSTR(work_2,INSTR(work_2,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_2,INSTR(work_2,':')+4,2) AS INT) END) - AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) BETWEEN 3601 AND 4500 THEN CAST(SUBSTR(work_2,1,INSTR(work_2,':')-1) AS INT)*3600 + CAST(SUBSTR(work_2,INSTR(work_2,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_2,INSTR(work_2,':')+4,2) AS INT) END),0)
FROM hyrox_results_clean WHERE division = 'doubles' AND gender = 'male'
UNION ALL
SELECT 'Sled Pull',
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600 THEN CAST(SUBSTR(work_3,1,INSTR(work_3,':')-1) AS INT)*3600 + CAST(SUBSTR(work_3,INSTR(work_3,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_3,INSTR(work_3,':')+4,2) AS INT) END),0),
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) BETWEEN 3601 AND 4500 THEN CAST(SUBSTR(work_3,1,INSTR(work_3,':')-1) AS INT)*3600 + CAST(SUBSTR(work_3,INSTR(work_3,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_3,INSTR(work_3,':')+4,2) AS INT) END),0),
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600 THEN CAST(SUBSTR(work_3,1,INSTR(work_3,':')-1) AS INT)*3600 + CAST(SUBSTR(work_3,INSTR(work_3,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_3,INSTR(work_3,':')+4,2) AS INT) END) - AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) BETWEEN 3601 AND 4500 THEN CAST(SUBSTR(work_3,1,INSTR(work_3,':')-1) AS INT)*3600 + CAST(SUBSTR(work_3,INSTR(work_3,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_3,INSTR(work_3,':')+4,2) AS INT) END),0)
FROM hyrox_results_clean WHERE division = 'doubles' AND gender = 'male'
UNION ALL
SELECT 'Burpee Broad Jump',
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600 THEN CAST(SUBSTR(work_4,1,INSTR(work_4,':')-1) AS INT)*3600 + CAST(SUBSTR(work_4,INSTR(work_4,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_4,INSTR(work_4,':')+4,2) AS INT) END),0),
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) BETWEEN 3601 AND 4500 THEN CAST(SUBSTR(work_4,1,INSTR(work_4,':')-1) AS INT)*3600 + CAST(SUBSTR(work_4,INSTR(work_4,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_4,INSTR(work_4,':')+4,2) AS INT) END),0),
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600 THEN CAST(SUBSTR(work_4,1,INSTR(work_4,':')-1) AS INT)*3600 + CAST(SUBSTR(work_4,INSTR(work_4,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_4,INSTR(work_4,':')+4,2) AS INT) END) - AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) BETWEEN 3601 AND 4500 THEN CAST(SUBSTR(work_4,1,INSTR(work_4,':')-1) AS INT)*3600 + CAST(SUBSTR(work_4,INSTR(work_4,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_4,INSTR(work_4,':')+4,2) AS INT) END),0)
FROM hyrox_results_clean WHERE division = 'doubles' AND gender = 'male'
UNION ALL
SELECT 'Rowing',
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600 THEN CAST(SUBSTR(work_5,1,INSTR(work_5,':')-1) AS INT)*3600 + CAST(SUBSTR(work_5,INSTR(work_5,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_5,INSTR(work_5,':')+4,2) AS INT) END),0),
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) BETWEEN 3601 AND 4500 THEN CAST(SUBSTR(work_5,1,INSTR(work_5,':')-1) AS INT)*3600 + CAST(SUBSTR(work_5,INSTR(work_5,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_5,INSTR(work_5,':')+4,2) AS INT) END),0),
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600 THEN CAST(SUBSTR(work_5,1,INSTR(work_5,':')-1) AS INT)*3600 + CAST(SUBSTR(work_5,INSTR(work_5,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_5,INSTR(work_5,':')+4,2) AS INT) END) - AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) BETWEEN 3601 AND 4500 THEN CAST(SUBSTR(work_5,1,INSTR(work_5,':')-1) AS INT)*3600 + CAST(SUBSTR(work_5,INSTR(work_5,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_5,INSTR(work_5,':')+4,2) AS INT) END),0)
FROM hyrox_results_clean WHERE division = 'doubles' AND gender = 'male'
UNION ALL
SELECT 'Farmers Carry',
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600 THEN CAST(SUBSTR(work_6,1,INSTR(work_6,':')-1) AS INT)*3600 + CAST(SUBSTR(work_6,INSTR(work_6,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_6,INSTR(work_6,':')+4,2) AS INT) END),0),
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) BETWEEN 3601 AND 4500 THEN CAST(SUBSTR(work_6,1,INSTR(work_6,':')-1) AS INT)*3600 + CAST(SUBSTR(work_6,INSTR(work_6,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_6,INSTR(work_6,':')+4,2) AS INT) END),0),
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600 THEN CAST(SUBSTR(work_6,1,INSTR(work_6,':')-1) AS INT)*3600 + CAST(SUBSTR(work_6,INSTR(work_6,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_6,INSTR(work_6,':')+4,2) AS INT) END) - AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) BETWEEN 3601 AND 4500 THEN CAST(SUBSTR(work_6,1,INSTR(work_6,':')-1) AS INT)*3600 + CAST(SUBSTR(work_6,INSTR(work_6,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_6,INSTR(work_6,':')+4,2) AS INT) END),0)
FROM hyrox_results_clean WHERE division = 'doubles' AND gender = 'male'
UNION ALL
SELECT 'Sandbag Lunges',
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600 THEN CAST(SUBSTR(work_7,1,INSTR(work_7,':')-1) AS INT)*3600 + CAST(SUBSTR(work_7,INSTR(work_7,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_7,INSTR(work_7,':')+4,2) AS INT) END),0),
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) BETWEEN 3601 AND 4500 THEN CAST(SUBSTR(work_7,1,INSTR(work_7,':')-1) AS INT)*3600 + CAST(SUBSTR(work_7,INSTR(work_7,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_7,INSTR(work_7,':')+4,2) AS INT) END),0),
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600 THEN CAST(SUBSTR(work_7,1,INSTR(work_7,':')-1) AS INT)*3600 + CAST(SUBSTR(work_7,INSTR(work_7,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_7,INSTR(work_7,':')+4,2) AS INT) END) - AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) BETWEEN 3601 AND 4500 THEN CAST(SUBSTR(work_7,1,INSTR(work_7,':')-1) AS INT)*3600 + CAST(SUBSTR(work_7,INSTR(work_7,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_7,INSTR(work_7,':')+4,2) AS INT) END),0)
FROM hyrox_results_clean WHERE division = 'doubles' AND gender = 'male'
UNION ALL
SELECT 'Wall Balls',
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600 THEN CAST(SUBSTR(work_8,1,INSTR(work_8,':')-1) AS INT)*3600 + CAST(SUBSTR(work_8,INSTR(work_8,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_8,INSTR(work_8,':')+4,2) AS INT) END),0),
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) BETWEEN 3601 AND 4500 THEN CAST(SUBSTR(work_8,1,INSTR(work_8,':')-1) AS INT)*3600 + CAST(SUBSTR(work_8,INSTR(work_8,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_8,INSTR(work_8,':')+4,2) AS INT) END),0),
    ROUND(AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600 THEN CAST(SUBSTR(work_8,1,INSTR(work_8,':')-1) AS INT)*3600 + CAST(SUBSTR(work_8,INSTR(work_8,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_8,INSTR(work_8,':')+4,2) AS INT) END) - AVG(CASE WHEN (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 + CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 + CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) BETWEEN 3601 AND 4500 THEN CAST(SUBSTR(work_8,1,INSTR(work_8,':')-1) AS INT)*3600 + CAST(SUBSTR(work_8,INSTR(work_8,':')+1,2) AS INT)*60 + CAST(SUBSTR(work_8,INSTR(work_8,':')+4,2) AS INT) END),0)
FROM hyrox_results_clean WHERE division = 'doubles' AND gender = 'male';


-- Q5: Which age group has the most sub 60 finishes in male doubles?
SELECT
    age_group,
    COUNT(*) AS num_sub60_teams,
    ROUND(AVG(CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)),0) AS avg_finish_secs,
    ROUND(MIN(CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 +
              CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)),0) AS best_finish_secs
FROM hyrox_results_clean
WHERE division = 'doubles'
  AND gender = 'male'
  AND total_time IS NOT NULL
  AND (CAST(SUBSTR(total_time,1,INSTR(total_time,':')-1) AS INT)*3600 +
       CAST(SUBSTR(total_time,INSTR(total_time,':')+1,2) AS INT)*60 +
       CAST(SUBSTR(total_time,INSTR(total_time,':')+4,2) AS INT)) <= 3600
GROUP BY age_group
ORDER BY num_sub60_teams DESC;