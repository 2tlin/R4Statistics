library(readr)
library(tidyverse)
library(viridis)

# read_csv from readr package
emissions_data <- read_csv("resources/files/country_data2.csv")
milk_data <- read_csv("resources/files/CADairyProduction.csv")
mt_cars <- mtcars # internal datasetv

ggplot(data = mt_cars) +
  geom_bar(aes(x=factor(carb)), stat="count") # factor - convert to descrete value

# We can, however, show raw numbers with ggplot2. Let’s make a barplot of 10 top CO2 emitters in our
# dataset. We will pass the stat="identity" parameter to the geom:

top_emitters <- emissions_data |> arrange(desc(mtCO2)) |> head(10)

ggplot(data = top_emitters) +
  # This function "reorder" here is used to reorder the columns so that they go in the order from largest to smallest
  # It recorders the x values (country names) so that their corresponding mtco2 values are in descending order
  # This function here is needed because ggplot treats the names as a factor variable and based the column positions based on the order of the factors
  geom_bar(aes(x = reorder(country, -mtCO2), y = mtCO2), #
  stat = "identity", col = "#003399", fill = "#003399") +
  theme_light() +
  ggtitle("Total amount of CO2 emissions") +
  ylab("CO2 emissions") +
  xlab("") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


# As our x-axis, we are giving to it the names of our countries that are ordered according to the amount of emissions
# they make in a descending order. In ggplot, even strings, even characters, even factors, discrete variables,
# they can be names, they can be used as the axis values. ggplot will then internally work on how to arrange them properly.
# We give to it these names of countries in the proper order, and as a y, we give to it the amount of CO2 each country has released into the atmosphere.
# As you can see, we are now giving it two mappings instead of one, instead of just the mapping into x.
# Since we are not showing counts, but we're showing the actual number, we are now telling it to use stat equals identity.
# What that means, is that it will not do any counting, it will not do anything, it will just look at the value we gave it at y.
# It will just set the height of the part to this value.

# Density plots
# Density plots provide a nice alternative to histograms. They show similar information about the distribution
# of a variable. However, instead of cutting it up into bins and counting, it uses an alternative process of
# distribution estimation, called Kernel Density Estimation (KDE for short). You will probably learn more
# about that in your probability theory course, but it provides a continuous estimation of the density. For
# example, lets plot the distribution of GDP on a lot scale using density (in ggplot2, geom_density does this):

ggplot(data = emissions_data) +
  geom_density(aes(x = GDP), col = "#003399", lwd = 1) +
  scale_x_log10() +
  ylab("") +
  xlab("GDP") +
  theme_light() +
  ggtitle("GDP distribution (log scale)")

# We can also plot distributions by group, by using, for example, the color and/or fill mapping:
ggplot(data = mt_cars) +
  geom_density(aes(x = mpg,
                   col = factor(cyl), # to encode a vector as a factor (the terms ‘category’ and ‘enumerated type’ are also used for factors).
                   fill = factor(cyl)), # to encode a vector as a factor (the terms ‘category’ and ‘enumerated type’ are also used for factors).
                   lwd = 1, # line width
                   alpha = 0.3) + # alpha - transparentness of the bar filling
  ylab("") +
  xlab("Fuel mileage") +
  theme_light() +
  ggtitle("Fuel economy distribution") +
  scale_color_manual(values = c("#003399", "#FF6600", "#43B02A"), name = "Number of cylinders") +
  scale_fill_manual(values = c("#003399", "#FF6600", "#43B02A"), name = "Number of cylinders") +
  theme(legend.position="bottom")

# Saving plots to disk
# ggplot2 also provides a convenient interface for saving plots to disk using the ggsave function. The process
# of saving a ggplot plot to disk involves two stages:
# 1. Saving the plot into an object
# 2. Rendering the plot to disk
# For example, let’s save the GDP scatterplot from above to disk:

#Assign plot to a variable to save it in memory
gdp_plot <- ggplot(data = emissions_data) +
  geom_point(aes(x = GDP, y = mtCO2), col = "#003399") +
  scale_y_log10() +
  scale_x_log10() +
  theme_light() +
  ggtitle("GDP vs CO2 emissions\n(log-log scale)") +
  xlab("GDP") +
  ylab("CO2 Emissions")

#Save it using the function
ggsave("gdp_scatter.pdf", gdp_plot)
## Saving 6.5 x 4.5 in image
#Automatically guess the format from filename
ggsave("gdp_scatter.png", gdp_plot)