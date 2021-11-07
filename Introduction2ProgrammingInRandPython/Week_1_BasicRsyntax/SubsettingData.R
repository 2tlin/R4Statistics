a <- c("1", "2", "3", "4", "5")

# using positive or negative indexes
a[3] # "3"
# -i - return vector without the i-element but leave the original vector the same
f <- a[-3] # "2" "3" "4" "5"
print(f) # "1" "2" "4" "5"
e <- a[-1] # "2" "3" "4" "5"
print(e) # "2" "3" "4" "5"
print(a) # "1" "2" "3" "4" "5"

# using vectors as indexes
a[c(3,5)] # "3" "5"
a[c("3","5")] # NA NA
d <- a[c(3,6)] # "3" NA
typeof(d) # "double"
a[c(-1, -5)] # "2" "3" "4"
# we cannot combine positive nd negative indexes

# using logical values
a[c(T, F, F, T, T)] # "1" "4" "5" - F to skip the value
a[c(T, F)] # "1" "3" "5" - because we expand locigal vector to the size of like [T, F, T, F, T]

a[a > 1] # "2" "3" "4" "5"
a[a <= 3 & a > 1] # "2" "3"
t <- a < 3
print(t) # TRUE TRUE FALSE FALSE FALSE
typeof(t) # "logical"

a[a >2] # "3" "4" "5"

# use is.na(a) to remove NA
s <- c(1,2,3,NA)
w <- s[! is.na(s)]
print(w) # 1 2 3



