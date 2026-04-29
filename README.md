# NYC 311 Service Request Analysis and Modeling Project

## Project Description
This project analyzes NYC 311 service requests to understand complaint patterns and model the expected time to resolution.

## Data Source and Provenance
- **Source**: [NYC Open Data 311 Service Requests](https://data.cityofnewyork.us/Social-Services/311-Service-Requests-from-2020-to-Present/erm2-nwe9/)
- **Time period**: Jan 29–Mar 21, 2026 (Q1 2026)
- **Prep**: Instructor-generated random sample of 200k complaints from 15 agencies
- **Files**: 
  - `complaints.csv` (200k rows, main requests table)
  - `agencies.csv` (unique agencies lookup table)
- **S3 paths** (fill after upload):
  - `s3://cmse492-maciej21-nyc311-533267005618-us-east-1-an/raw/complaints.csv`
  - `s3://cmse492-maciej21-nyc311-533267005618-us-east-1-an/raw/agencies.csv`

## Project Structure

```
aws-nyc311-maciej21/          # Repository root
├── README.md                 # Project overview
├── DATA_DICTIONARY.md        # Column details
├── complaints.csv
├── agencies.csv
├── modeling/                 # Modeling dataset and outputs
├── notebooks/                # Data prep and modeling notebooks
├── sql/                      # Athena queries
├── notes/                    # Observations, decisions
└── reports/                  # Stakeholder outputs
```

## Data Summary
See `DATA_DICTIONARY.md` for full schema.

**Key relationships**: Join `complaints.agency = agencies.agency`

**Stakeholder question**:
- Predict the expected resolution time for complaints given factors that drive time.

## Assumptions and Known Issues
- Empty `closed_date` = open/unresolved requests
- Some `incident_zip` values are 0 or missing
- String dates need parsing in Athena/SQL
- [Add any other assumptions or issues you identified during data exploration]