# Анализ поведенческих данных на R и Python
# Common libraries
install.packages(tidyverse)
suppressMessages(suppressWarnings(library(tidyverse)))

library(boot) #Required for Bootstrap simulations
library(rstudioapi) #To load data from local folder

install.packages(ggpubr)
library(ggpubr) #To generate multi-plots

install.packages(ggplot2)
library(ggplot2)

install.packages(ggplot2)
library(ggplot2)

# Why we need causal analytics to explain human behavior
# Confound it! The hidden dangers of letting regression sort it out

## First example: stand data
stand_data <- read.csv("resources/files/chap1-stand_data.csv")

#Running linear regressions
#Biased model (coeff should be 1,000)
lm_stand_data <- lm(icecream_sales ~ temps, data=stand_data)
summary(lm_stand_data)
Call:
lm(formula = icecream_sales ~ temps, data = stand_data)
# Residuals:
#    Min     1Q Median     3Q    Max
# -25676  -5164   -358   3933  35086
#
# Coefficients:
#              Estimate Std. Error t value Pr(>|t|)
# (Intercept) -4519.055    454.566  -9.941   <2e-16 ***
# temps        1145.320      7.826 146.348   <2e-16 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
# Residual standard error: 8717 on 2398 degrees of freedom

#Figure 1-3. Sales of ice-cream as a function of observed temperature
viz_fun_1.3 <- function(){
  ggplot(stand_data, aes(x=temps, y=icecream_sales)) +
    geom_point() + labs(x='Temperature', y='Ice-cream sales') + theme_classic()
}
viz_fun_1.3()