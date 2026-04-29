# NYC 311 Modeling Plan

**Date created:** 4/1/2026

## Business question
Predict the expected resolution time for complaints given factors that drive time.

## Data source
- **S3 path:** `s3://cmse492-maciej21-nyc311-533267005618-us-east-1-an/modeling/modeling_data.csv`
- **Records:** 173,851
- **Athena query:** `sql/athena_to_modeling.sql`

## Features
- **agency** (string)
- **borough** (string)
- **n_complaints** (numeric)
- **avg_days_to_close** (numeric)
- **problem** (string)
- **incident_zip** (numeric)
- **day_of_week** (numeric, 1–7)
- **hour_of_day** (numeric, 0–23)
- **same_day_complaint_volume** (numeric)

## Target
- **Name:** `days_to_close`
- **Type:** Regression (continuous, integer value treated as numeric)
- **Distribution:**

| days_to_close | count | % |
| :--- | :--- | :--- |
| 0 | 107,909 | 62.07% |
| 1 | 17,700 | 10.18% |
| 2 | 12,346 | 7.10% |
| 3 | 8,184 | 4.71% |
| 4 | 5,827 | 3.35% |

*(Note: 62% of complaints are resolved on day 0, indicating a highly skewed distribution.)*

## Modeling approach
- **Baseline:** Linear Regression (or Poisson Regression given the count-based nature of days)
- **Metrics:** Mean Absolute Error (MAE), RMSE
- **Train/test split:** 80/20

## Data quality notes
- **Missing values:** `incident_zip` has 172,086 records compared to the total 173,851. Need to handle these ~1,700 missing values.

## Next steps
1. Perform Train/Test split.
2. Fit baseline model.
3. Evaluate results and interpret coefficients.
