--Creating an external stage to connect Snowflake to Azure Storage
CREATE OR REPLACE STAGE azure_stage
URL = 'azure://snowflakedbtstorage.blob.core.windows.net/raw-data'
CREDENTIALS = (AZURE_SAS_TOKEN = 'sp=rwl&st=2025-07-21T12:39:21Z&se=2025-08-21T20:54:21Z&spr=https&sv=2024-11-04&sr=c&sig=G32UUDbyz4tpawZQyHMu%2F6Ks3wwFyqIzRK26eGt2CLE%3D')
FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);

--Loading the Movies data
CREATE OR REPLACE TABLE raw_movies (
  movieId INT,
  title STRING,
  genres STRING
);

COPY INTO raw_movies
FROM @azure_stage/movies.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

--Loading the Ratings data
CREATE OR REPLACE TABLE raw_ratings (
  userID INT,
  movieId INT,
  rating FLOAT,
  timestamp BIGINT
);

COPY INTO raw_ratings
FROM @azure_stage/ratings.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

--Loading the Tag data
CREATE OR REPLACE TABLE raw_tags (
  userID INT,
  movieId INT,
  tag STRING,
  timestamp BIGINT
);

COPY INTO raw_tags
FROM @azure_stage/tags.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

--Loading the Links data
CREATE OR REPLACE TABLE raw_links (
  movieId INT,
  imdbId BIGINT,
  tmdbId BIGINT
);

COPY INTO raw_links
FROM @azure_stage/links.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');


--Loading the genome-tags data
CREATE OR REPLACE TABLE raw_genomeTags (
  tagId INT,
  tag STRING
);

COPY INTO raw_genomeTags
FROM @azure_stage/genome-tags.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');


--Loading the genome-scores data
CREATE OR REPLACE TABLE raw_genomeScores (
  movieId INT,
  tagId INT,
  relevance FLOAT
);

COPY INTO raw_genomeScores
FROM @azure_stage/genome-scores.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');