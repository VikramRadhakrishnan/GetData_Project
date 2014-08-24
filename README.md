GetData_Project
===============

This is the repository containing project work for the Getting and Cleaning Data course on Coursera.
## List of files
* run_analysis.R - R script which will create a tidy data set from the Human Activity Recognition training and test datasets, taken from the  UCI machine learning repository. The script will generate a tidy data set called tidy_data_set.txt in the same directory as the R script. The raw dataset was downloaded from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* CodeBook.md - A file explaining the procedure used by run_analysis.R, and describing the variables that appear in tidy_data_set.txt.
* README.md - This readme file.

## Procedure to generate tidy data set
* Simply run the script run_analysis.R in the directory where you want the tidy data set to be generated. If the Dataset directory is not present already in this directory, the dataset zip file will be downloaded from the internet and extracted into the current working directory and then used to generate the tidy data set.
