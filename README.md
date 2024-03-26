The README is well-formatted using markdown and makes clear: (1) how to generate the final report and (2) which pieces of code create the table and figure.

# Generate the Final Report

We could run `make report.pdf` in the terminal to generate the final report. It started by cleaning the original dataset and keeping only US restaurant reviews using the script `codes/data_cleaning.R` with an intermediate data file created as "output/zomato_us.rds". Since the objective is to explore whether there is association between the aggregate rating of restaurants and the average cost for two, we created a **descriptive table** that showed medians/IQRs of the restaurant costs, ratings, and other categorical variables. A **figure** was also included to illustrate the linear relationship between the rating and the cost with the 95% confidence interval band.

# Codes

Codes responsible for the table and the figure were embedded in the `report.Rmd` file. Function `tbl_summary()` in package `gtsummary` was used to generate the table, and then `as_hux_table()` was applied to format the table more nicely in the final pdf file. Functions in `ggplot` were used to generate the figure.
