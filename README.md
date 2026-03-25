# hyrox-race-analysis
SQL and Tableau analysis of 28,047 HYROX male doubles results targeting sub 60 performance
# HYROX Male Doubles — Elite Performance Analysis

## Overview
Analysis of 28,047 male doubles results from HYROX Seasons 4-6 (2021-2023) 
to identify what separates sub 60 minute teams from the rest of the field. 
Personally motivated — competing in HYROX Doubles in March 2026.

## Tools Used
- **SQL** (DB Browser for SQLite) — data extraction and analysis
- **Tableau Public** — interactive dashboard
- **Excel** — data cleaning and documentation
- **GitHub** — version control and portfolio hosting

## Key Questions Analysed
1. What station times do sub 60 teams average vs slower groups?
2. How do sub 60 teams pace their 8 runs differently?
3. Where do elite teams spend their race time vs recreational athletes?
4. Which stations have the biggest time gap between sub 60 and sub 75 teams?
5. Which age group dominates sub 60 male doubles finishes?

## Key Findings
- Sub 60 teams hold run pace of 3:36-4:25/km — remarkably consistent across all 8 runs
- Sled Pull and Burpee Broad Jump are the two biggest station gaps — 32s and 30s respectively
- Elite teams spend only 3:46 in RoxZone transitions vs 7:52 for slower teams — nearly 4 minutes lost
- 30-39 age group dominates sub 60 finishes with 534 teams (60% of all sub 60 results)
- Running accounts for ~57% of total race time across ALL performance groups
- Only 5.9% of male doubles teams finish sub 60 — genuinely elite territory

## Data Cleaning Notes
- Dataset filtered to male doubles division only (15,116 of 92,374 total rows)
- Nationality column confirmed NULL for all doubles entries — a known dataset limitation
- Times stored as h:mm:ss text format — converted to seconds in SQL using SUBSTR and CAST
- Full cleaning log documented in Excel (data_cleaning_log tab)

## Dashboard
[View Interactive Tableau Dashboard](https://public.tableau.com/app/profile/navdeep.rao/viz/HYROXMaleDoublesElitePerformanceAnalysis/Dashboard1?publish=yes)

## Files
| File | Description |
|------|-------------|
| `hyrox_analysis_queries.sql` | All 5 SQL queries with comments |
| `hyrox_results_clean.csv` | Cleaned dataset (92,374 rows) |
| `q1_station_averages.csv` | Station times by performance group |
| `q2_run_pacing.csv` | Run pacing across 8 runs by group |
| `q3_time_distribution.csv` | Race time split — run vs work vs transitions |
| `q4_station_gap.csv` | Time gap per station: sub 60 vs sub 75 |
| `q5_age_group_sub60.csv` | Sub 60 finishes by age group |
