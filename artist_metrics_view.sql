-- Create a unified view to serve as the single source of truth for the project.

-- Ensure you have the correct project and dataset.
-- REPLACE `driiiportfolio` WITH YOUR PROJECT ID
CREATE OR REPLACE VIEW driiiportfolio.kobalt_latam.artist_metrics_view AS
WITH
  -- 1. Daily streaming & airplay metrics per song/artist
  daily_performance AS (
    SELECT
      T1.date,
      T1.artist_name,
      T1.song_name,
      T1.country,
      SUM(T1.stream_count) AS total_daily_streams,
      SUM(T2.airplay_count) AS total_daily_airplays
    FROM
      `driiiportfolio.kobalt_latam.streaming_data` AS T1
    LEFT JOIN
      `driiiportfolio.kobalt_latam.airplay_data` AS T2
      ON T1.track_id = T2.track_id AND T1.date = T2.airplay_date
    GROUP BY
      1, 2, 3, 4
  ),

  -- 2. Weekly aggregated metrics to calculate growth rates
  weekly_performance AS (
    SELECT
      EXTRACT(WEEK FROM date) AS week_of_year,
      EXTRACT(YEAR FROM date) AS year,
      artist_name,
      country,
      SUM(total_daily_streams) AS weekly_streams,
      SUM(total_daily_airplays) AS weekly_airplays
    FROM
      daily_performance
    GROUP BY
      1, 2, 3, 4
  ),

  -- 3. Social media metrics, averaged weekly
  social_metrics AS (
    SELECT
      EXTRACT(WEEK FROM date) AS week_of_year,
      EXTRACT(YEAR FROM date) AS year,
      artist_name,
      AVG(follower_count) AS avg_weekly_followers,
      AVG(engagement_rate) AS avg_weekly_engagement_rate,
      AVG(video_views) AS avg_weekly_video_views
    FROM
      `driiiportfolio.kobalt_latam.social_media_data`
    GROUP BY
      1, 2, 3
  ),

  -- 4. Calculate weekly growth rates for artists
  growth_rates AS (
    SELECT
      week_of_year,
      year,
      artist_name,
      weekly_streams,
      weekly_airplays,
      -- Calculate percentage growth in streams from the previous week
      (weekly_streams - LAG(weekly_streams, 1, 0) OVER (PARTITION BY artist_name ORDER BY year, week_of_year)) / LAG(weekly_streams, 1, 1) OVER (PARTITION BY artist_name ORDER BY year, week_of_year) AS stream_growth_rate,
      -- Calculate percentage growth in airplays from the previous week
      (weekly_airplays - LAG(weekly_airplays, 1, 0) OVER (PARTITION BY artist_name ORDER BY year, week_of_year)) / LAG(weekly_airplays, 1, 1) OVER (PARTITION BY artist_name ORDER BY year, week_of_year) AS airplay_growth_rate
    FROM
      weekly_performance
  )

-- Final SELECT statement to join all the data and create the unified view
SELECT
  gr.week_of_year,
  gr.year,
  gr.artist_name,
  pub.publisher_affiliation,
  pub.pro_affiliation,
  gr.weekly_streams,
  gr.weekly_airplays,
  sm.avg_weekly_followers,
  sm.avg_weekly_engagement_rate,
  sm.avg_weekly_video_views,
  gr.stream_growth_rate,
  gr.airplay_growth_rate,
  (gr.stream_growth_rate * 0.5 + sm.avg_weekly_engagement_rate * 0.3 + gr.airplay_growth_rate * 0.2) AS composite_growth_score
FROM
  growth_rates AS gr
LEFT JOIN
  social_metrics AS sm
  ON gr.artist_name = sm.artist_name AND gr.week_of_year = sm.week_of_year AND gr.year = sm.year
LEFT JOIN
  `driiiportfolio.kobalt_latam.publishing_data` AS pub
  ON gr.artist_name = pub.artist_name;
