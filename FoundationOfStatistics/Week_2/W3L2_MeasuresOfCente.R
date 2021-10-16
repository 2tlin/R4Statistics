# data <- read.table("resources/files/scores.txt", sep = ",")
data1 <- c(2, 7, 4, 3, 6, 4, 1, 2)
data2 <- c(5, 2, 4, 8, 1, 6, 7)
male <- c(80.2, 80.8, 57.5	, 98, 50.5,	73.8, 77.4,	59.7, 77.9,	52.6)
female <- c(59.7, 57.3, 72.8, 48.2, 59.5, 48.3, 61.2, 53.9, 53.9, 70.7)

print(sort(data1))
print(sort(data2))
diff = mean(male) - mean(female)
sumOfMedian = median(data1) + median(data2)


print(median(data1))
print(median(data2))

print(diff)
print(sumOfMedian)


print(quantile(data1))
print(quantile(data2))

print(quantile(male))
print(quantile(female))

print(sort(male))
print(sort(female))

print(range(male))
x <- range(male)

print(sd(male))
print(sd(female))

print(var(male))
print(var(female))

maleMin <-  58.050 - 1.5 * (79.625 - 58.050)
maleMax <-  79.625 + 1.5 * (79.625 - 58.050)

femaleMin <-  53.900 - 1.5 * (60.825 - 53.900)
femaleMax <-  60.825 + 1.5 * (60.825 - 53.900)

print(maleMin)
print(min(male))

print(maleMax)
print(max(male))

print(femaleMin)
print(min(female))

print(femaleMax)
print(max(female))