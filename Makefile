##cardiovascular_health_report.html: This is the final report
cardiovascular_health_report.html: code/03_render_report.R cardiovascular_health_report.Rmd \
descriptive_analysis
	Rscript code/03_render_report.R

##output/clean_data/rds: This is the cleaned data object
output/clean_data.rds: code/00_clean_data.R rawdata/heart_attack_risk.csv
	Rscript code/00_clean_data.R


##output/table_one.rds: This is the table1 summary stats
output/table_one.rds: code/01_make_table1.R output/clean_data.rds
	Rscript code/01_make_table1.R


##output/boxplot.png: This is the boxplot output
output/boxplot.png: code/02_make_boxplot.R output/clean_data.rds
	Rscript code/02_make_boxplot.R


.PHONY: descriptive_analysis
descriptive_analysis: output/table_one.rds output/boxplot.png

.PHONY: clean
clean: 
	rm -f output/*.rds 
	rm -f output/*.png 
	rm -f output/*.html