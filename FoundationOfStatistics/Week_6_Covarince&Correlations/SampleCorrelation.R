# install.packages("ggpubr")
# library("ggpubr")

X <- c(106, 136, 101, 75, 124, 92, 121, 86, 59, 91, 75, 141, 85, 82, 81)
Y <- c(87, 82, 70, 68, 81, 74, 80, 54, 66, 99, 60, 84, 79, 78, 52)

# compute sample covariance of X and Y
print(cov(X, Y))

# compute sample correlation between X and Y
print(cor(X, Y))

# standard deviation
print(sd(X))
print(sd(Y))

# an equivalent way to compute the sample correlation
print(cov(X, Y) / (sd(X) * sd(Y)))