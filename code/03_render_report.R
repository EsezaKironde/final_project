
#setwd("C:/Users/nesez/OneDrive/Desktop/Data_Science_Toolkit/Final_Project")

here::i_am("code/03_render_report.R")

#Read in the dataset
data <- readRDS(
  file = here::here("output/clean_data.rds")
)


library(rmarkdown)

report_filename <- paste0(
  "cardiovascular_report_",
  ".html"
)

#render the report
render(here::here("cardiovascular_health_report.Rmd"), output_file = report_filename)

print("I rendered the report without errors")