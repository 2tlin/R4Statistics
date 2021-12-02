cancerData <- read.csv("resources/files/CancerData.txt", stringsAsFactors = FALSE)
# It contains the following variables:
# 1. Sample code number (ID number)
# 2. Clump Thickness (1-10)
# 3. Uniformity of Cell Size (1-10)
# 4. Uniformity of Cell Shape (1-10)
# 5. Marginal Adhesion (1-10)
# 6. Single Epithelial Cell Size (1-10)
# 7. Bare Nuclei (1-10)
# 8. Bland Chromatin (1-10)
# 9. Normal Nucleoli (1-10)
# 10. Mitoses (1-10)
# 11. Class: (2 for benign, 4 for malignant)
# Note that all the variables, apart from the diagnoses and the (unnecessary) ID, are in the same range
# (i.e. 1-10).
# Let’s add these names to the data set:

names(cancerData) <- c("id", "clumpThickness", "uniformityOfCellSize",
"uniformityOfCellShape", "marginalAdhesion", "singleEpithelialCellSize",
"bareNuclei", "blandChromatin", "normalNucleoli", "mitoses", "class")

str(cancerData['bareNuclei'])
str(cancerData$bareNuclei)

# 'data.frame':	698 obs. of  1 variable:
#  $ bareNuclei: chr  "10" "2" "4" "1" ...

# It appears we do have some problems:
# • The ID variable is irrelevant. We can probably remove it.
# • The "bare nuclei data" has been interpreted as which suggests the presence of invalid values.
# • The class(benign or malignan) is represented by 2 and 4,

str(cancerData$id)
# int [1:698] 1002945 1015425 1016277 1017023 1017122 1018099 1018561 1033078 1033078 1035283

# Let’s clean up the dataset a bit. First, we remove the IDs:
cancerData$id <- NULL
str(cancerData)
# 'data.frame':	698 obs. of  10 variables:
#  $ clumpThickness          : int  5 3 6 4 8 1 2 2 4 1 ...
#  $ uniformityOfCellSize    : int  4 1 8 1 10 1 1 1 2 1 ...
#  $ uniformityOfCellShape   : int  4 1 8 1 10 1 2 1 1 1 ...
#  $ marginalAdhesion        : int  5 1 1 3 8 1 1 1 1 1 ...
#  $ singleEpithelialCellSize: int  7 2 3 2 7 2 2 2 2 1 ...
#  $ bareNuclei              : chr  "10" "2" "4" "1" ...
#  $ blandChromatin          : int  3 3 3 3 9 3 3 1 2 3 ...
#  $ normalNucleoli          : int  2 1 7 1 7 1 1 1 1 1 ...
#  $ mitoses                 : int  1 1 1 1 1 1 1 5 1 1 ...
#  $ class                   : int  2 2 2 2 4 2 2 2 2 2 ...

# Next, let’s make the “bare nuclei” data numeric. Any values that can’t be converted into the numeric data
# will be receive the values of ‘NA’, which R interprets as missing data it can ignore. We do so with the
# as.numeric function:
cancerData$bareNuclei <- as.numeric(cancerData$bareNuclei)

## Warning: NAs introduced by coercion
# Because we will be running predictions, and we can’t predict on missing data, we need to remove all rows
# with missing data. This is done relatively easily in R:
cancerData <- cancerData[complete.cases(cancerData), ]

str(cancerData$bareNuclei)
 # num [1:698] 10 2 4 1 10 10 1 1 1 1 ...

# Let’s also change “class” values 2 and 4 into “for the data”clean-up" stage, let’s transform classes of 2 and 4
# into “benign” and “malignant” and turn the data into a factor:
cancerData$class <- factor(ifelse(cancerData$class == 2, "benign", "malignant"))

# Assignment
# To receive the grade of 70 points, you need to do the following:
# 1. Download and install the library called "class"
# 2. Familiarize yourself with the k-nearest neighbors classification
# 3. Perform the k-nearest neighbors classification
# • Hint: command is "knn"
# • Run it on the training set and training outcomes
# • Set the number of neighboring data points (the k) to be 21 (the square root of the number of
# training examples (477)
# • Command should be as follows:
# “‘r library(class) predict <- knn(train = trainingSet, cl = trainingOutcomes, k = 21, test = testSet)
# “‘
# 4. Familiarize yourself with the contents of the "predict" object
# 5. Evaluate the effectiveness of the model
# 6. Prepare the report on your findings
# To receive the additional 30 points, you need to do
# 4. Familiarize yourself with the contents of the "predict" object
# 5. Evaluate the effectiveness of the model

