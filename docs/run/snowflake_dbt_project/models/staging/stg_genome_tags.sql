
  create or replace   view MOVIELENS.DEV.stg_genome_tags
  
  
  
  
  as (
    WITH raw_genome_tags AS (
  SELECT * FROM MOVIELENS.RAW.RAW_GENOMETAGS
)

SELECT
  tagId AS tag_id,
  tag
FROM raw_genome_tags
  );

