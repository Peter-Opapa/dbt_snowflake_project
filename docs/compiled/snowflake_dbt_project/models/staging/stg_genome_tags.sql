WITH raw_genome_tags AS (
  SELECT * FROM MOVIELENS.raw.raw_genometags
)

SELECT
  tagId AS tag_id,
  tag
FROM raw_genome_tags