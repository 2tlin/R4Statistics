money <- c(250, 450, 200, 100)
maleShopping <- c(75, 25, 100, 50)
femaleShopping <- c(350, 230, 20, 150)
itemList <- c("Clothing", "Shoes", "Electronics", "Other")


boxplot(money, horizontal = TRUE)
# Absolute frequency barplot
barplot(maleShopping, main = "Male Shopping", col = rainbow(3), names.arg = itemList)
barplot(femaleShopping, main = "Female Shopping", col = rainbow(3), names.arg = itemList)