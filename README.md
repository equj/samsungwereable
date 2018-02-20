# samsungwereable
Testing data from wereables. 
Merges the training and the test sets to create one data set, then extracts 
only the measurements on the mean and standard deviation for each measurement. Uses descriptive activity 
names to name the activities in the data set. Also labels the data set with descriptive variable names, 
removing parentheses, fixin sintaxis and changing names for descriptive names. Finallly creates file with 
tidy data with the average of each variable for each activity and each subject.

The R code works as follows:
Merges training data
Merges test data
Merges training a test data in totalData
Extracts only the columns refering to mean, std, subject identification and activity id
Labels columns with a descriptive name and tidy data by subjectId and activityType ontaining mean
Finally writes tidy data to a file

Used variables are:

features                Used to store feature names from the file features.txt
activityLabels          Used to store activity type from the file activity_labels.txt
subjectTrain            Used to store subject id from the file subject_train.txt
xTrain                  Used to store training data  from the file X_train.txt
yTrain                  Used to store activity type from the file y_train.txt
trainData               stores cbind of yTrain, subjectTrain and xTrain
subjectTest             Used to store subject id from the file subject_test.txt
xTest                   Used to store test data from the file X_test.txt
yTest                   Used to store activity type  from the file y_test.txt
testData                stores cbind of yTest, subjectTest and xTest
totalData               stores training and test data 
meanstdMeasurements     stores mean and std columns data
tidydata                stores tydy data before write to a file
