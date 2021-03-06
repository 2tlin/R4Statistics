# Для проведения t-est (Student Distribution), необходимо, чтобы данные выборок имели распределение близкое к нормальному.

# Нормальное распределение данных и методы его оценки qqplot и shapiro.test
# Нормальное распределение данных характерно для количественных данных,
# на распределение которых влияет множество факторов, либо оно случайно.
# Нормальное распределение характеризуется несколькими особенностями:
# Оно всегда симметрично и имеет форму колокола.
# Значения среднего и медианы совпадают.
# В пределах одного стандартного отклонения в обе стороны лежат 68.2% всех данных,
# в пределах двух - 95,5%,
# в пределах трех - 99,7%

mydata <- rnorm(100, mean = 5, sd = 1)
hist(mydata, col = "light green")

# Одним из наиболее простых тестов нормальности является график квантилей (qqplot).
# Суть теста проста: если данные имеют нормальное распределение,
# то они не должны сильно отклоняться от линии теоретических квантилей
# и выходить за пределы доверительных интервалов. Давайте проделаем этот тест в R.

install.packages("car") #установка пакета "car"
library(car) #загрузка пакета "car" в среду R
qqPlot(mydata) #запустим тест

shapiro.test(mydata) # p > 0.05 so it is normal dist

# Запускаем t-тест Стьюдента в среде R
# Итак, если данные из выборок имеют нормальное распределение,
# можно смело приступать к сравнению средних этих выборок.
# Существует три основных типа t-теста

# Одновыборочный критерий Стьюдента (one-sample t-test)
# Одновыборочный t-тест следует выбирать, если Вы сравниваете выборку с общеизвестным средним.

#  Для того, чтобы проверить эту гипотезу, мы возьмем данные РосСтата
#  (таблицы среднего ожидаемого продолжительности жизни по регионам России)
#  и применим одновыборочный критерий Стьюдента.
#  Так как критерий Стьюдента основан на проверке статистических гипотез,
#  то за нулевую гипотезу будем принимать то,
#  что различий между средним ожидаемым уровнем продолжительности по России
#  и республикам Северного Кавказа нет.
#  Если различия существуют, то для того,
#  чтобы считать их статистически значимыми p-value должно быть менее 0.05
#  (логика та же, что и в вышеописанном тесте Шапиро-Уилка).

# Загрузим данные в R. Для этого, создадим вектор со средними значениями по республикам Кавказа
# (включая Адыгею). Затем, запустим одновыборочный t-тест,
# указав в параметре mu среднее значение ожидаемого возраста жизни по России равное 70.93.

rosstat <-c(79.42, 75.83, 74.16, 73.91, 73.82, 73.06, 72.01)
qqPlot(rosstat)
shapiro.test(rosstat)
t.test(rosstat, mu = 70.93)

# data:  rosstat
# t = 4.0159, df = 6, p-value = 0.006991
# alternative hypothesis: true mean is not equal to 70.93
# 95 percent confidence interval:
#  72.36443 76.83843
# sample estimates:
# mean of x
#  74.60143

#Несмотря на то, что у нас всего 7 точек в выборке, в целом они проходят тесты нормальности
# и мы можем на них полагаться, так как эти данные уже были усреднены по региону.
# Результаты t-теста говорят о том, что средняя ожидаемая продолжительность жизни
# у жителей Северного Кавказа (74.6 лет) действительно выше, чем в среднем по России (70.93 лет),
# а результаты теста являются статистически значимыми (p < 0.05).

# Двувыборочный для независимых выборок (independent two-sample t-test)
# Двувыборочный t-тест используется, когда Вы сравниваете две независимые выборки.
# Допустим, мы хотим узнать, отличается ли урожайность картофеля на севере и на юге какого-либо региона.
# Для этого, мы собрали данные с 40 фермерских хозяйств: 20 из которых располагались на севере и сформировали выборку "North",
# а остальные 20 - на юге, сформировав выборку "South".

North <- c(122, 150, 136, 129, 169, 158, 132, 162, 143, 179, 139, 193, 155, 160, 165, 149, 173, 173, 141, 166)
qqPlot(North)
shapiro.test(North)

South <- c(170, 163, 178, 150, 166, 142, 157, 149, 151, 164, 163, 161, 159, 139, 180, 155, 144, 139, 151, 160)
qqPlot(North)
shapiro.test(North)

boxplot(North, South)

# Как видно из графика, медианы выборок не сильно отличаются друг от друга,
# однако разброс данных гораздо сильнее на севере.
# Проверим отличаются ли статистически средние значения при помощи функции t.test.
# Однако в этот раз на место параметра mu мы ставим имя второй выборки.
# Результаты теста, которые Вы видите на рисунке снизу,
# говорят о том, что средняя урожайность картофеля на севере
# статистически не отличается от урожайности на юге (p = 0.6339).

t.test(North, South, var.equal = FALSE)
# data:  North and South
# t = -0.48077, df = 32.139, p-value = 0.6339
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  -12.304835   7.604835
# sample estimates:
# mean of x mean of y
#    154.70    157.05

# Двувыборочный для зависимых выборок (dependent two-sample t-test)
# Третий вид t-теста используется в том случае, если элементы выборок зависят друг от друга.
# Он идеально подходит для проверки повторяемости результатов эксперимента:
# если данные повтора статистически не отличаются от оригинала,
# то повторяемость данных высокая.
# Также двувыборочный критерий Стьюдента для зависимых выборок
# широко применяется в медицинских исследованиях при изучении эффекта лекарства
# на организм до и после приема.

# Для того, чтобы запустить его в R, следует ввести все ту же функцию t.test.
# Однако, в скобках, после таблиц данных, следует ввести дополнительный аргумент paired = TRUE.
# Этот аргумент говорит о том, что Ваши данные зависят друг от друга. Например:

t.test(experiment, povtor.experimenta, paired = TRUE)
t.test(davlenie.do.priema, davlenie.posle.priema, paired = TRUE)

# Также в функции t.test существует два дополнительных аргумента,
# которые могут улучшить качество результатов теста: var.equal и alternative.
# Если вы знаете, что вариация между выборками равна, вставьте аргумент var.equal = TRUE.
# Если же вы хотите проверить гипотезу о том,
# что разница между средними в выборках значительно меньше или больше 0,
# то введите аргумент alternative="less" или alternative="greater"
# (по умолчанию альтернативная гипотеза говорит о том,
# что выборки просто отличаются друг от друга: alternative="two.sided").