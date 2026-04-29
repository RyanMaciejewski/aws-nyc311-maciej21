# Notebook Breakdown

## Business Question & Answer
The modeling plan asks: predict the expected resolution time for complaints. The clearest takeaway is that `days_to_close` is strongly skewed toward very fast closures. In the modeling data, 62.07% of complaints close on day 0, 10.18% close on day 1, and 7.10% close on day 2. After that, the share drops off quickly, so the practical expectation for most complaints is same-day or next-day resolution, with a long tail of slower cases.

## Data prep and validation
- The modeling dataset used for training has 173,851 rows and 8 columns.
- The target, `days_to_close`, is highly skewed: 62.07% of complaints close on day 0, and the frequency drops quickly after that.

## sklearn modeling workflow
- The `modeling_train_and_eval.ipynb` notebook uses `agency`, `borough`, and `problem` as categorical predictors and `incident_zip`, `day_of_week`, `hour_of_day`, and `same_day_complaint_volume` as numeric predictors.
- After dropping missing rows, the train/test split is 137,668 / 34,418.
- One-hot encoding expands the feature matrix to 161 encoded features.
- The random forest regressor gives MAE 1.721, RMSE 3.975, and R² 0.413.

## SageMaker Linear Learner workflow
- The SageMaker notebook uses the same regression target, but formats the data for Linear Learner with the label in the first column and no header row.
- After encoding, the train/test split is 139,080 / 34,771 and the feature matrix has 167 columns.
- Linear Learner beats the naive mean baseline: MAE 1.94 vs 2.79, RMSE 4.08 vs 5.15, and R² 0.3717 vs roughly 0 for the baseline.

## Takeaways
- Categorical variables carry useful signal, but the target remains noisy because most complaints resolve immediately while a small share take much longer.
- The random forest regressor performs better than the linear model, likely because it can capture nonlinear relationships and interactions between features. However, the linear model still provides a significant improvement over the baseline.

## Future Plans
- Try a Poisson-style model or another count-aware approach for `days_to_close`.
- Handle missing or unusual `incident_zip` values more carefully before retraining.
- Compare feature importance or coefficients across models to explain which complaint factors matter most.