# p <- 0.7
# train.index <- sample.int(nrow(cancerData), nrow(cancerData) * p) # sample int numbers
# str(train.index)
# # int [1:545] 316 219 256 241 33 136 159 289 308 642 ...
# summary(train.index) # check observations
#    # Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#    #  1.0   180.0   347.0   344.7   512.0   682.0
# cancerData.trainSet <- cancerData[train.index, 1:9] # training set
# cancerData.valSet <- cancerData[-train.index, 1:9] # validation set
#
# str(cancerData.trainSet)
# # 'data.frame':	477 obs. of  10 variables:
# #  $ clumpThickness          : int  4 5 1 3 3 2 3 1 1 1 ...
# #  $ uniformityOfCellSize    : int  6 1 1 1 1 1 1 1 1 1 ...
# #  $ uniformityOfCellShape   : int  6 1 1 1 1 1 1 1 1 1 ...
# #  $ marginalAdhesion        : int  5 1 1 1 1 1 1 1 1 1 ...
# #  $ singleEpithelialCellSize: int  7 2 2 2 2 2 1 1 2 1 ...
# #  $ bareNuclei              : num  6 1 1 1 2 1 1 1 1 1 ...
# #  $ blandChromatin          : int  7 2 1 1 7 1 2 1 2 1 ...
# #  $ normalNucleoli          : int  7 1 1 1 1 1 1 3 1 1 ...
# #  $ mitoses                 : int  3 1 1 1 1 1 1 1 1 1 ...
# #  $ class                   : Factor w/ 2 levels "benign","malignant": 2 1 1 1 1 1 1 1 1 1 ...
#
# str(cancerData.valSet)
# # 'data.frame':	205 obs. of  10 variables:
# #  $ clumpThickness          : int  3 1 1 4 7 10 3 5 3 3 ...
# #  $ uniformityOfCellSize    : int  1 1 1 1 3 5 1 2 2 1 ...
# #  $ uniformityOfCellShape   : int  1 1 1 1 2 5 1 3 1 1 ...
# #  $ marginalAdhesion        : int  1 1 1 1 10 3 1 4 1 1 ...
# #  $ singleEpithelialCellSize: int  2 1 2 2 5 6 2 2 1 1 ...
# #  $ bareNuclei              : num  2 1 3 1 10 7 1 7 1 1 ...
# #  $ blandChromatin          : int  3 3 3 3 5 7 2 3 2 2 ...
# #  $ normalNucleoli          : int  1 1 1 1 4 10 1 6 1 1 ...
# #  $ mitoses                 : int  1 1 1 1 4 1 1 1 1 1 ...
# #  $ class                   : Factor w/ 2 levels "benign","malignant": 1 1 1 1 2 2 1 2 1 1 ...
#
# str(cancerData.trainSet$class)
#
# set.seed(1) # for reconstruction the result
#
# # predict <- knn(train = trainingSet, test = testSet, cl = trainingOutcomes, k = 21)
# predict <- knn(train = cancerData.trainSet, # predictors associated with the trainig dataset
#                test = cancerData.valSet, # predictors associated with the validation dataset
#                cl = cancerData.trainSet$class, # class labels for the trainig observations
#                k=21 # number of nearest neighbors to use
# )

# Let’s check on the data again:
str(cancerData)
# 'data.frame':	682 obs. of  10 variables:
#  $ clumpThickness          : int  5 3 6 4 8 1 2 2 4 1 ...
#  $ uniformityOfCellSize    : int  4 1 8 1 10 1 1 1 2 1 ...
#  $ uniformityOfCellShape   : int  4 1 8 1 10 1 2 1 1 1 ...
#  $ marginalAdhesion        : int  5 1 1 3 8 1 1 1 1 1 ...
#  $ singleEpithelialCellSize: int  7 2 3 2 7 2 2 2 2 1 ...
#  $ bareNuclei              : num  10 2 4 1 10 10 1 1 1 1 ...
#  $ blandChromatin          : int  3 3 3 3 9 3 3 1 2 3 ...
#  $ normalNucleoli          : int  2 1 7 1 7 1 1 1 1 1 ...
#  $ mitoses                 : int  1 1 1 1 1 1 1 5 1 1 ...
#  $ class                   : Factor w/ 2 levels "benign","malignant": 1 1 1 1 2 1 1 1 1 1 ...

# This looks much better. We now have 682 complete cases, which we need to separate into the training and the
# # testing set. We can split it a number of ways, for example, 70/30 or 60/40. Let’s split it into approximately
# # 70/30.

# First, split the predictor variables into training and test predictor sets:
trainingSet <- cancerData[1:477, 1:9]
testSet <- cancerData[478:682, 1:9]

# Next, split the diagnoses (benign or malignant) into training and test outcome sets:
trainingOutcomes <- cancerData[1:477, 10]
testOutcomes <- cancerData[478:682, 10]

# Base Assignment
install.packages("gmodels")
library("gmodels")

install.packages('caret')
library(caret)

predict <- knn(train = trainingSet, # predictors associated with the trainig dataset
               test = testSet, # predictors associated with the validation dataset
               cl = trainingOutcomes, # class labels for the trainig observations
               k=21 # number of nearest neighbors to use
)

