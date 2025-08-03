-- Test that no relevance scores are less than or equal to 0
SELECT
    movie_id,
    tag_id,
    relevance_score
FROM MOVIELENS.DEV.fact_genome_scores
WHERE relevance_score <= 0