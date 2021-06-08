library(dplyr)

URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileName <- "Dataset.zip"
dataDir <- "UCI HAR Dataset"

## Download "Dataset.zip"
if ( !file.exists(fileName) ) {
    download.file(url = URL, destfile = fileName, method = "curl")
}
## Extract it to the directory "UCI HAR Dataset".
if ( !dir.exists(dataDir) ) {
    unzip(fileName)
}

setwd(dataDir)

## Read "features.txt"
features <- read.table("features.txt", colClasses = c("NULL", "character"))[[1]]

### TRAIN ##
## Read "X_train.txt" and label the columns using "features.txt"
X_train <- read.table(file.path("train", "X_train.txt"), colClasses = "numeric")
colnames(X_train) <- features
## Read "y_train.txt" as a factor. Te labels for the activities are read from the file "activity_labels.txt".
y_train <- read.table(file.path("train", "y_train.txt"), colClasses = "integer")[[1]]
activity_labels <- read.table("activity_labels.txt", colClasses = c("NULL", "character"))[[1]]
y_train <- factor(y_train, labels = activity_labels)
## Read "subject_train.txt"
subject_train <- read.table(file.path("train", "subject_train.txt"), colClasses = "integer")[[1]]
subject_train <- factor(subject_train, levels = 1:30)
## Merge "X_train.txt", "y_train.txt" and "subject_train.txt" by columns
data_train <- cbind(subject = subject_train, activity = y_train, X_train)
############

### TEST ###
## Read "X_test.txt" and label the columns using "features.txt"
X_test <- read.table(file.path("test", "X_test.txt"), colClasses = "numeric")
colnames(X_test) <- features
## Read "y_test.txt" as a factor. Te labels for the activities are read from the file "activity_labels.txt".
y_test <- read.table(file.path("test", "y_test.txt"), colClasses = "integer")[[1]]
activity_labels <- read.table("activity_labels.txt", colClasses = c("NULL", "character"))[[1]]
y_test <- factor(y_test, labels = activity_labels)
## Read "subject_test.txt"
subject_test <- read.table(file.path("test", "subject_test.txt"), colClasses = "integer")[[1]]
subject_test <- factor(subject_test, levels = 1:30)
## Merge "X_test.txt", "y_test.txt" and "subject_test.txt" by columns
data_test <- cbind(subject = subject_test, activity = y_test, X_test)
############

## Merge the train and test sets
data_set <- rbind(data_train, data_test)

## Extract the measurements on the mean and standard deviation for each measurement
selectedCols <- c(1, 2, grep("-(mean|std).*", colnames(data_set)))
data_set <- data_set[, selectedCols]

## Label the columns in the data set with descriptive names
colnames(data_set) <- gsub("-mean", "Mean", colnames(data_set))
colnames(data_set) <- gsub("-std", "Std", colnames(data_set))
colnames(data_set) <- gsub("[-()]", "", colnames(data_set))

## Create a second data set with the average of each variable for each activity and each subject
data_set_means <- data_set %>% group_by(subject, activity) %>% summarise_all(mean)

## Write the datasets to csv files
setwd("..")
# write.table(data_set, "output_data_set.txt", row.names = FALSE)
write.table(data_set_means, "output_data_set_means.txt", row.names = FALSE)

