# README Cardiovascular Risk Prediction Project

## Overview

This R Markdown project analyzes a synthetic medical dataset to explore cardiovascular health risk prediction. The analysis includes data cleaning, descriptive statistics, visualization, and the rendering of a reproducible report.

- **Sample size**: 100 patients  
- **Date of analysis**: February 6, 2025  
- **DockerHub Image**: [`esezak/cardiovascular_image`](https://hub.docker.com/r/esezak/cardiovascular_image)
- **Github Repository**: [`Cardiovascular_Project_Github`](https://github.com/EsezaKironde/final_project)

---

## Dataset Description

The dataset contains the following variables:

| Variable         | Description                                                |
|------------------|------------------------------------------------------------|
| `x`              | Biological sex (0 = Female, 1 = Male)                       |
| `total_cholesterol` | Total cholesterol level (mg/dL)                          |
| `ldl`            | LDL cholesterol (mg/dL)                                    |
| `hdl`            | HDL cholesterol (mg/dL)                                    |
| `systolic_bp`    | Systolic blood pressure (mmHg)                             |
| `diastolic_bp`   | Diastolic blood pressure (mmHg)                            |
| `smoking`        | Smoking status (0 = Non-Smoker, 1 = Smoker)                |
| `diabetes`       | Diabetes status (0 = No, 1 = Yes)                           |
| `heart_attack`   | History of heart attack (0 = No, 1 = Yes)                  |

---


## Repository structure

```
.
├── code/                           # R scripts for each step of analysis
│   ├── 00_clean_data.R            # Cleans the raw data
│   ├── 01_make_table1.R           # Creates descriptive statistics table
│   ├── 02_make_boxplot.R          # Creates visualization of cholesterol by heart attack status
│   └── 03_render_report.R         # Renders the final report
│
├── rawdata/
│   └── heart_attack_risk.csv      # Raw input dataset
│
├── output/                         # Generated outputs
│   ├── clean_data.rds             # Processed dataset
│   ├── table_one.rds              # Descriptive statistics table
│   └── boxplot.png                # Visualization of cholesterol by heart attack status
│
├── report/                         # Directory for compiled report (created by Docker)
│
├── cardiovascular_health_report.Rmd # Main R markdown document
├── Dockerfile                      # Instructions for building Docker image
├── Makefile                        # Automates workflow
└── README.md                       # This file

```

------------------------------------------------------------------------



### Makefile Targets

| Target                  | Description                          |
|-------------------------|--------------------------------------|
| `make`                  | Runs the entire pipeline locally     |
| `make docker_report`    | macOS/Linux: Runs pipeline via Docker |
| `make docker_report_windows` | Windows: Runs pipeline via Docker  |


## Docker Instructions

### Option 1: Run the Docker Image (Recommended)

Use the pre-built Docker image on DockerHub.

#### macOS/Linux

```bash
make docker_report
# Or directly:
docker run -v "$(pwd)/report":/home/rstudio/project/report esezak/cardiovascular_image
```

#### Windows (using Git Bash)

```bash
make docker_report_windows
# Or directly:
docker run -v "/$(pwd)/report":/home/rstudio/project/report esezak/cardiovascular_image
```

---

### Option 2: Interactive RStudio (in browser)

To launch a browser-based RStudio server:

```bash
#create a password of your own
docker run -e PASSWORD="your_password" -p 8787:8787 esezak/cardiovascular_image /init
```

Then visit: `http://localhost:8787`

- **Username**: `rstudio`  
- **Password**: `your_password`

---

### Option 3: Local Development (without Docker)

Run the analysis locally:

```bash
make
```

Or run step-by-step:

```bash
Rscript code/00_clean_data.R
Rscript code/01_make_table1.R
Rscript code/02_make_boxplot.R
Rscript code/03_render_report.R
```

  
------------------------------------------------------------------------

# Description of what each file is doing

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
