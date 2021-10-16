# how to make a QQ plot in R
x <- rnorm(100, 50, 25)
y <- rnorm(100, 50, 25)

# qqplot function in r package
qqplot(x, y, xlab = "test x", ylab = "test y", main = "Q-Q Plot")

mydata <- rnorm(100, mean = 5, sd = 1)
hist(mydata, col = "light green")

# Одним из наиболее простых тестов нормальности является график квантилей (qqplot).
# Суть теста проста: если данные имеют нормальное распределение,
# то они не должны сильно отклоняться от линии теоретических квантилей
# и выходить за пределы доверительных интервалов. Давайте проделаем этот тест в R.

install.packages("car") #установка пакета "car"
library(car) #загрузка пакета "car" в среду R
qqPlot(mydata) #запустим тест

print(mydata)