
#setwd("C:/Users/nesez/OneDrive/Desktop/Data_Science_Toolkit/Final_Project")

here::i_am("code/01_make_table1.R")

#Read in the dataset
data <- readRDS(
  file = here::here("output/clean_data.rds")
)

library(gtsummary)
library(dplyr)


table_one <- data |> 
  select("age", "sex", "total_cholesterol", "ldl", "hdl", "systolic_bp", "diastolic_bp", "smoking", "diabetes", "heart_attack") |>
  tbl_summary(by = heart_attack) |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "Heart Attack Status") |>
  add_overall() |>
  add_p()

#Save table

saveRDS(
  table_one,
  file = here::here("output/table_one.rds")
  
)

print("I created the table without errors")

