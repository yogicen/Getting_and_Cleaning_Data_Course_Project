Juan Desimoni
08/06/2021

## Getting and Cleaning Data - Course Project
**Dataset:** Data.zip.  
**Download URL:** https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  
**Output:** output_data_set_means.csv.

### The dataset "Data.zip" includes the following files:
- "README.txt"
- "features_info.txt": Shows information about the variables used on the feature vector.
- "features.txt": List of all features.
- "activity_labels.txt": Links the class labels with their activity name.
- "train/X_train.txt": Training set.
- "train/y_train.txt": Training labels.
- "test/X_test.txt": Test set.
- "test/y_test.txt": Test labels.

### Variables
- features <- features.txt : 561 rows, 1 column. Features measured in the datasets "X_train" and "X_test". The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
- X_train <- test/X_train.txt: 7352 rows, 561 columns. Recorded features train data.
- X_test <- test/X_test.txt : 2947 rows, 561 columns. Recorded features test data.
- activity_labels <- activity_labels.txt : 6 rows, 1 column. Labels for the activities in "y_train" and "y_test".
- y_train <- test/y_train.txt : 7352 rows, 1 column. Activities that where performed when each measurement was taken in the train set.
- y_test <- test/y_test.txt : 2947 rows, 1 column. Activities that where performed when each measurement was taken in the test set.
- subject_train <- test/subject_train.txt : 7352 rows, 1 column. Which of the 30 volunteers was being tested in each row in the train set.
- subject_test <- test/subject_test.txt : 2947 rows, 1 column. Which of the 30 volunteers was being tested in each row in the test set.

### Processing
1. Download "Dataset.zip" and extract it to the directory "UCI HAR Dataset".
2. Read "features.txt".
3. Read "X_train.txt" and label the columns using the file "features.txt".
4. Read "y_train.txt" as a factor. Te labels for the activities are read from the file "activity_labels.txt".
5. Read "subject_train.txt".
6. Merge "X_train.txt", "y_train.txt" and "subject_train.txt" by columns into a data set named "data_train".
7. Repeat the steps 3, 4, 5 and 6 above with the test set to obtain the data set "data_test".
8. Merge the data sets "data_train" and "data_train" by columns. Name the resulting data set "data_set".
9. Extract the measurements on the mean and standard deviation for each measurement.
10. Label the columns in "data_set" with descriptive names.
11. Create a second data set "data_set_means" with the average of each variable for each activity and each subject.
12. Write the data set "data_set_means" to the file "output_data_set_means.csv".
