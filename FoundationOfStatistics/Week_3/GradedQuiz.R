male <- c(80.2, 80.8, 57.5	, 98, 50.5,	73.8, 77.4,	59.7, 77.9,	52.6)
female <- c(59.7, 57.3, 72.8, 48.2, 59.5, 48.3, 61.2, 53.9, 53.9, 70.7)

# Find the range and interquartile range for each group. How much is IQR for men larger than that for women?
print(quantile(male))
print(quantile(female))
IQR_male <- 79.625 - 58.050
IQR_female <- 60.825 - 53.900
print(IQR_male - IQR_female) // 14.65

# Using Google Sheets, find the standard deviation for mean January temperature based on the given dataset.
temp <- c(-4.7, -6.1, -5.5, -3.3, -7.1, -3.1, -5.2, -7.3, -12.1, -6.6, -5.9, -6.3)
print(sd(temp)) // 2.310844

# The above dataset on the sample of 25 professors’ salaries was obtained, where x is salary level,
# and f is its frequency. Frequency is the number of times the respective observaion occured. For example,
# number 7 in the second row means that the sample contains 7 observations equal to 10.
# Calculate the mean salary X and its standard deviation ss (round up to 3 decimal places).
# Make sure to take the frequency of every observation into account while doing calculations!

salary <- c(10,10, 10,10,10,10,10, 15, 15,15,15,15,15,15,15,15,15,20,20,20,20,20,25,25,40)
print(mean(salary)) # 16.4
print(sd(salary)) # 6.69577