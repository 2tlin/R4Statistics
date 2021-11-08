t <- runif(1)
if (t > 0.5) {
  print(paste("0.5 < ", t))
} else {
  print(paste("0.5 > ", t))
}

for (i in c(1,2,3,4,5,6,7,8,9,10)) {
  print(paste("This is number ", i))
}

set.seed(1)
while(runif(1, 0.4, 1) > 0.5) {
  print(" it is > 0.5")
}

repeat {
  t <- runif(1, 0.4, 1)
  if(t > 0.9) {
    print(" it is > 0.9")
    break
  }
    print(paste("This is number ", t))
}

# [1] "This is number  0.57616202365607"
# [1] "This is number  0.675439435755834"
# [1] "This is number  0.599436804512516"
# [1] "This is number  0.790522280242294"
# [1] "This is number  0.554810068430379"
# [1] "This is number  0.687127148965374"
# [1] "This is number  0.859786402387545"
# [1] "This is number  0.450548148620874"
# [1] " it is > 0.9"