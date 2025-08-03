
  create or replace   view MOVIELENS.DEV.stg_movies
  
  
  
  
  as (
    WITH raw_movies AS (
    SELECT * FROM MOVIELENS.RAW.RAW_MOVIES
)
SELECT 
    movieId AS movie_id,
    title,
    genres
FROM raw_movies
  );

