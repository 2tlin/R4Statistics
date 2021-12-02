library(readr)
library(tidyverse)
library(viridis)

# read_csv from readr package
emissions_data <- read_csv("resources/files/country_data2.csv")
milk_data <- read_csv("resources/files/CADairyProduction.csv")
mt_cars <- mtcars # internal datasetv

ggplot(data = emissions_data) +
  geom_boxplot(aes(y = GDP)) +
  scale_y_log10()

# ggplot2,comes with one type of plot that can be thought of as a combination of a boxplot and a density plot
# / histogram - the violin plot. ggplot2 has geom_violin built-in for this purpose:
ggplot(data = emissions_data) +
  geom_violin(aes(y = GDP, x = 0)) +
  scale_y_log10()

# Please note that geom_violin requires x to be mapped, so I force it to 0. Now let’s combine box and violin
# plots:
ggplot(data = emissions_data)+
  geom_violin(aes(x = 0, y = GDP))+
  geom_boxplot(aes(y = GDP), width = 0.2)+
  scale_y_log10()+
  theme_light()+
  ggtitle("GDP distribution")+
  ylab("GDP")+
  xlab("")+
  theme(axis.ticks.x = element_blank())+
  theme(axis.text.x = element_blank())

# We can use the x mapping to create boxplots for different groups. Let’s recreate our cars plot, but this time
# with violin plots and ggplot2:
ggplot(data = mt_cars)+
  geom_violin(aes(x = factor(cyl), y = mpg))+
  geom_boxplot(aes(x = factor(cyl), y = mpg), width = 0.15)+
  theme_light()+
  ggtitle("Fuel consuption vs number of cylinders")+
  ylab("Fuel mileage")+
  xlab("Number of cylinders")