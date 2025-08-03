
  create or replace   view MOVIELENS.DEV.stg_genome_scores
  
  
  
  
  as (
    WITH raw_genome_scores AS (
  SELECT * FROM MOVIELENS.RAW.RAW_GENOMESCORES
)

SELECT
  movieId AS movie_id,
  tagId AS tag_id,
  relevance
FROM raw_genome_scores
  );

