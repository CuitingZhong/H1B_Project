# H1B_Project

## Projcet Objective
Classifying a H1B applicant's chances of being certified or not.

## Data
The data was obtained from the Office of Foreign Labor Certification (OFLC). The original data had ~500k rows and 4 categories : CERTIFIED,WITHDRAWN,CERTIFIED BUT WITHDRAWN,DENIED. We chose to only keep the categories CERTIFIED and DENIED for simplicity. Removed all the missing values due to time constraint.

## Challenge & Solutions
Extremely imbalanced dataset: The dataset had 99% of the rows as CERTIFIED and the remaining 1% as DENIED.   
Two possible ways to handle imbalanced data: 1.Resampling 2.Bagging/Boosting.   
Since we wanted to stay authentic to our population, we chose to not use the Resampling method.

## Data Pre-Processing
Features created : Wage, STEM/NOT STEM,j ob_groups, employment/worksite regions and waiting time between submission and decision date
Data Normalization : Normalized wage and waiting time by applying log transform

## Result
The best model in terms of minimized false negative rate is XGBoost, but we prefered to use the Random Forest model because it had the lowest error rate.
