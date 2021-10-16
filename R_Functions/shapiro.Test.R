mydataNorm <- rnorm(100, mean = 5, sd = 1)
hist(mydata, col = "light green")

mydataPois <- rpois(100, lambda = 5)
hist(mydataPois, col = "light green")

# порой при помощи qqplot невозможно дать однозначный ответ.
# В этом случае следует использовать тест Шапиро-Уилка,
# который основан на нулевой гипотезе, что наши данные распределены нормально.
# Если же P-значение менее 0.05 (p-value < 0.05),
# то мы вынуждены отклонить нулевую гипотезу.
# P-значение в этом случае будет говорить о том, что вероятность ошибки при отклонении нулевой гипотезы
# будет равна менее 5%.

shapiro.test(mydataNorm) # p-value = 0.5191 > 0.05 so it is normal dist
shapiro.test(mydataPois) # p-value = 0.01665 < 0.05 so it is NOT normal dist