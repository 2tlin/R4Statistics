library(readr)
library(tidyverse)
library(viridis)

# read_csv from readr package
emissions_data <- read_csv("resources/files/country_data2.csv")
milk_data <- read_csv("resources/files/CADairyProduction.csv")
mt_cars <- mtcars # internal datasetv

ggplot(data = emissions_data) +
  geom_point(aes(x = GDP, y = mtCO2), col = "#003399")
# Like with basic graphics, we can see that the points are somewhat bunched up in the lower-left corner.
# This is because the scales of our values are very different. One way to visualize such data is to use log
# transformation on one of both of the axes. To do this, lets add the scale_y_log10() and scale_x_log10()
# to our plot.
ggplot(data = emissions_data) +
  geom_point(aes(x = GDP, y = mtCO2), col = "#003399") +
  scale_y_log10() + # make Y as a logarithmic scale
  scale_x_log10() + # make X as a logarithmic scale
  ggtitle("GDP vs. CO2 emissions\n log-log scale") +
  xlab("GDP") +
  ylab("mtCO2") +
  theme_light()