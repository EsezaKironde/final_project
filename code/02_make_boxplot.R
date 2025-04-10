
#setwd("C:/Users/nesez/OneDrive/Desktop/Data_Science_Toolkit/Final_Project")

here::i_am("code/02_make_boxplot.R")

library(ggplot2)

#Import dataset
data <- readRDS(
  file = here::here("output/clean_data.rds")
)


#Create boxplot

boxplot <- ggplot(data, aes(x = heart_attack, y = total_cholesterol, fill = heart_attack)) +
  geom_boxplot(alpha = 0.7) +
  labs(x = "Heart Attack Status", 
       y = "Total Cholesterol (mg/dL)",
       title = "Total Cholesterol by Heart Attack Status") +
  scale_fill_brewer(palette = "Set1") +
  theme_minimal() +
  theme(legend.position = "none")


#Output files
ggsave(here::here("output/boxplot.png"),
                  plot = boxplot,
                  device = png
                  )

print("I created the boxplot without errors")
  
  

