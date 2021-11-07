# heterogeneous data structure
a <- list(1, "1", TRUE)
print(a)
a[3] # TRUE
a[43] # NULL

b <- list(c(1,2,3), c(4,5,6))
e <- b[2] # 4 5 6
typeof(e) # "list"
e[1] # # 4 5 6
e[2] # NULL
list(c(1,2), c(3,4))

# named list elements
na <- list(
  e1 = NA,
  e2 = 1,
  e3 = T,
  e4 = c(1,2,3,4,5),
  e5 = list("1","2","3"),
  e6 = list(
    "first" = TRUE,
    "second" = c(1,2)
  )
)
na["e3"] # TRUE
na[3] # TRUE
l <- na[5]
print(l) # "1" "2" "3"

# list subsetting
na[c(1,2)] # NA 1
na[-1]
na[c(T, F)]

# to return a single result not a list is to use a double brackets [[ ]]
print(na)
na[4]
na[[4]]
typeof(na[4]) # "list"
typeof(na[[4]])
na[5]
na[[5]]
typeof(na[5]) # "list"
typeof(na[[5]]) # "list"

f <- na[[4]] # 1 2 3 4 5
print(f) # "1" "2" "4" "5"
typeof(na[4]) # "list"
typeof(na[[4]]) # "double"
typeof(f) # "character" ???

# to take inner elements use the double brackets [[]] and use [[]] [[]] double-double brackets for the next inner level
print(na[6])
# $e6
# $e6$first
# [1] TRUE
#
# $e6$second
# [1] 1 2
typeof(na[6]) # "list"

print(na[[6]])
# $first
# [1] TRUE
#
# $second
# [1] 1 2
typeof(na[[6]]) # "list"

print(na[[6]][1])
# $first
# [1] TRUE
typeof(na[[6]][1]) # "list"

# using [[]] we receive the value of the inner list
print(na[[6]][[1]]) # TRUE
typeof(na[[6]][[1]]) # "logical"

print(na[[6]][[2]][1]) # "list"




print(na[[6]][2])
# $second
# [1] 1 2
typeof(na[[6]][2]) # "list"

print(na[[6]][2])
# $second
# [1] 1 2
typeof(na[[6]][[2]]) # "list"

print(na[[6]][[2]][1]) # 1
typeof(na[[6]][[2]][1]) # "double"

# with named list we can use $ to access
na$e4 # 1 2 3 4 5
na$e6$second[1] # 1
na$e6[[2]][1] # 1


