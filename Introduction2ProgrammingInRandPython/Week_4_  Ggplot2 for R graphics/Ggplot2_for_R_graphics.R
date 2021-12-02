library(readr)
library(tidyverse)
library(viridis)

# read_csv from readr package
emissions_data <- read_csv("resources/files/country_data2.csv")
milk_data <- read_csv("resources/files/CADairyProduction.csv")
mt_cars <- mtcars # internal dataset

ggplot(data = emissions_data) + # creating ggplot
  geom_histogram( aes(x = mtCO2),
                  bins = 50, # bins
                  fill = "#11FF11", # color of  a filling of a bar
                  col = "#000000" # color of the border of a bar
  ) + # add geometries
  ggtitle("Distribution of total amount of CO2 by countries") +
  xlab("Total emissions (mt CO2)") +
  ylab("Number of countries") +
  theme_classic()