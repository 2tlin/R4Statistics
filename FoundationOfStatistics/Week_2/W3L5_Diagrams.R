bills <- c(32, 47, 47, 48, 49, 50, 50, 54, 55, 55, 57, 57, 58, 61, 62, 62, 63, 65, 65, 65, 66, 66, 71, 73, 77, 78, 78, 79, 83, 85)
hist(bills, main = "Frequency histogram")
hist(bills, prob = TRUE, main = "Density histogram")
hist(bills, prob = TRUE, breaks = 1,main = "Small histogram") # количество разбиений

