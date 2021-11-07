# # a) What is a prob. that we do NOT have an ace in a 5-card starting hand?
# # P = Na / N, whrer Na = Number of Favorible outcomes (possibilities)? fnd N = Nummber of All outcomes (possibilities)
# # N = Nummber of All outcomes (possibilities) = 5-card starting hand from 52
# N <- choose(52, 5)
# print(N) # 2598960
# # Na = Number of Favorible outcomes (possibilities) = 5 cards from all the cards excluding aces (52 - 4)aces
# Na <- choose(52 - 4, 5)
# print(Na) # 1712304
# P <- Na / N
# print(P) # 0.658842
#
# # a) What is a prob. that we do have an ace in a 5-card starting hand?
# # P = Na / N, whrer Na = Number of Favorible outcomes (possibilities)? fnd N = Nummber of All outcomes (possibilities)
# # Na = Number of Favorible outcomes (possibilities) = 5 cards from all the cards excluding aces (52 - 4)aces
# Na <- choose(52, 1)
# P <- Na / N
# print(P) #
#
# n <- 1000000 # number of simulations
# count <- 0 # number of favorible outcomes
# deck <- c(rep("ace", 4), rep("others", 48))
# for (i in 1:n) {
#   hand <- sample(deck, 5, replace = FALSE)
#   if (!("ace" %in% hand)) count <- count + 1 # or match("ace",hand)
# }
# print(count / n) # 0.658559
#
# # b) What is a probability that we have a royal flush (AKQJ10 in the same suit)?
# # P = Na / N, whrer Na = Number of Favorible outcomes (possibilities)? fnd N = Nummber of All outcomes (possibilities)
# # N = Nummber of All outcomes (possibilities) = 5 cards from 52
# N <- choose(52, 5)
# # Na - therre are only 4 favorite outcomes = 1 flush per every suit
# P <- 4 / choose(52, 5) # 1.539077e-06
#
# m <- 10000 # number of simulations
# count2 <- 0 # number of favorible outcomes
# deck2 <- c(rep("hearts", 5),
#           rep("diamonds", 5),
#           rep("spades", 5),
#           rep("clubs", 5),
#           1:32)
# for (i in 1:m) {
#   hands <- sample(deck2, 5, replace = FALSE)
#   if (length(unique(hands)) == 1) count2 <- count2 + 1
# }
# print(count2 / m) #
#
# print(choose(10, 3))
# print(choose(10, 3))

#
# for (j in c(6,8,28,32)) {
#     # print(j)
#     for (i in 1:j) {
#       # print(i)
#       C <- choose(j, i)
#       print(C)
#       if (choose(j, i) == 256) {
#         print("j")
#         # print(j)
#       }
#     }
# }
#
# print(choose(11, 6))
# factorial(6)
#
# n <- c(6,8,28,32) # список А
# Pa <- choose(6, 1) + choose(6, 2) + choose(6, 3) + choose(6, 4) + choose(6, 5) + choose(6, 6) + 1
# print(Pa)
for (j in c(6,8,28,32)) {
    C <- 0
    for (i in 1:j) {
      C <- C + choose(j, i)
    }
    # print(C)
    if (C + 1 == 256) print(j)
}
getCardinalityOfSets <- function (listSets) {
  for (j in listSets) {
      C <- 0
      for (i in 1:j) C <- C + choose(j, i)
      if (C + 1 == 256) return(j)
  }
}

print(getCardinalityOfSets(c(6,8,28,32))) # 8

C <- 0
s <- 4
for (i in 1:s) C <- C + choose(s, i)
print(C)