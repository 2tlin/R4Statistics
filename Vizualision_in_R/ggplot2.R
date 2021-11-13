# https://pozdniakov.github.io/tidy_stats/r_vis.html#gg_1
install.packages(ggplot2)
library(ggplot2)

install.packages(tidyverse)
library(tidyverse)

df <- read_tsv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/meta_dataset.txt")

## ── Column specification ────────────────────────────────────────────────────────
spec(df)
# cols(
#   Study_ID = col_double(),
#   Data_ID = col_double(),
#   k = col_double(),
#   Country = col_character(),
#   n = col_double(),
#   Design = col_character(),
#   outcome_test_cat = col_double(),
#   Effect_size = col_double(),
#   SE = col_double(),
#   Outcome_age = col_double(),
#   quasi_age = col_double(),
#   cpiq_early_age = col_double(),
#   cpiq_age_diff = col_double(),
#   ses_funnel = col_double(),
#   published = col_double(),
#   Male_only = col_double(),
#   Achievement = col_double()
# )

# Каждая строчка — это результат отдельного исследования, при этом одна статья может включать несколько исследований,

cpiq <- subset(df, subset=(Design=="Control Prior IQ"))
poli <- subset(df, subset=(Design=="Policy Change"))

# Итак, начнем рисовать сам график. Сначала иницируем объект ggplot с данными poli по умолчанию.
ggplot(data=poli)

# Теперь добавим в качестве эстетик по умолчанию координаты: aes(x=Outcome_age, y=Effect_size)
ggplot(aes(x=Outcome_age, y=Effect_size), data=poli)

#Что изменилось? Появилась координатная ось и шкалы.
# Заметьте, масштаб неслучаен: он строится на основе разброса значений в выбранных колонках.
# Однако этого недостаточно для отрисовки графика, нехватает геометрии:
# нужно задать, в какую географическую сущность отобразятся данные.

ggplot(aes(x=Outcome_age, y=Effect_size), data=poli) +
  geom_point()

# Готово! Это и есть основа картинки. Добавляем размер:

ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=poli) +
  geom_point()

# Перед нами возникла проблема оверплоттинга: некоторые точки перекрывают друг друга,
# поскольку имеют очень близкие координат. Авторы графика решают эту проблему очевидным способом:
# добавляют прозрачности точкам. Заметьте, прозрачность задается для всех точек одним значением,
# поэтому параметр alpha задается вне функции aes()

ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=poli) +
  geom_point(alpha=.55)

# Совершенно так же задается и цвет. Он задается одинаковым для всех точек с помощью HEX-кода
ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=poli) +
  geom_point(alpha=.55, colour="#BA1825")

# Теперь добавим регрессионную прямую с доверительными интервалами на график.
# Это специальный геом geom_smooth() со специальной статистикой, который займет второй слой данного графика
ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=poli) +
        geom_point(alpha=.55, colour="#BA1825") +
        geom_smooth()

# `geom_smooth()` using method = 'loess' and formula 'y ~ x'
# По умолчанию geom_smooth() строит кривую линию. Поставим method = "lm" для прямой.
ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=poli) +
        geom_point(alpha=.55, colour="#BA1825") +
        geom_smooth(method="lm")

# Теперь нужно поменять цвет: ярко синий цвет, используемый по умолчанию здесь попросту мешает восприятию графика.
ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=poli) +
        geom_point(alpha=.55, colour="#BA1825") +
        geom_smooth(method="lm", colour="#BA1825")

#Авторы графика перекрашивают серую полупрозначную область тоже. В этом случае используется параметр fill =, а не colour =,
# но цвет используется тот же
ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=poli) +
        geom_point(alpha=.55, colour="#BA1825") +
        geom_smooth(method="lm", colour="#BA1825",fill="#BA1825")

# Регрессионную линию авторы немного утоньшают с помощью параметра size =.
ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=poli) +
        geom_point(alpha=.55, colour="#BA1825") +
        geom_smooth(method="lm", colour="#BA1825",fill="#BA1825",size=.5)

# Чтобы сместить фокус в сторону точек, авторы добавляют прозрачности для всего geom_smooth()
ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=poli) +
        geom_point(alpha=.55, colour="#BA1825") +
        geom_smooth(method="lm", colour="#BA1825",fill="#BA1825",size=.5, alpha=.25)

# На шкале присутствует 0, и по умолчанию он никак не обозначен.
# Это легко исправить с помощью вспомогательного геома geom_hline()
ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=poli) +
        geom_point(alpha=.55, colour="#BA1825") +
        geom_hline(yintercept=0) +
        geom_smooth(method="lm", colour="#BA1825",fill="#BA1825",size=.5, alpha=.25)

