{{
  config(
    on_schema_change='fail',
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='user_id, movie_id'
  )
}}

WITH stg_ratings AS (
  SELECT * FROM {{ ref('stg_ratings') }}
)

SELECT
  user_id,
  movie_id,
  rating,
  rating_timestamp
FROM stg_ratings
WHERE rating IS NOT NULL
