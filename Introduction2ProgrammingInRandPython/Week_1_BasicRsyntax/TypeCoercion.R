# Type Coersion = Приведение типов
# logical -> Integer > Double -> Character
a <- c(1,2,"3")
typeof(a) # "character"
print(a) # "1" "2" "3"

# conversion functions
as.character(3.14) # "3.14"
as.double("3.14") # 3.14
as.integer("1") # 1
as.logical("TRUE") # TRUE
as.double("3.14 is not a number") # NA - Warning: NAs introduced by coercio
