
  create or replace   view MOVIELENS.DEV.stg_links
  
  
  
  
  as (
    WITH raw_links AS (
  SELECT * FROM MOVIELENS.raw.raw_links
)

SELECT
  movieId AS movie_id,
  imdbId AS imdb_id,
  tmdbId AS tmdb_id
FROM raw_links
  );

