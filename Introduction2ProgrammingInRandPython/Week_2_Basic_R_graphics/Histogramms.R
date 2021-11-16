install.packages(tidyverse)
library(tidyverse)

install.packages(readr)
library(readr)

# read_csv from readr package
emissions_data <- read_csv("resources/files/country_data2.csv")
milk_data <- read_csv("resources/files/CADairyProduction.csv")

# Histagram is a way to represent a distribution of a one dimensional variable.
hist(emissions_data$mtCO2,
     ylab = "Number of countries",
     xlab = "Total emissions in mt CO2",
     main = "Distribution of total emission amount by countries"
)

# 'breaks' parameter allows us to control the amount of bins on histogram
hist(emissions_data$mtCO2,
     breaks = 50, # amount of bins
     ylab = "Number of countries",
     xlab = "Total emissions in mt CO2",
     main = "Distribution of total emission amount by countries"
)

# col <- for color, border <- for border color
hist(emissions_data$mtCO2,
     breaks = 50, # amount of bins
     ylab = "Number of countries",
     xlab = "Total emissions in mt CO2",
     main = "Distribution of total emission amount by countries",
     col = "cadetBlue", # R built-in colors
     border = "#43B02A", #HSE green, CMYK (70,0,100,0)
)