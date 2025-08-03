# 🎬 MovieLens Data Pipeline - dbt + Snowflake

[![dbt docs](https://img.shields.io/badge/dbt-docs-orange.svg)](https://peter-opapa.github.io/dbt_snowflake_project/)
[![GitHub](https://img.shields.io/github/license/Peter-Opapa/dbt_snowflake_project)](LICENSE)

A comprehensive data transformation pipeline that processes the MovieLens 20M dataset to create analytics-ready data models for movie recommendation systems and user behavior analysis.
Explore the Full Documentations here: [Documentation](https://peter-opapa.github.io/dbt_snowflake_project/)

![Project Architecture](https://github.com/Peter-Opapa/dbt_snowflake_project/blob/main/images/project_architecture.png)

## 🏗️ Data Pipeline Architecture

This project demonstrates a modern ELT (Extract, Load, Transform) pipeline:

1. **Data Extraction**: MovieLens 20M dataset stored in **Azure Data Lake Storage Gen2**
2. **Data Loading**: Raw data loaded from ADLS Gen2 into **Snowflake** data warehouse
3. **Data Transformation**: **dbt** connects to Snowflake to perform data modeling and transformations
4. **Documentation**: Auto-generated data lineage and model documentation

The pipeline transforms raw movie data into a dimensional model optimized for analytics and machine learning applications.

## 📊 Data Transformation Models

This project implements a layered data architecture with staging, dimensional, and fact models:

### Staging Layer (`models/staging/`)
Raw data from ADLS Gen2 is cleaned and standardized:
- `stg_movies` - Movie metadata with standardized formatting
- `stg_ratings` - User rating events with timestamp normalization
- `stg_tags` - User-generated movie tags with text cleaning
- `stg_genome_tags` - Machine-generated tag definitions
- `stg_genome_scores` - Tag relevance scores for content-based filtering
- `stg_links` - External movie database identifiers

### Dimension Layer (`models/dim/`)
Business entities modeled for analytical queries:
- `dim_movies` - Comprehensive movie dimension with genres and metadata
- `dim_users` - User profiles derived from rating patterns
- `dim_genome_tags` - Tag taxonomy for recommendation algorithms
- `dim_movies_with_tags` - Movies enriched with relevant genome tags

### Fact Layer (`models/fact/`)
Transactional data optimized for analytics:
- `fact_ratings` - User rating events (incremental loading for performance)
- `fact_genome_scores` - Movie-tag relevance matrix for ML features

### Historical Tracking (`snapshots/`)
Change data capture for evolving dimensions:
- `snap_tags` - SCD Type 2 tracking of tag evolution over time

## 🎯 Project Capabilities

This data pipeline enables several analytical use cases:

### Movie Recommendation Systems
- **Content-based filtering**: Using genome tag relevance scores to recommend similar movies
- **Collaborative filtering**: Leveraging user rating patterns and behavioral data
- **Hybrid approaches**: Combining content and collaborative signals

### Business Intelligence & Analytics
- **User behavior analysis**: Rating patterns, preferences, and engagement metrics
- **Content performance**: Movie popularity trends and genre analysis
- **Tag effectiveness**: Understanding which descriptive tags resonate with users

### Data Quality & Governance
- **Automated testing**: 15+ data quality tests ensuring pipeline reliability
- **Historical tracking**: SCD Type 2 snapshots preserve data lineage
- **Documentation**: Auto-generated data dictionary and model relationships

### Performance Optimization
- **Incremental processing**: Large fact tables updated efficiently
- **Materialization strategies**: Views, tables, and ephemeral models optimized by use case
- **Modular design**: Independent model layers enable selective rebuilds

## 📈 Technical Implementation

### Data Pipeline Features
- **ELT Architecture**: Raw data loaded from ADLS Gen2 to Snowflake, then transformed with dbt
- **Incremental Models**: Efficient processing of 20M+ rating records
- **SCD Type 2**: Historical dimension tracking for evolving data
- **Modular Design**: Layered architecture with clear data lineage

### Data Quality Assurance
- **Automated Testing**: Custom and generic tests across all model layers
- **Business Rule Validation**: Ensures data consistency and logical constraints
- **Freshness Monitoring**: Validates data pipeline execution timing
- **Documentation Coverage**: Comprehensive model and column descriptions

### Infrastructure & DevOps
- **Version Control**: Git-based workflow for collaborative development
- **CI/CD Integration**: Automated testing and documentation deployment
- **Environment Management**: Separate dev/prod configurations
- **Monitoring**: dbt test results and model performance tracking

## 🧪 Data Quality Framework

The pipeline implements comprehensive data validation:

- **Schema Tests**: Uniqueness, not-null, and referential integrity checks
- **Custom Business Logic**: Domain-specific validation rules (e.g., rating ranges, timestamp consistency)
- **Data Freshness**: Monitoring for timely data delivery from ADLS Gen2
- **Cross-Model Validation**: Ensuring consistency across dimensional and fact tables

## 📚 Documentation & Lineage

Explore the interactive documentation: [dbt docs](https://peter-opapa.github.io/dbt_snowflake_project/)

The documentation provides:
- **Model Lineage**: Visual representation of data flow and dependencies
- **Column-Level Documentation**: Detailed descriptions of all data attributes
- **Test Coverage**: Overview of data quality validations
- **SQL Compilation**: View the actual SQL generated for each model

## 📁 Project Structure

```
dbt_snowflake_project/
├── snowflake_dbt_project/          # Main dbt project
│   ├── models/
│   │   ├── staging/                # Raw data cleaning
│   │   ├── dim/                    # Dimension tables
│   │   └── fact/                   # Fact tables
│   ├── snapshots/                  # SCD Type 2 tables
│   ├── tests/                      # Custom tests
│   ├── macros/                     # Reusable SQL
│   └── dbt_project.yml            # Project configuration
├── ml-20m/                         # Source data files
├── requirements.txt                # Python dependencies
└── README.md                       # This file
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [MovieLens Dataset](https://grouplens.org/datasets/movielens/) by GroupLens Research
- [dbt](https://www.getdbt.com/) for the amazing transformation framework
- [Snowflake](https://www.snowflake.com/) for the cloud data platform



