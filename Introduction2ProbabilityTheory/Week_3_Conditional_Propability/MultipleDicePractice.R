# 2 independent 6-sides dies: blue and red
# Event A: Blue die rolls higher or equal to the red
# Event B: The sum of the rolls is 7.
# Question: Are A and B independent? or P(AB) = P(A) * P(B)

# Find P(A)
# All oucomes for 2 dies: 6 * 6 = 36
# Favorite possibilities:
# favorite cases when Blue die rolls equals to the red: 11 + 22 + 33 +... + 66 = 6
# favorite cases when Blue die rolls higher to the red: 65, 64/54, 63/53/43, 62/52/42/32, 61/51/41/31/21 = 15
# P(A) = (6 + 21 ) / 36 = 21 / 36
P_A <- 21 / 36 # 0.5833333

# Find P(B)
# All oucomes for 2 dies: 6 * 6 = 36
# Favorite possibilities:
# favorite cases when The sum of the rolls is 7: (1+6, 2+5, 3+4) х 2 (simmetric) = 6
P_B <- 6 / 36 # 0.1666667

# Find intersection of A and B
# All oucomes for 2 dies: 6 * 6 = 36
# Favorite possibilities:
# Blue die rolls higher or equal to the red
# favorite cases when The sum of the rolls is 7: (1+6, 2+5, 3+4) = 3
# P(AB) = 3 / 36
P_AB <- 3 / 36 # 0.08333333
P_A * P_B # 0.09722222
P_AB == P_A * P_B # FALSE

# simulation
num <- 10000
countA <- 0
countB <- 0
countAB <- 0
rolls <- c(1,2,3,4,5,6)

set.seed(0)
for (i in 1:num) {
  blue <- sample(rolls, 1)
  red <- sample(rolls, 1)
  if (blue >= red) countA <- countA + 1
  if (blue + red == 7) countB <- countB + 1
  if ((blue >= red) & (blue + red == 7)) countAB <- countAB + 1
}
P_A <- countA / num # 0.5854
P_B <- countB / num # 0.1696
P_AB <- countAB / num # 0.0832
P_A * P_B # 0.09928384
P_A * P_B == P_AB # FALSE

# In this problem we will simulate 6 -side die rolls  using a [0, 1) RNG (random generator)
# and then we will investigate if the RNG really generate uniform and independent values
library(ggplot2)
LCG <- function(n, seed = 1, A = 1229, C = 1, M = 2048) {
  res <- rep(NA, n+1)
  res[1] <- seed # start the computing of fututre numbers
  for (i in 1:n) {
    res[i+1] <- (A * res[i] + C) %% M # divide by module M = reminder of division. The highest value can be M
  }
  res[-1] / 2048 # normalization to [0, 1) interval. [-1] - remove 1 element
}
x <- LCG(10000)
hist(x)
y <- floor(x * 6) + 1 # simulating die
table(y)
#    1    2    3    4    5    6
# 1674 1666 1666 1657 1669 1668
