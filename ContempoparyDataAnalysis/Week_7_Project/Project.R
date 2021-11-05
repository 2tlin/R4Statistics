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
# 11. Class: (2 for benign (доброкачественный), 4 for malignant (злокачественный))
# Note that all the variables, apart from the diagnoses and the (unnecessary) ID, are in the same range
# (i.e. 1-10).
# Let’s add these names to the data set:

names(cancerData) <- c("id", "clumpThickness", "uniformityOfCellSize",
"uniformityOfCellShape", "marginalAdhesion", "singleEpithelialCellSize",
"bareNuclei", "blandChromatin", "normalNucleoli", "mitoses", "class")

# Let’s check the data to see if we have any issues
str(cancerData)
# 'data.frame':	698 obs. of  11 variables:
#  $ id                      : int  1002945 1015425 1016277 1017023 1017122 1018099 1018561 1033078 1033078 1035283 ...
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

# It appears we do have some problems:
# • The ID variable is irrelevant. We can probably remove it.
# • The "bare nuclei data" has been interpreted aswhich suggests the presence of invalid values.
# • The class(benign or malignan) is represented by 2 and 4, and we should probably recode that.

# Let’s clean up the dataset a bit. First, we remove the IDs:
cancerData$id <- NULL

# Next, let’s make the “bare nuclei” data numeric. Any values that can’t be converted into the numeric data
# will be receive the values of ‘NA’, which R interprets as missing data it can ignore. We do so with the
# as.numeric function:
cancerData$bareNuclei <- as.numeric(cancerData$bareNuclei)

## Warning: NAs introduced by coercion
# Because we will be running predictions, and we can’t predict on missing data, we need to remove all rows
# with missing data. This is done relatively easily in R:

cancerData <- cancerData[complete.cases(cancerData), ]

# Let’s also change “class” values 2 and 4 into “for the data”clean-up" stage, let’s transform classes of 2 and 4
# into “benign” and “malignant” and turn the data into a factor:
cancerData$class <- factor(ifelse(cancerData$class == 2, "benign", "malignant"))

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
#  $ class                   : Factor w/ 2 levels "benign","malignant": 1

# This looks much better. We now have 682 complete cases, which we need to separate into the training and the
# testing set. We can split it a number of ways, for example, 70/30 or 60/40. Let’s split it into approximately
# 70/30.

# First, split the predictor variables into training and test predictor sets:
trainingSet <- cancerData[1:477, 1:9]
testSet <- cancerData[478:682, 1:9]

# Next, split the diagnoses (benign or malignant) into training and test outcome sets:
trainingOutcomes <- cancerData[1:477, 10]
testOutcomes <- cancerData[478:682, 10]

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

# Decision:
# 1. Download and install the library called "class"
install.packages("class") #установка пакета "class"
library(class) #загрузка пакета "class" в среду R

# 2. Familiarize yourself with the k-nearest neighbors classification

# 3. Perform the k-nearest neighbors classification
# • Hint: command is "knn"
# • Run it on the training set and training outcomes
# • Set the number of neighboring data points (the k) to be 21 (the square root of the number of
# training examples (477)

predict <- knn(train = trainingSet, cl = trainingOutcomes, k = 21, test = testSet)

# 4. Familiarize yourself with the contents of the "predict" object
# 5. Evaluate the effectiveness of the model