Code Book for the tidy data set


This code book describes the procedure used to obtain the tidy data set from the accelerometer training and test datasets, and describes the variables used in the tidy data set.

## Procedure
The R script run_analysis.R is used to generate the tidy data set. The R script does the following steps:
* Step 1: Merges the training and the test sets to create one data set 
 - The training and test datasets are read into memory,and are merged using rbind().
 - The corresponding subject numbers are read in and merged using rbind(). This column is then given the name "Subject".
 - The activity labels are also read in and merged using rbind(). This column is then given the name "Activity".
 - The activity names are read in from the features.txt. These are used to name the columns in the merged dataset.
 - Finally, the subjects, activities, and data are merged using cbind().
* Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
 - The variables with mean or sd in their names are extracted from the merged dataset.
* Step 3: Uses descriptive activity names to name the activities in the data set.
 - The list of activity names is obtained by reading in activity_labels.txt.
 - The activity numbers in the "Activity" column are converted to factors using the activity label names as levels.
* Step 4: Appropriately labels the data set with descriptive variable names.
 - Each column gets its name from features.txt. These variables are described in features_info.txt.
* Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
 - This is done using the aggregate() function, and the final tidy data set is obtained.
 - The columns in this tidy data set are then appropriately named.
 - The tidy data set is then written out into tidy_data_set.txt file.

##Variable Descriptions
There are 81 columns in the tidy data set, described as follows.
* Subject - The test subject number, from 1 to 30.
* Activity - The activity being performed. There are 6 categories:
           - WALKING
           - WALKING_UPSTAIRS
           - WALKING_DOWNSTAIRS
           - SITTING
           - STANDING
           - LAYING
The remaining 79 columns represent data that has been averaged for each activity and each subject, hence the variables start with AVG. Descriptions of the original variables appear in features_info.txt.
Variables with mean() in their names represent mean values of measurements, and variables with sd() in their names represent standard deviation measurements. X, Y and Z represent which axis of linear acceleration or which axis of rotation the accelerometer or gyroscope is measuring.
* AVG-tBodyAcc-mean()-X
* AVG-tBodyAcc-mean()-Y
* AVG-tBodyAcc-mean()-Z
* AVG-tBodyAcc-std()-X
* AVG-tBodyAcc-std()-Y
* AVG-tBodyAcc-std()-Z
* AVG-tGravityAcc-mean()-X
* AVG-tGravityAcc-mean()-Y
* AVG-tGravityAcc-mean()-Z
* AVG-tGravityAcc-std()-X
* AVG-tGravityAcc-std()-Y
* AVG-tGravityAcc-std()-Z
* AVG-tBodyAccJerk-mean()-X
* AVG-tBodyAccJerk-mean()-Y
* AVG-tBodyAccJerk-mean()-Z
* AVG-tBodyAccJerk-std()-X
* AVG-tBodyAccJerk-std()-Y
* AVG-tBodyAccJerk-std()-Z
* AVG-tBodyGyro-mean()-X
* AVG-tBodyGyro-mean()-Y
* AVG-tBodyGyro-mean()-Z
* AVG-tBodyGyro-std()-X
* AVG-tBodyGyro-std()-Y
* AVG-tBodyGyro-std()-Z
* AVG-tBodyGyroJerk-mean()-X
* AVG-tBodyGyroJerk-mean()-Y
* AVG-tBodyGyroJerk-mean()-Z
* AVG-tBodyGyroJerk-std()-X
* AVG-tBodyGyroJerk-std()-Y
* AVG-tBodyGyroJerk-std()-Z
* AVG-tBodyAccMag-mean()
* AVG-tBodyAccMag-std()
* AVG-tGravityAccMag-mean()
* AVG-tGravityAccMag-std()
* AVG-tBodyAccJerkMag-mean()
* AVG-tBodyAccJerkMag-std()
* AVG-tBodyGyroMag-mean()
* AVG-tBodyGyroMag-std()
* AVG-tBodyGyroJerkMag-mean()
* AVG-tBodyGyroJerkMag-std()
* AVG-fBodyAcc-mean()-X
* AVG-fBodyAcc-mean()-Y
* AVG-fBodyAcc-mean()-Z
* AVG-fBodyAcc-std()-X
* AVG-fBodyAcc-std()-Y
* AVG-fBodyAcc-std()-Z
* AVG-fBodyAcc-meanFreq()-X
* AVG-fBodyAcc-meanFreq()-Y
* AVG-fBodyAcc-meanFreq()-Z
* AVG-fBodyAccJerk-mean()-X
* AVG-fBodyAccJerk-mean()-Y
* AVG-fBodyAccJerk-mean()-Z
* AVG-fBodyAccJerk-std()-X
* AVG-fBodyAccJerk-std()-Y
* AVG-fBodyAccJerk-std()-Z
* AVG-fBodyAccJerk-meanFreq()-X
* AVG-fBodyAccJerk-meanFreq()-Y
* AVG-fBodyAccJerk-meanFreq()-Z
* AVG-fBodyGyro-mean()-X
* AVG-fBodyGyro-mean()-Y
* AVG-fBodyGyro-mean()-Z
* AVG-fBodyGyro-std()-X
* AVG-fBodyGyro-std()-Y
* AVG-fBodyGyro-std()-Z
* AVG-fBodyGyro-meanFreq()-X
* AVG-fBodyGyro-meanFreq()-Y
* AVG-fBodyGyro-meanFreq()-Z
* AVG-fBodyAccMag-mean()
* AVG-fBodyAccMag-std()
* AVG-fBodyAccMag-meanFreq()
* AVG-fBodyBodyAccJerkMag-mean()
* AVG-fBodyBodyAccJerkMag-std()
* AVG-fBodyBodyAccJerkMag-meanFreq()
* AVG-fBodyBodyGyroMag-mean()
* AVG-fBodyBodyGyroMag-std()
* AVG-fBodyBodyGyroMag-meanFreq()
* AVG-fBodyBodyGyroJerkMag-mean()
* AVG-fBodyBodyGyroJerkMag-std()
* AVG-fBodyBodyGyroJerkMag-meanFreq()
