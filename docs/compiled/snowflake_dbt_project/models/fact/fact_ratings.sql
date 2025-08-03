

WITH stg_ratings AS (
  SELECT * FROM MOVIELENS.DEV.stg_ratings
)

SELECT
  user_id,
  movie_id,
  rating,
  rating_timestamp
FROM stg_ratings
WHERE rating IS NOT NULL