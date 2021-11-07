# Types:
# Double
d <- 2.4
typeof(d) # "double"
2^10 # 1024

# Integer
typeof(2L) # "integer"

# vector - homogeneous data structure
a <- c(1,2,3)

# Vector operations:
a + 1 # 2 3 4
a * 2 # 2 4 6
a > 2 # FALSE FALSE  TRUE
c(1,2,3,4) * c(1,2) # 1 4 3 8
# because:
# 1 2 3 4
# 1 2 1 2 - adding the same vector (1,2) to makethe vector with the same size as the first one
# 1 4 3 8 - just multipy
c(1,2,3,4) * c(1,2, 3) # 1 4 9 4
# because:
# 1 2 3 4
# 1 2 3 1 - adding the same vector (1,2, 3) to make the vector with the same size as the first one
# 1 4 9 4 - just multipy

# Comparison
1 %in% a # TRUE
# or
match(a, 1) # 1 NA NA

# Missing data in
typeof(NA) # "logical"
a_na <- c(1,2,3,NA)
typeof(a_na) # "double"
mean(a_na) # NA
sum(a_na) # NA

mean(a_na, na.rm = T) # 2
sum(a_na, na.rm = T) # 6

TRUE & NA # NA
FALSE & NA # FALSE
TRUE | NA # TRUE
FALSE | NA # NA

b <- c(1,2,c(1,2,3))
b[3] # ???