## Note: This script was tested on a system running Fedora 20. 
## File and directory paths used here may not work on a Windows system.

## Check if data exists. If not, download it.
if(!file.exists("Dataset")) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, destfile = "Dataset.zip", method = "curl")
  unzip("Dataset.zip", exdir = "Dataset") 
}

## STEP 1: Merge the training and the test sets to create one data set.

## Read in the training set and test set
training_set <- read.table("Dataset/UCI HAR Dataset/train/X_train.txt")
test_set <- read.table("Dataset/UCI HAR Dataset/test/X_test.txt")

## Read in the training and test activity labels
training_labels <- read.table("Dataset/UCI HAR Dataset/train/y_train.txt")
test_labels <- read.table("Dataset/UCI HAR Dataset/test/y_test.txt")

## Read in the training and test subject data
training_subject <- read.table("Dataset/UCI HAR Dataset/train/subject_train.txt")
test_subject <- read.table("Dataset/UCI HAR Dataset/test/subject_test.txt")

## Read in the feature list to get variable names
features <- read.table("Dataset/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

## Use rbind() to merge the training and test sets and name the columns using variable names in feature list
merged_set <- rbind(training_set, test_set)
names(merged_set) <- features[, 2]

## Use rbind to merge training and test actvity labels and subject data, and name them
merged_labels <- rbind(training_labels, test_labels)
merged_subject <- rbind(training_subject, test_subject)
names(merged_labels) <- "Activity"
names(merged_subject) <- "Subject"

## Finally use cbind to put them all together - Subject number and activity number are first 2 columns
merged_data <- cbind(merged_subject, merged_labels, merged_set)

## STEP 1 COMPLETED

## STEP 2: Extract only the measurements on the mean and standard deviation for each measurement

## Check which columns have mean or std in their names, and extract them from the dataset
## Include the subject number and activity column in this extracted data set
mean_std_columns <- grep('mean|std', names(merged_data))
extracted_data <- merged_data[, c(1, 2, mean_std_columns)]

## STEP 2 COMPLETED

## STEP 3: Use descriptive activity names to name the activities in the data set.

## Get the list of activity names from activity_labels.txt
activity_labels <- read.table("Dataset/UCI HAR Dataset/activity_labels.txt")

## Convert the activity numbers in the extracted dataset into factors, using levels from activity_labels
extracted_data$Activity <- factor(extracted_data$Activity, labels = activity_labels[, 2])

## STEP 3 COMPLETED

## STEP 4: Appropriately label the data set with descriptive variable names.

## This step is taken care of already by using variable names in the feature list

## STEP 4 COMPLETED

## STEP 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Use the aggregate function for this
tidy_data_set <- aggregate(extracted_data[, 3:81], by = list(extracted_data$Subject, extracted_data$Activity), FUN = mean)
names(tidy_data_set)[3:81] <- paste("AVG", names(tidy_data_set)[3:81], sep = "-")
names(tidy_data_set)[1:2] <- c("Subject", "Activity")
write.table(tidy_data_set, "tidy_data_set.txt", row.names = FALSE)

## STEP 5 COMPLETED