-- back compat for old kwarg name
  
  begin;
    
        
            
	    
	    
            
        
    

    

    merge into MOVIELENS.DEV.fact_ratings as DBT_INTERNAL_DEST
        using MOVIELENS.DEV.fact_ratings__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.user_id, movie_id = DBT_INTERNAL_DEST.user_id, movie_id))

    
    when matched then update set
        "USER_ID" = DBT_INTERNAL_SOURCE."USER_ID","MOVIE_ID" = DBT_INTERNAL_SOURCE."MOVIE_ID","RATING" = DBT_INTERNAL_SOURCE."RATING","RATING_TIMESTAMP" = DBT_INTERNAL_SOURCE."RATING_TIMESTAMP"
    

    when not matched then insert
        ("USER_ID", "MOVIE_ID", "RATING", "RATING_TIMESTAMP")
    values
        ("USER_ID", "MOVIE_ID", "RATING", "RATING_TIMESTAMP")

;
    commit;