# Оттенить эту линию можно, сделав ее пунктирной
ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=poli) +
        geom_point(alpha=.55, colour="#BA1825") +
        geom_hline(yintercept=0, linetype="dotted") +
        geom_smooth(method="lm", colour="#BA1825",fill="#BA1825",size=.5, alpha=.25)

# Авторы графика вручную задают деления шкалы по оси x.
ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=poli) +
        geom_point(alpha=.55, colour="#BA1825") +
        geom_hline(yintercept=0, linetype="dotted") +
        scale_x_continuous(breaks=c(20,30,40,50,60,70,80)) +
        geom_smooth(method="lm", colour="#BA1825",fill="#BA1825",size=.5, alpha=.25)

# С помощью функции guides() убирают легенду с картинки
ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=poli) +
        geom_point(alpha=.55, colour="#BA1825") +
        geom_hline(yintercept=0, linetype="dotted") +
        scale_x_continuous(breaks=c(20,30,40,50,60,70,80)) +
        guides(size=F) +
        geom_smooth(method="lm", colour="#BA1825",fill="#BA1825",size=.5, alpha=.25)

# Следующим этапом авторы добавляют подписи шкал и название картинки. Обратите внимание на \n внутри подписи к оси y,
# которая задает перенос на следующую строку.
ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=poli) +
        geom_point(alpha=.55, colour="#BA1825") +
        geom_hline(yintercept=0, linetype="dotted") +
        scale_x_continuous(breaks=c(20,30,40,50,60,70,80)) +
        xlab("Age at outcome test (years)") +
        ylab("Gain for 1 year of education\n(IQ points)") +
        guides(size=F) +
        geom_smooth(method="lm", colour="#BA1825",fill="#BA1825",size=.5, alpha=.25) + ggtitle("Policy Change")

# Теперь пришло время сделать график более красивым и понятным с помощью изменения подложки,
# т.е. работы с темой графика. Здесь тема задается сначала как theme_bw()
# — встроенная в ggplot2 минималистичная тема, а потом через функцию theme(),
# через которую можно управлять конкретными элементами темы.
# Здесь это сделано, чтобы передвинуть название графика к центру.
ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=poli) +
        geom_point(alpha=.55, colour="#BA1825") +
        geom_hline(yintercept=0, linetype="dotted") +
        theme_bw() +
        scale_x_continuous(breaks=c(20,30,40,50,60,70,80)) +
        xlab("Age at outcome test (years)") +
        ylab("Gain for 1 year of education\n(IQ points)") +
        guides(size=F) +
        geom_smooth(method="lm", colour="#BA1825",fill="#BA1825",size=.5, alpha=.25) + ggtitle("Policy Change")+
        theme(plot.title = element_text(hjust=0.5))

# Готово! Мы полностью воспроизвели график авторов статьи с помощью их открытого кода.

# Если вы помните, то в изначальном графике было две картинки. Авторы делают их отдельно,
# с помощью почти идентичного кода. Нечто похожее можно сделать по-другому, применяя фасетки.
# Для этого мы возьмем неотфильтрованный датасет df, а с помощью колонки Design,
# на основании которой разделялся датасет для графиков, произведем разделение графиков внутри самого ggplot
# объекта. Для этого нам понадобится функция facet_wrap(), в которой с помощью формулы можно задать колонки,
# по которым будут разделены картинки по вертикали (слева от ~) и горизонтально (справа от ~).
# Пробуем разделить графики горизонтально:

ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=df) +
        geom_point(alpha=.55, colour="#BA1825") +
        geom_hline(yintercept=0, linetype="dotted") +
        theme_bw() +
        scale_x_continuous(breaks=c(20,30,40,50,60,70,80)) +
        xlab("Age at outcome test (years)") +
        ylab("Gain for 1 year of education\n(IQ points)") +
        guides(size=F) +
        geom_smooth(method="lm", colour="#BA1825",fill="#BA1825",size=.5, alpha=.25) + ggtitle("Policy Change")+
        theme(plot.title = element_text(hjust=0.5)) +
    facet_wrap(~Design)

# Здесь становится очевидно, почему авторы не включали данные "School Age Cutoff" третьим графиком:
# средний возраст участников этих исследований сильно отличается.
ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=df %>% filter(Design != "School Age Cutoff")) +
        geom_point(alpha=.55, colour="#BA1825") +
        geom_hline(yintercept=0, linetype="dotted") +
        theme_bw() +
        scale_x_continuous(breaks=c(20,30,40,50,60,70,80)) +
        xlab("Age at outcome test (years)") +
        ylab("Gain for 1 year of education\n(IQ points)") +
        guides(size=F) +
        geom_smooth(method="lm", colour="#BA1825",fill="#BA1825",size=.5, alpha=.25) + ggtitle("Policy Change")+
        theme(plot.title = element_text(hjust=0.5)) +
    facet_wrap(~Design)

