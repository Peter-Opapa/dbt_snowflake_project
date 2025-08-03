
  
    

create or replace transient table MOVIELENS.DEV.dim_movies
    
    
    
    as (WITH stg_movies AS (
    SELECT * FROM MOVIELENS.DEV.stg_movies
)
SELECT
    movie_id,
    INITCAP(TRIM(title)) AS movie_title,
    SPLIT(genres, '|') AS genre_array,
    genres
FROM stg_movies
    )
;


  