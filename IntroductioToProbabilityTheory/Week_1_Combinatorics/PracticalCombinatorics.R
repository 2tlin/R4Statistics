# a) What is a prob. that we do NOT have an ace in a 5-card starting hand?
# P = Na / N, whrer Na = Number of Favorible outcomes (possibilities)? fnd N = Nummber of All outcomes (possibilities)
# N = Nummber of All outcomes (possibilities) = 5-card starting hand from 52
N <- choose(52, 5)
print(N) # 2598960
# Na = Number of Favorible outcomes (possibilities) = 5 cards from all the cards excluding aces (52 - 4)aces
Na <- choose(52 - 4, 5)
print(Na) # 1712304
P <- Na / N
print(P) # 0.658842

# a) What is a prob. that we do have an ace in a 5-card starting hand?
# P = Na / N, whrer Na = Number of Favorible outcomes (possibilities)? fnd N = Nummber of All outcomes (possibilities)
# Na = Number of Favorible outcomes (possibilities) = 5 cards from all the cards excluding aces (52 - 4)aces
Na <- choose(52, 1)
P <- Na / N
print(P) #

n <- 1000000 # number of simulations
count <- 0 # number of favorible outcomes
deck <- c(rep("ace", 4), rep("others", 48))
for (i in 1:n) {
  hand <- sample(deck, 5, replace = FALSE)
  if (!("ace" %in% hand)) count <- count + 1 # or match("ace",hand)
}
print(count / n) # 0.658559