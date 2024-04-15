report.pdf: report.Rmd output/zomato_us.rds codes/data_cleaning.R codes/render_report.R
	Rscript codes/render_report.R

output/zomato_us.rds: codes/data_cleaning.R
	Rscript codes/data_cleaning.R

.PHONY: clean install
clean: 
	rm -f output/zomato_us.rds
install:
	R -e "renv::restore()"