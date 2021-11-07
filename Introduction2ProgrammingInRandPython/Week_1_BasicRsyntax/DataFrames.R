data <- read.csv("resources/files/country_data2.csv")
data_head <- head(data, 10) # get first 10 rows
print(data_head)
#           country     mtCO2 population       GDP
# 1           China 9.135e+09 1373541278 2.114e+13
# 2   United States 5.402e+09  323995528 1.856e+13
# 3           India 1.887e+09 1266883598 8.721e+12
# 4          Russia 1.756e+09  142355415 3.751e+12
# 5           Japan 1.257e+09  126702133 4.932e+12
# 6         Germany 7.440e+08   80722792 3.979e+12
# 7            Iran 6.504e+08   82801633 1.459e+12
# 8    Korea, South 5.993e+08   50924172 1.934e+12
# 9    Saudi Arabia 5.940e+08   28160273 1.731e+12
# 10 United Kingdom 5.683e+08   64430428 2.788e+12
typeof(data) # "list"

summary(data)
 #    country              mtCO2             population             GDP
 # Length:213         Min.   :1.050e+02   Min.   :1.190e+03   Min.   :1.001e+07
 # Class :character   1st Qu.:1.400e+06   1st Qu.:9.153e+05   1st Qu.:9.066e+09
 # Mode  :character   Median :9.100e+06   Median :6.238e+06   Median :5.479e+10
 #                    Mean   :1.556e+08   Mean   :3.437e+07   Mean   :5.597e+11
 #                    3rd Qu.:6.200e+07   3rd Qu.:2.346e+07   3rd Qu.:3.011e+11
 #                    Max.   :9.135e+09   Max.   :1.374e+09   Max.   :2.114e+13

data[1:2] # read 1 and 2 columns
# 1                                           China 9.135e+09
# 2                                   United States 5.402e+09

data[0] # таблица данных с 0 колонок и 213 строками ???
data[1] # get i indexed column
data[-1] # get all indexed columns excluded i column

data[2,] # get current row
#         country     mtCO2 population       GDP
# 2 United States 5.402e+09  323995528 1.856e+13
typeof(data[2,]) # "list"

data[[2]] # get current column as a vector
 #  [1] 9.135e+09 5.402e+09 1.887e+09 1.756e+09 1.257e+09 7.440e+08
 #  [7] 6.504e+08 5.993e+08 5.940e+08 5.683e+08 5.640e+08 5.350e+08
 # [13] 4.820e+08 4.550e+08 4.420e+08 3.856e+08 3.850e+08 3.620e+08
 # [19] 3.190e+08 3.010e+08 2.960e+08 2.910e+08 2.760e+08 2.578e+08
typeof(data[[2]]) # "double"

data[[1:1]] # ???
# "United States"
data$GDP[1:10]
#  [1] 2.114e+13 1.856e+13 8.721e+12 3.751e+12 4.932e+12 3.979e+12 1.459e+12 1.934e+12 1.731e+12 2.788e+12
data$GDP[10] # 2.788e+12

# statistic functions
mtCO2 <- data$mtCO2
mean(mtCO2) # 155554897
median(mtCO2) # 9100000
sd(mtCO2) # 753740278

big_emitter_co2 <- 4 * mean(mtCO2)
big_emitter_co2_mask <- data$mtCO2 > big_emitter_co2 # logical vector with TRUE where mtCO2 > 4 * mean(mtCO2)
data[big_emitter_co2_mask, ]
#         country     mtCO2 population       GDP
# 1         China 9.135e+09 1373541278 2.114e+13
# 2 United States 5.402e+09  323995528 1.856e+13
# 3         India 1.887e+09 1266883598 8.721e+12
# 4        Russia 1.756e+09  142355415 3.751e+12
# 5         Japan 1.257e+09  126702133 4.932e+12
# 6       Germany 7.440e+08   80722792 3.979e+12
# 7          Iran 6.504e+08   82801633 1.459e+12

data[data$mtCO2 > 4 * mean(mtCO2), ] # or the same
#         country     mtCO2 population       GDP
# 1         China 9.135e+09 1373541278 2.114e+13
# 2 United States 5.402e+09  323995528 1.856e+13
# 3         India 1.887e+09 1266883598 8.721e+12
# 4        Russia 1.756e+09  142355415 3.751e+12
# 5         Japan 1.257e+09  126702133 4.932e+12
# 6       Germany 7.440e+08   80722792 3.979e+12
# 7          Iran 6.504e+08   82801633 1.459e+12