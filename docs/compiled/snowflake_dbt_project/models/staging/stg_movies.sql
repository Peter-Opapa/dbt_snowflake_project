WITH raw_movies AS (
    SELECT * FROM MOVIELENS.raw.raw_movies
)
SELECT 
    movieId AS movie_id,
    title,
    genres
FROM raw_movies