{
  "cells": [
   {
    "cell_type": "markdown",
    "id": "351b8704-674a-4866-96b0-a2565a2eb399",
    "metadata": {},
    "source": [
     "# NYC 311 Modeling Plan\n",
     "\n",
     "**Date created:** [4/1/2026]\n",
     "\n",
     "## Business question\n",
     "Predict [Expected resolution time for complaints given factors that drive time]\n",
     "\n",
     "## Data source\n",
     "- **S3 path:** [aws-nyc311-maciej21/modeling/modeling_data.csv]\n",
     "- **Records:** [173851]\n",
     "- **Athena query:** sql/athena_to_modeling.sql\n",
     "\n",
     "## Features (update/expand based on your query)\n",
     "- agency (string)\n",
     "- borough (string)\n",
     "- n_complaints (numeric, count of complaints)\n",
     "- avg_days_to_close (numeric, average resolution time)\n",
     "- problem (string)\n",
     "- incident_zip (numeric)\n",
     "- day_of_week (numeric, integer 1–7)\n",
     "- hour_of_day (numeric, integer 0–23)\n",
     "- same_day_complaint_volume (numeric)\n",
     "\n",
     "## Target\n",
     "- **Name:** [days_to_close]\n",
     "- **Type:** [Regression (continuous, integer value treated as numeric)]\n",
     "- **Balance/Distribution:**\n",
     "``` bash\n",
     "Target distribution (days_to_close):\n",
     "days_to_close\n",
     "0     107909\n",
     "1      17700\n",
     "...\n",
     "49         12\n",
     "Name: count, dtype: int64\n",
     "```\n",
     "\n",
     "## Modeling approach\n",
     "- **Baseline:** Logistic regression\n",
     "- **Metrics:** Accuracy, precision, recall\n",
     "- **Train/test split:** 80/20\n",
     "\n",
     "## Data quality notes\n",
     "- Possible missing values in incident_zip\n",
     "\n",
     "## Next steps\n",
     "- Train/test split\n",
     "- Fit baseline logistic regression\n",
     "- Evaluate and interpret results"
    ]
   }
  ],
  "metadata": {
   "kernelspec": {
    "display_name": "conda_python3",
    "language": "python",
    "name": "conda_python3"
   },
   "language_info": {
    "codemirror_mode": {
     "name": "ipython",
     "version": 3
    },
    "file_extension": ".py",
    "mimetype": "text/x-python",
    "name": "python",
    "nbconvert_exporter": "python",
    "pygments_lexer": "ipython3",
    "version": "3.12.12"
   }
  },
  "nbformat": 4,
  "nbformat_minor": 5
 }