str(predict)



CrossTable(x=testOutcomes, y=predict, prop.chisq=FALSE)

# Extra Assignment
confusion.table = table(testOutcomes, predict) # confusion matrix

TN <- confusion.table[1] # True Negative case
FN <- confusion.table[2] # False Negative case
FP <- confusion.table[3] # False Positive case
TP <- confusion.table[4] # True Positive case

accuracy <- (TP + TN) / sum(confusion.table)
precision <-  (TP) / (TP + FP)
sensitivity <- (TP) / (TP + FN)
specifity <- (TN) / (TN + FP)

message(sprintf("accuracy = %d, precision = %d, sensitivity = %d, specifity = %d",
                accuracy, precision, sensitivity, specifity))

confusionMatrix(CM)



statistics <- function (Actual, Predicted) {
  confusion.table <- table(Actual=Actual, Actual=Predicted)
  results <- list(confusion.table=confusion.table)

  TN <- confusion.table[1] # True Negative case
  FN <- confusion.table[2] # False Negative case
  FP <- confusion.table[3] # False Positive case
  TP <- confusion.table[4] # True Positive case

  results$accuracy <- (TP + TN) / sum(confusion.table)
  results$precision <-  (TP) / (TP + FP)
  results$sensitivity <- (TP) / (TP + FN)
  results$specifity <- (TN) / (TN + FP)

  return(results)
}

statistics2 <- function (Actual, Predicted) {
  confusion.table <- table(Actual=Actual, Actual=Predicted)
  results <- list()

  TN <- confusion.table[1] # True | Negative case
  FN <- confusion.table[2] # False | Negative case
  FP <- confusion.table[3] # False | Positive case
  TP <- confusion.table[4] # True | Positive case

  results$accuracy <- (TP + TN) / sum(confusion.table)
  results$precision <-  (TP) / (TP + FP)
  results$sensitivity <- (TP) / (TP + FN)
  results$specifity <- (TN) / (TN + FP)

  return(results)
}
statistics2(Actual=testOutcomes, Predicted=predict)

my.stats <- statistics(Actual=testOutcomes, Predicted=predict)
print(my.stats['accuracy'])

#First Attempt to Determine Right K####
predict.accum <- numeric()
for (i in 1:21){
  predict.mod <- knn(train = trainingSet, test = testSet, cl = trainingOutcomes, k = i)
  confusion.table <- table(testOutcomes, predict.mod)
  accuracy = (sum(diag(confusion.table)))/sum(confusion.table)
  message(sprintf("Current k = %d with accuracy =  %s", i, accuracy))
  predict.accum <- c(predict.accum, accuracy)
}

plot(predict.accum,type="l",ylab="Accuracy", xlab="K", main="Accuracy rate for Cancer Predicts With Varying K")

# Optimal k = 10

normalization <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

cancerData_norm <- as.data.frame(lapply(cancerData[, 1:9], normalization))

str(cancerData_norm)
trainingSet <- cancerData_norm[1:477, 1:9]
testSet <- cancerData_norm[478:682, 1:9]

trainingOutcomes <- cancerData[1:477, 10]
testOutcomes <- cancerData[478:682, 10]


#
# str(predict)
#
#
#
# CrossTable(x=testOutcomes, y=predict, prop.chisq=FALSE)

# Extra Assignment
confusion.table2 = table(testOutcomes, predict2) # confusion matrix

TN <- confusion.table2[1] # True Negative case
FN <- confusion.table2[2] # False Negative case
FP <- confusion.table2[3] # False Positive case
TP <- confusion.table2[4] # True Positive case

accuracy <- (TP + TN) / sum(confusion.table)
precision <-  (TP) / (TP + FP)
sensitivity <- (TP) / (TP + FN)
specifity <- (TN) / (TN + FP)

message(sprintf("accuracy = %s, precision = %s, sensitivity = %s, specifity = %s",
                accuracy, precision, sensitivity, specifity))



statistics <- function (Actual, Predicted) {
  confusion.table <- table(Actual=Actual, Actual=Predicted)
  results <- list(confusion.table=confusion.table)

  TN <- confusion.table[1] # True Negative case
  FN <- confusion.table[2] # False Negative case
  FP <- confusion.table[3] # False Positive case
  TP <- confusion.table[4] # True Positive case

  results$accuracy <- (TP + TN) / sum(confusion.table)
  results$precision <-  (TP) / (TP + FP)
  results$sensitivity <- (TP) / (TP + FN)
  results$specifity <- (TN) / (TN + FP)

  return(results)
}


predict10 <- knn(train = trainingSet, test = testSet, cl = trainingOutcomes, k = 10)
predict13 <- knn(train = trainingSet, test = testSet, cl = trainingOutcomes, k = 13)

statistics(Actual=testOutcomes, Predicted=predict10)
# statistics(Actual=testOutcomes, Predicted=predict13)
