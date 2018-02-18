setwd("~/Google Drive/asuntos academicos/datascience/getting and cleaning data/week 4/trabajo del curso/UCI HAR Dataset")

# 1. Merges the training and the test sets to create one data set.
# Merging training data
features      <- read.table("./features.txt",header=FALSE)
activityLabels <- read.table("./activity_labels.txt",header=FALSE)
subjectTrain  <-read.table("./train/subject_train.txt", header=FALSE)
xTrain        <- read.table("./train/X_train.txt", header=FALSE)
yTrain        <- read.table("./train/y_train.txt", header=FALSE)

colnames(activityLabels)<-c("activityId","activityType")
colnames(subjectTrain) <- "subjectId"
colnames(xTrain) <- features[,2]
colnames(yTrain) <- "activityId"

trainData <- cbind(yTrain,subjectTrain,xTrain)

# merging test Data
subjectTest    <-read.table("./test/subject_test.txt", header=FALSE)
xTest         <- read.table("./test/X_test.txt", header=FALSE)
yTest         <- read.table("./test/y_test.txt", header=FALSE)

colnames(subjectTest) <- "subjectId"
colnames(xTest) <- features[,2]
colnames(yTest) <- "activityId"

testData <- cbind(yTest,subjectTest,xTest)


#Merging training and test data
totalData <- rbind(trainData,testData)
colNames <- colnames(totalData);


# 2. Extracts only the measurements on the mean and standard deviation for each measurement
#    includes subjectId and ActivityId
meanstdMeasurements <-totalData[,grepl("mean|std|sub|activityId",colnames(totalData))]

#3. #Uses descriptive activity names to name the activities in the data set
library(plyr)
meanstdMeasurements <- join(meanstdMeasurements, activityLabels, by = "activityId", match = "first")
meanstdMeasurements <-meanstdMeasurements[,-1]

#4. Appropriately labels the data set with descriptive variable names.
#   Remove parentheses and fix sintaxis
names(meanstdMeasurements) <- gsub("\\(|\\)", "", names(meanstdMeasurements), perl  = TRUE)
names(meanstdMeasurements) <- make.names(names(meanstdMeasurements))

# Replacing for descriptive names
names(meanstdMeasurements) <- gsub("Acc", "Acceleration", names(meanstdMeasurements))
names(meanstdMeasurements) <- gsub("^t", "Time", names(meanstdMeasurements))
names(meanstdMeasurements) <- gsub("^f", "Frequency", names(meanstdMeasurements))
names(meanstdMeasurements) <- gsub("BodyBody", "Body", names(meanstdMeasurements))
names(meanstdMeasurements) <- gsub("mean", "Mean", names(meanstdMeasurements))
names(meanstdMeasurements) <- gsub("std", "Std", names(meanstdMeasurements))
names(meanstdMeasurements) <- gsub("Freq", "Frequency", names(meanstdMeasurements))
names(meanstdMeasurements) <- gsub("Mag", "Magnitude", names(meanstdMeasurements))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata<- ddply(meanstdMeasurements, .(subjectId, activityType), numcolwise(mean))
write.table(tidydata,file="tidydata.txt", row.names = FALSE)