# Теперь поставим два графика друг над другом, поместив Design слева от ~ внутри facet_wrap(). Справа нужно добавить точку.
ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=df %>% filter(Design != "School Age Cutoff")) +
        geom_point(alpha=.55, colour="#BA1825") +
        geom_hline(yintercept=0, linetype="dotted") +
        theme_bw() +
        scale_x_continuous(breaks=c(20,30,40,50,60,70,80)) +
        xlab("Age at outcome test (years)") +
        ylab("Gain for 1 year of education\n(IQ points)") +
        guides(size=F) +
        geom_smooth(method="lm", colour="#BA1825",fill="#BA1825",size=.5, alpha=.25) + ggtitle("Policy Change")+
        theme(plot.title = element_text(hjust=0.5)) +
    facet_grid(Design~.)

# Теперь нужно изменить подписи.

ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2)), data=df %>% filter(Design != "School Age Cutoff")) +
        geom_point(alpha=.55, colour="#BA1825") +
        geom_hline(yintercept=0, linetype="dotted") +
        theme_bw() +
        scale_x_continuous(breaks=c(20,30,40,50,60,70,80)) +
        xlab("Age at outcome test (years)") +
        ylab("Gain for 1 year of education\n(IQ points)") +
        guides(size=F) +
        geom_smooth(method="lm", colour="#BA1825",fill="#BA1825",size=.5, alpha=.25) +
    ggtitle("Effect of education as a function of age at the outcome test")+
        theme(plot.title = element_text(hjust=0.5)) +
    facet_grid(Design~.)


# Чтобы акцентировать графики, можно раскрасить их в разные цвета в дополнение к фасеткам.
# Для этого мы переносим colour = и fill = из параметров соответствующих геомов внутрь эстетик
# и делаем зависимыми от Design. Поскольку эти эстетики (точнее, colour =) одинаковы заданы для двух геомов
# (geom_point() и geom_smooth()), то мы спокойно можем вынести их в эстетики по умолчанию —
# в параметры aes() внутри ggplot().
# При этом сразу выключим легенды для новых эстетик, потому они избыточны.
ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2), colour = Design, fill = Design), data=df %>% filter(Design != "School Age Cutoff")) +
        geom_point(alpha=.55) +
        geom_hline(yintercept=0, linetype="dotted") +
        theme_bw() +
        scale_x_continuous(breaks=c(20,30,40,50,60,70,80)) +
        xlab("Age at outcome test (years)") +
        ylab("Gain for 1 year of education\n(IQ points)") +
        guides(size=FALSE, colour = FALSE, fill = FALSE) +
        geom_smooth(method="lm", size=.5, alpha=.25) +
    ggtitle("Effect of education as a function of age at the outcome test")+
        theme(plot.title = element_text(hjust=0.5)) +
    facet_grid(Design~.)

# Слишком блеклая палитра? Не беда, можно задать палитру вручную! В ggplot2 встроены легендарные Brewer’s Color Palettes, которыми мы и воспользуемся.
# Функции для шкал устроены интересным образом: они состоят из трех слов, первое из которых scale_*_*(),
# второе — эстетика, например, scale_color_*(), а последнее слово — тип самой шкалы,
# в некоторых случаях - специальное название для используемой шкалы, как и в случае с scale_color_brewer()
meta_2_gg <- ggplot(aes(x=Outcome_age, y=Effect_size, size=1/(SE^2), colour = Design, fill = Design), data=df %>% filter(Design != "School Age Cutoff")) +
        geom_point(alpha=.55) +
        geom_hline(yintercept=0, linetype="dotted") +
        theme_bw() +
        scale_x_continuous(breaks=c(20,30,40,50,60,70,80)) +
        xlab("Age at outcome test (years)") +
        ylab("Gain for 1 year of education\n(IQ points)") +
        guides(size=FALSE, colour = FALSE, fill = FALSE) +
        geom_smooth(method="lm", size=.5, alpha=.25) +
    ggtitle("Effect of education as a function of age at the outcome test")+
        theme(plot.title = element_text(hjust=0.5)) +
    facet_grid(Design~.) +
    scale_colour_brewer(palette = "Set1") +
    scale_fill_brewer(palette = "Set1")
meta_2_gg

install.packages("plotly")
library(plotly)
# теперь наведение на курсора на точки открывает небольшое окошко с дополнительной информацией о точке
ggplotly(meta_2_gg)
