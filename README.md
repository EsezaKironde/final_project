# README for final project

------------------------------------------------------------------------

This R markdown project performs an analysis of a synthetic medical data set that focuses on cardiovascular health risk prediction
Sample size: 100 patients
Date of  analysis: 02/06/2025


### Dataset details
x: Biological sex (0 = Female, 1 = Male)
total_cholesterol: Total cholesterol level (mg/dL)
ldl: Low-Density Lipoprotein (LDL) cholesterol (mg/dL)
hdl: High-Density Lipoprotein (HDL) cholesterol (mg/dL)
systolic_bp: Systolic blood pressure (mmHg)
diastolic_bp: Diastolic blood pressure (mmHg)
smoking: Smoking status (0 = Non-Smoker, 1 = Smoker)
diabetes: Diabetes status (0 = No, 1 = Yes)
heart_attack: History of heart attack (0 = No, 1 = Yes)


------------------------------------------------------------------------

The files in this project directory (Final_Project) include:

cardiovascular_health_report.Rmd: Assembles the whole report
README.md: This file
Makefile: Automates the workflow

Directories:

rawdata/: Contains the raw data file heart_attack_risk.csv
code/: Contains the R scripts

00_clean_data.R: Cleans and processes the raw data
01_make_table1.R: Creates a descriptive statistics table
02_make_boxplot.R: Creates a visualization of cholesterol by heart attack status
03_render_report.R: Renders the full R Markdown report


output/: Contains the generated outputs including:

clean_data.rds: Processed dataset
table_one.rds: Descriptive statistics table
boxplot.png: Visualization of total cholesterol by heart attack status

  
  
------------------------------------------------------------------------

# DESCRIPTION OF WHAT EACH FILE IS DOING

## Code description

`code/00_clean_data.R`

  - Imports raw CSV from `rawdata/heart_attack_risk.csv`
  - Applies variable labels for clarity
  - Converts binary variables to strings
  - saves output as a `clean_data.rds` object in `output/` folder
  
`code/01_make_table1.R`

  - Imports clean data set
  - generates table 1 comparing variables by heart attack status
  - saves output as a `table_one.rds` object in `output/` folder

`code/02_make_boxplot.R`

  - Imports clean data set
  - Creates a box plot visualization comparing total cholesterol by heart attack status
  - saves output as a `boxplot.png` object in `output/` folder

`code/03_render_report.R`

  - renders `cardiovascular_health_report.Rmd`

`report.Rmd`

  - Main R markdown document that assembles the full analysis report
  - Reads in the cleaned data and imported analysis objects (table and visualization)
  - Presents Table 1 showing descriptive statistics by heart attack status
  - Displays and interprets the cholesterol boxplot visualization
  - Generates an HTML report with all analysis components integrated
  
------------------------------------------------------------------------


## Key Findings

 Diabetes and smoking status showed the largest effect sizes in predicting heart attack risk
