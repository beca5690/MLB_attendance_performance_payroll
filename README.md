
# MLB Attendance vs. Payroll Analysis

## Project Overview

This project analyzes the relationship between MLB team payroll, on-field performance, and fan attendance from 2015 to 2024.

The primary research question is:

**What has a stronger relationship with MLB attendance: team payroll or winning percentage?**

Using SQL for data cleaning and preparation and R for statistical analysis, I combined historical MLB datasets to examine how financial investment and team performance relate to fan attendance.

## Tools & Technologies

- **SQL (SQLite):** Data cleaning, joins, filtering, and calculations
- **DB Browser for SQLite:** Database management
- **R:** Statistical analysis, regression modeling, and data visualization
- **Excel/CSV:** Data organization and file management

## Data Sources

The project combines two primary datasets:

1. **MLB Payroll Data (Kaggle):** Annual payroll information for MLB teams.
2. **Lahman Baseball Database:** Historical team statistics, including wins, losses, home games, and attendance.

The analysis covers all 30 MLB teams from 2015 to 2024, excluding the 2020 season due to COVID-19 attendance restrictions.

**Final dataset:** Approximately 270 team-season observations.

## Methodology

### 1. Data Cleaning and Preparation (SQL)

I used SQL to clean, organize, and combine the payroll and team performance datasets.

Key steps included:

- Standardizing team abbreviations across datasets.
- Joining payroll and performance data using team codes and seasons.
- Filtering incomplete or irrelevant observations.
- Calculating winning percentage for each team.
- Calculating average attendance per home game.
- Excluding the 2020 season due to pandemic-related attendance restrictions.

**Key Variables:**

| Variable | Description |
|----------|-------------|
| year | MLB season |
| team_code | Standardized team abbreviation |
| total_payroll | Annual team payroll in USD |
| wins | Total regular-season wins |
| losses | Total regular-season losses |
| win_pct | Wins / (Wins + Losses) |
| avg_attendance | Total attendance / Home games |

### 2. Exploratory Data Analysis (R)

After preparing the dataset in SQL, I imported the data into R to investigate relationships between payroll, winning percentage, and attendance.

I created scatterplots to visualize:

- Team payroll vs. average attendance
- Winning percentage vs. average attendance

These visualizations helped identify trends and relationships before conducting regression analysis.

### 3. Multiple Linear Regression (R)

I used multiple linear regression to estimate the relationship between team payroll, winning percentage, and average attendance.

**Regression Model:**

```text
avg_attendance = β0 + β1(total_payroll) + β2(win_pct) + ε
```

This model estimates the relationship between each independent variable and attendance while holding the other variable constant.

## Results

The regression analysis found that both payroll and winning percentage had statistically significant positive relationships with average attendance.

| Variable | Coefficient | P-value |
|----------|-------------|---------|
| Intercept | 893.5 | — |
| Total Payroll | 0.00009633 | < 0.001 |
| Winning Percentage | 26,390 | < 0.001 |

### Key Findings

**1. Team Payroll**
- A $1 million increase in annual payroll was associated with approximately 96 additional fans per home game, holding winning percentage constant.
- Payroll was a statistically significant predictor of attendance.

**2. Winning Percentage**
- A 10-percentage-point increase in winning percentage was associated with approximately 2,639 additional fans per home game, holding payroll constant.
- Winning percentage was also statistically significant.

**3. Overall Findings**
- Both payroll and winning percentage were positively associated with attendance.
- Both variables were statistically significant in the regression model.
- Because the variables use different measurement scales, their coefficients cannot be directly compared to determine which has a stronger relationship with attendance.

## Data Visualizations

### Payroll vs. Average Attendance

This scatterplot examines the relationship between annual team payroll and average home-game attendance.

![Payroll vs. Attendance](visualizations/payroll_vs_attendance.png)

### Winning Percentage vs. Average Attendance

This scatterplot examines the relationship between team performance and average home-game attendance.

![Winning Percentage vs. Attendance](visualizations/win_pct_vs_attendance.png)

## Limitations

Several factors beyond payroll and winning percentage may influence attendance:

- Stadium capacity
- Local market size and population
- Ticket prices
- Team popularity and historical success
- Stadium renovations and new stadium openings
- Regional economic conditions

Additionally, the regression identifies statistical associations rather than establishing causal relationships.

## Future Improvements

Potential extensions of this project include:

- Adding stadium capacity and market size as control variables.
- Standardizing regression coefficients to compare the relative importance of payroll and winning percentage.
- Incorporating additional seasons.
- Developing predictive models to forecast attendance.
- Using team and year fixed effects to control for differences across franchises and seasons.

## Skills Demonstrated

- SQL querying and relational database management
- Data cleaning and transformation
- Combining multiple datasets
- Exploratory data analysis
- Multiple linear regression
- Statistical hypothesis testing
- Data visualization using R
- Interpretation and communication of analytical findings

## Conclusion

This project demonstrates how SQL and R can be combined to analyze a real-world sports business question.

The results indicate that both team payroll and winning percentage have statistically significant positive relationships with MLB attendance.

The analysis provides a foundation for further investigation into the financial, competitive, and economic factors that influence fan engagement in professional baseball.
