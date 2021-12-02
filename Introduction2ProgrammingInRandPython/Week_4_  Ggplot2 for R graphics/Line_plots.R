library(readr)
library(tidyverse)
library(viridis)

milk_data <- read_csv("resources/files/CADairyProduction.csv")

ggplot(data = milk_data) +
  geom_line(aes(x = Month.Count, y = Milk.Prod, col = "Milk"), lwd = 1) + # lwd - Line Width Density
  geom_line(aes(x = Month.Count, y = Cotagecheese.Prod, col = "Cottage Cheese"), lwd = 1) +
  ggtitle("Milk vs. Cheese production over time") +
  xlab("Time") +
  ylab("Production") +
  theme_light() +
  theme(legend.position = "bottom") +
  # set color values for our lines and set the name
  scale_color_manual(values = c("#FF6600", "#43B02A"), name = "Product") +
  theme(panel.background = element_rect(fill = "#003399"))+
  theme(plot.background = element_rect(fill = "#003399"))+
  theme(legend.background = element_rect(fill = "#003399"))+
  theme(legend.key = element_rect(fill = "#003399"))+
  theme(text = element_text(color = "white")) +
  theme(axis.text = element_text(color = "gray70")) +
  theme(panel.grid.major = element_blank())+
  theme(panel.grid.minor = element_blank())+
  theme(panel.border = element_blank())

