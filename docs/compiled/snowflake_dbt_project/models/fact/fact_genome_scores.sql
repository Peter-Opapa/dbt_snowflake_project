WITH stg_scores AS (
    SELECT * FROM MOVIELENS.DEV.stg_genome_scores
)

SELECT
    movie_id,
    tag_id,
    ROUND(relevance, 4) AS relevance_score
FROM stg_scores
WHERE relevance > 0