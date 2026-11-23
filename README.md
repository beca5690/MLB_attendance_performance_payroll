# MLB_attendance_performance_payroll
## Project Overview
This project investigates the relationship between MLB team payroll, on-field performance, and fan attendance from 2015 to 2024. The goal is to determine whether a team's financial investment in players or its success on the field has a stronger relationship with attendance.
Research Question
What has a greater impact on MLB attendance: team payroll or winning percentage?
Tools & Technologies
SQL (SQLite): Data cleaning, filtering, joins, and calculations
DB Browser for SQLite: Database management and querying
R: Statistical analysis, linear regression, and data visualization
Excel/CSV: Data organization and importing/exporting datasets
Data Sources
The analysis combines two primary datasets:
MLB Payroll Data (Kaggle): Annual team payroll information.
Lahman Baseball Database: Historical team statistics, including wins, losses, games played, and attendance.
The dataset covers the 2015–2024 seasons, excluding 2020 due to COVID-19 attendance restrictions.
The final dataset contains approximately 270 team-season observations.
Methodology
1. Data Cleaning and Preparation (SQL)
I used SQL to clean and combine the payroll and team performance datasets.
Key steps included:
Standardizing team abbreviations across datasets to ensure accurate joins.
Joining payroll and performance data by team and season.
Removing incomplete or irrelevant observations.
Calculating winning percentage for each team.
Calculating average attendance per home game.
Excluding the 2020 season due to pandemic-related attendance restrictions.
Key variables:
Variable
Description
year
MLB season
team_code
Standardized team abbreviation
total_payroll
Annual team payroll in USD
wins
Total regular-season wins
losses
Total regular-season losses
win_pct
Wins divided by wins plus losses
avg_attendance
Average fans per home game

2. Exploratory Data Analysis (R)
After cleaning the datasets in SQL, I imported the combined data into R to explore relationships between the variables.
I created scatterplots to visualize:
The relationship between team payroll and average attendance.
The relationship between winning percentage and average attendance.
These visualizations helped identify general trends and potential relationships before conducting regression analysis.
3. Multiple Linear Regression (R)
I used a multiple linear regression model to estimate the relationship between attendance, payroll, and team performance.
Regression model:
avg_attendance = β₀ + β₁(total_payroll) + β₂(win_pct) + ε
This model examines the association between each independent variable and attendance while holding the other variable constant.
Key Findings
The regression analysis found that both payroll and winning percentage were positively associated with average attendance.
Variable
Coefficient
P-value
Intercept
893.5
—
Total Payroll
0.00009633
< 0.001
Winning Percentage
26,390
< 0.001

Key takeaways:
Payroll: A $1 million increase in annual team payroll was associated with approximately 96 additional fans per home game, holding winning percentage constant.
Winning Percentage: A 10-percentage-point increase in winning percentage was associated with approximately 2,639 additional fans per home game, holding payroll constant.
Statistical Significance: Both independent variables were statistically significant predictors of attendance.
These findings suggest that both financial investment and on-field success are important factors associated with fan attendance.
However, because payroll and winning percentage are measured on different scales, their coefficients cannot be directly compared to determine which variable has a stronger relationship with attendance.
Limitations
Several factors may influence MLB attendance beyond payroll and team performance:
Stadium capacity and ticket availability
Local market size and population
Ticket prices
Team popularity and historical success
Stadium renovations or new stadium openings
Economic conditions
Additionally, the regression identifies statistical relationships rather than proving causation.
Future Improvements
Potential extensions of this project include:
Adding stadium capacity and market size as control variables.
Standardizing regression coefficients to compare the relative importance of payroll and winning percentage.
Incorporating additional seasons to examine long-term trends.
Developing predictive models to forecast future attendance.
Using team and year fixed effects to account for differences across franchises and seasons.
Project Skills Demonstrated
This project demonstrates experience with:
Relational databases and SQL joins
Data cleaning and transformation
Combining multiple data sources
Exploratory data analysis
Statistical modeling and hypothesis testing
Data visualization in R
Interpreting regression results and communicating findings
Conclusion
This project demonstrates how SQL and R can be used together to investigate a real-world sports business question. By combining MLB financial and performance data, I found that both payroll and winning percentage have statistically significant positive relationships with attendance.
The analysis provides a foundation for further research into the economic and competitive factors that influence fan engagement in professional baseball.
