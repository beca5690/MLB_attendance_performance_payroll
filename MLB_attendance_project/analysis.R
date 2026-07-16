# Load packages
library(DBI)
library(RSQLite)
library(tidyverse)
library(scales)

# Connect to the SQLite database
con <- dbConnect(
  SQLite(),
  "MLB_attendance_project.db"
)

# Import the final SQL table
mlb <- dbReadTable(con, "mlb_analysis")

# Exclude the COVID-affected 2020 season
mlb_clean <- mlb %>%
  filter(year != 2020)

# Calculate correlations
r_payroll <- cor(
  mlb_clean$payroll_numeric,
  mlb_clean$avg_attendance,
  use = "complete.obs"
)

r_win <- cor(
  mlb_clean$win_pct,
  mlb_clean$avg_attendance,
  use = "complete.obs"
)

# Payroll vs. attendance graph
payroll_graph <- ggplot(
  mlb_clean,
  aes(
    x = payroll_numeric / 1000000,
    y = avg_attendance
  )
) +
  geom_point(
    color = "blue",
    size = 2.3,
    alpha = 0.8
  ) +
  geom_smooth(
    method = "lm",
    color = "red",
    se = FALSE,
    linewidth = 1.3
  ) +
  annotate(
    "text",
    x = 280,
    y = 13000,
    label = paste("r =", round(r_payroll, 3)),
    size = 5
  ) +
  labs(
    title = "MLB Payroll vs. Average Attendance",
    subtitle = "2015–2024 Seasons (2020 Excluded)",
    x = "Team Payroll (Millions of Dollars)",
    y = "Average Attendance per Home Game"
  ) +
  theme_minimal(base_size = 14)

payroll_graph

# Winning percentage vs. attendance graph
winning_graph <- ggplot(
  mlb_clean,
  aes(
    x = win_pct,
    y = avg_attendance
  )
) +
  geom_point(
    color = "blue",
    size = 2.3,
    alpha = 0.8
  ) +
  geom_smooth(
    method = "lm",
    color = "red",
    se = FALSE,
    linewidth = 1.3
  ) +
  annotate(
    "text",
    x = 0.40,
    y = 47000,
    label = paste("r =", round(r_win, 3)),
    size = 5
  ) +
  scale_x_continuous(
    labels = label_percent(accuracy = 1)
  ) +
  labs(
    title = "Winning Percentage vs. Attendance",
    subtitle = "2015–2024 Seasons (2020 Excluded)",
    x = "Winning Percentage",
    y = "Average Attendance per Home Game"
  ) +
  theme_minimal(base_size = 14)

winning_graph
# Multiple regression model
model3 <- lm(
  avg_attendance ~ payroll_numeric + win_pct,
  data = mlb_clean
)
summary(model3)
# Create the images folder if it does not already exist
dir.create("images", showWarnings = FALSE)

# Save the graphs
ggsave(
  filename = "images/payroll_vs_attendance.png",
  plot = payroll_graph,
  width = 8,
  height = 6,
  dpi = 300
)

ggsave(
  filename = "images/winning_vs_attendance.png",
  plot = winning_graph,
  width = 8,
  height = 6,
  dpi = 300
)

# Disconnect from the database
dbDisconnect(con)
