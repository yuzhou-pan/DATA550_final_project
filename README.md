# Create a Project

In RStudio, clicking `File -> New Project... -> Existing Directory` to create a project associated with the cloned files.

# Build the Docker Image

Run `make project_image`

# Generate the Final Report

- If using windows, run `make windows_report`
- If using mac, run `make mac_report`

After running this line, a docker image will be pulled from the docker hub and then run in the local machine. Building the `report.html` file was started by cleaning the original dataset and keeping only US restaurant reviews using the script `codes/data_cleaning.R` with an intermediate data file created as `output/zomato_us.rds`. Since the objective is to explore whether there is association between the aggregate rating of restaurants and the average cost for two, we created a **descriptive table** that showed medians/IQRs of the restaurant costs, ratings, and other categorical variables. A **figure** was also included to illustrate the linear relationship between the rating and the cost with the 95% confidence interval band.

# Codes

Codes responsible for the table and the figure were embedded in the `report.Rmd` file. Function `tbl_summary()` in package `gtsummary` was used to generate the table, and then `as_hux_table()` was applied to format the table more nicely in the final pdf file. Functions in `ggplot` were used to generate the figure.
