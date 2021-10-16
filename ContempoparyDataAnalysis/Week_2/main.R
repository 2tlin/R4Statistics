data <- read.table("../../resources/files/MakingFakeData.txt", sep="")
dataTransponed <- t(data) # Transpose
dataTransformed <- (dataTransponed + 10) * 10 # Transform all values to be above zero

# Let’s look at the data:
plot(seq(1,length(dataTransformed[,1]),1),dataTransformed[,1],xlab = "time unit",ylab = "amplitude",pch = 19)
lines(seq(1,length(dataTransformed[,1]),1),dataTransformed[,2],lwd=7)