
#setwd("C:/Users/nesez/OneDrive/Desktop/Data_Science_Toolkit/Final_Project")

library(labelled)
library(gtsummary)
library(dplyr)


here::i_am("code/00_clean_data.R")


#Absolute path to data
path_to_data <- here::here("rawdata", "heart_attack_risk.csv")
data <- read.csv(path_to_data, header = TRUE)


#Clean the data
var_label(data) <- list(
  ldl = "Low-Density Lipoprotein cholesterol (mg/dL)",
  hdl = "High-Density Lipoprotein cholesterol (mg/dL)",
  age = "Age",
  sex = "Sex",
  total_cholesterol = "Cholesterol (mg/dL)",
  systolic_bp = "Systolic Blood Pressure",
  diastolic_bp = "Diastolic Blood Pressure",
  smoking = "Smoking Status",
  diabetes = "Diabetes Status"
)


data <- data |>
  mutate(
    sex = factor(ifelse(sex > 0, "Male", "Female")),
    smoking = factor(ifelse(smoking > 0, "Smoker", "Non-Smoker")),
    diabetes = factor(ifelse(diabetes > 0, "Diabetic", "Non-Diabetic")),
    heart_attack = factor(ifelse(heart_attack > 0, "Yes", "No"))
  )



#Output the clean data
saveRDS(
  data,
  file = here::here("output/clean_data.rds")
)

print("I cleaned the data without any errors")
