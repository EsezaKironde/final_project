# Using multi-stage build: https://docs.docker.com/build/building/multi-stage/


######## FIRST (BASE) STAGE OF MULTI STAGE BUILD###########
FROM rocker/tidyverse AS base

#Installing pandoc (for R markdown) and pandoc dependencies (libnode-dev)
RUN apt-get update && apt-get install -y pandoc libnode-dev

#Make a working directory "/home/rstudio/project"
RUN mkdir -p /home/rstudio/project
WORKDIR /home/rstudio/project

#RENV setup
#Create directory RENV and copy all renv associated files to this folder
RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

#Change default location of renv cache to be in my project dir
RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE=renv/.cache

# Install RENV and restore package library
RUN R -e "install.packages('renv')" && R -e "renv::restore()"



########SECOND STAGE OF MULTI STAGE BUILD###########
###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######


#We are creating a second image in the same dockerfile
FROM rocker/tidyverse

# Install required dependencies
RUN apt-get update && apt-get install -y pandoc libnode-dev

#Set working directory
WORKDIR /home/rstudio/project

#Copy from base stage
COPY --from=base /home/rstudio/project .

# Install RENV
RUN R -e "install.packages('renv')"

#Copy files into container directory
COPY Makefile .
COPY cardiovascular_health_report.Rmd .

#Create some directories for my code
RUN mkdir -p code
RUN mkdir -p output
RUN mkdir -p rawdata
#Create a directory to put the final html report (to transfer over to local)
RUN mkdir -p report

#Copy my code from my computer directories into my container directories
COPY rawdata/heart_attack_risk.csv rawdata/

#Copy code directory on my laptop to code directory on Docker image
COPY code/ code/


# Set proper ownership for all files- to allow rstudio in my container to install packages in that directory
RUN chown -R rstudio:rstudio /home/rstudio/project


# Entrypoint to automatically make the report
CMD make && mv cardiovascular_health_report.html report/

