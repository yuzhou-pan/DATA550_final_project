report.html: report.Rmd output/zomato_us.rds codes/data_cleaning.R codes/render_report.R
	Rscript codes/render_report.R

output/zomato_us.rds: codes/data_cleaning.R
	Rscript codes/data_cleaning.R

.PHONY: clean install
clean: 
	rm -f output/zomato_us.rds && rm -f report.html
install:
	R -e "renv::restore()"
	
# docker-associated rules
PROJECTFILES = report.Rmd codes/data_cleaning.R codes/render_report.R
RENVFILES = renv.lock renv/activate.R renv/settings.json

project_image: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t project_image .
	touch $@
	
windows_report: 
	docker pull yuzhoupan/project_image && docker run -v "/$$(pwd)/report":/project/report yuzhoupan/project_image
	
mac_report: 
	docker pull yuzhoupan/project_image && docker run -v "$$(pwd)/report":/project/report yuzhoupan/project_image