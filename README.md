I. Project Title
Latin American Artist & Market Analysis: A Data-Driven Approach to Talent Scouting and Deal Evaluation

II. Project Summary
This project simulates the role of a Research & Deals Analyst for a music publishing company, focusing on the Latin American market. The objective is to create a robust, data-driven framework for identifying high-potential artists and songs by analyzing streaming, airplay, and social media data. The deliverables include a comprehensive market analysis and a deal evaluation summary for a hypothetical emerging artist. This demonstrates a strategic approach to using data to drive business decisions, directly aligning with the job's core responsibilities of identifying talent and improving deal evaluation processes.

III. Problem Statement
The music industry operates in a fast-paced and data-rich environment, but identifying truly high-potential Latin American talent and evaluating their long-term viability remains a challenge. A&R teams need to move beyond simple top-chart performance to understand an artist's growth trajectory, audience engagement, and market trends. The problem is a lack of a unified, actionable data product that combines diverse datasets (streaming, social, airplay) to provide a clear, predictive view of an artist's potential, thereby reducing risk and improving the efficiency of deal structuring.

IV. Dataset Description
To execute this project, you will use publicly available or simulated datasets. Given your experience with large-scale datasets and your Google BigQuery project ID, BigQuery will be the central data warehouse.

Streaming Data: A simulated dataset representing streaming metrics from major platforms like Spotify, Apple Music, and YouTube Music for artists in Latin America.

Fields: track_id, artist_name, country, stream_count, platform, date, album_id, isrc (International Standard Recording Code).

Airplay Data: A simulated dataset containing radio airplay information.

Fields: track_id, station_id, city, country, airplay_count, airplay_date.

Social Media Data: A simulated dataset with social engagement metrics from platforms like YouTube, Instagram, and TikTok.

Fields: artist_name, platform, follower_count, engagement_rate, video_views, comment_count, date.

Music Publishing/PRO Data: A simulated dataset detailing publishing and PRO (Performing Rights Organization) information, including a "futures' creative works analysis" to demonstrate an understanding of this crucial part of the job.

Fields: artist_name, song_id, publisher_affiliation, pro_affiliation, songwriting_credits, percent_share.

V. Methodology
Data Collection & Preparation (ETL):

Use SQL in BigQuery to ingest and combine the disparate datasets.

Clean and transform the data, handling missing values, standardizing artist names, and creating a unified schema. This will demonstrate your expertise in 

SAP data structures and ETL (as mentioned on your resume).




Exploratory Data Analysis (EDA):

Query the integrated dataset to identify top-performing artists and songs in key LatAm markets (e.g., Mexico, Brazil, Argentina).

Perform trend analysis to identify emerging artists and genres with significant growth over the past 6-12 months.

Predictive Modeling & Analysis:

Develop a simple predictive model using Python (e.g., a time-series model) to forecast an artist's future streaming performance based on their historical growth trajectory.

Analyze the correlation between social media engagement, airplay, and streaming success to understand the most effective growth channels.

Conduct a competitive benchmarking analysis of emerging artists to identify key performance gaps and opportunities.


Deal Evaluation Framework:

Create a simple scoring model in SQL to rank artists based on a composite score derived from their streaming growth, social engagement, and airplay. This will be the "futures' creative works analysis model" mentioned in the job description.

Develop a financial summary for a mock deal, pulling in simulated publishing and PRO data to demonstrate an understanding of client evaluation and deal structuring.




VI. Key Features & Metrics
Features: artist_growth_rate (streaming), social_engagement_score, airplay_frequency, cross-platform_reach, demographic_data (simulated).

Metrics:

Growth Potential: Measured by a composite index of streaming and social media growth over time.

Audience Engagement: A ratio of social media interactions to follower count.

Market Penetration: The number of unique countries/cities where a song is gaining traction.

Deal Viability Score: A calculated score used to rank artists for potential deal consideration.

VII. Visualization & Dashboard Outputs
You will use Google Data Studio (or Tableau as an alternative, per your resume) to create a series of dashboards that showcase your data visualization and storytelling abilities.

LatAm Music Market Dashboard: An executive-level dashboard showing top artists, emerging trends, and genre performance across key Latin American countries.

Artist Deep-Dive Dashboard: A detailed, single-artist view that shows streaming history, social media metrics, and a growth forecast.

Deal Pipeline Dashboard: A tool for A&R teams to use, where they can input an artist's name and see their "Deal Viability Score," key metrics, and competitive benchmarks.

VIII. Project Deliverables
BigQuery SQL Script: A well-documented script with the SQL queries used for data cleaning, transformation, and creating the scoring model.

Python Notebook: A Jupyter notebook or Google Colab file with the Python code for data analysis, trend identification, and simple forecasting.

Interactive Dashboard: A link to the Google Data Studio dashboard (or screenshots if using Tableau).

Executive Summary PDF: A 1-2 page document summarizing the project, the key findings, and strategic recommendations, presented as if for a business or A&R team. This will demonstrate your ability to deliver actionable insights.


IX. Strategic Recommendations
Prioritize Artists based on Growth Trajectory: Shift focus from simply signing the biggest artists to scouting those with the highest growth potential score, as identified by the predictive model.

Expand Deal Flow in High-Growth Sub-Genres: Recommend dedicating A&R resources to sub-genres and regions that the analysis identifies as having significant, untapped growth.

Leverage Cross-Platform Insights: Advise business and A&R teams to use the insights from the social media analysis to identify promotional opportunities and measure audience engagement beyond just streaming numbers.


Improve Deal Efficiency: By automating the initial artist scoring, the team can reduce the time spent on manual research and focus on the most promising candidates, thereby improving the overall deal flow.

The tools you have access to will be sufficient to create a compelling project. BigQuery is excellent for handling large datasets, and Google Data Studio integrates seamlessly with it for creating powerful visualizations. The project directly demonstrates your ability to analyze large datasets, use SQL and Python, build dashboards, and provide actionable insights—all key requirements for the role.
