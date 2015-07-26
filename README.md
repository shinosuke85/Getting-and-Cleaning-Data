---
title: "Project for Getting and Cleaning data course"
author: "GM"
date: "26/07/2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
The purpose of the project is to demonstrate ability to collect, work with, and clean a data set.

##Study design and data processing

###Collection of the raw data
The data was obtained from the following url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
It was then unzipped and saved in a folder.

##Creating the tidy datafile

###Guide to create the tidy data file
The script "run_analysis.R" cleans the data and produces the final tidy dataset.
To download and run the script run the following code in R, ensuring that the script is in your current working directory: 
```{r}
        source("run_analysis.r")
        run_analysis.r()
```
Please ensure that the following package is installed before running the script: "dplyr"
Please ensure that the data has been unzipped

###Cleaning of the data
The cleaning script is called "run_analysis.R" and is saved in the main data folder described above.

The script does the following:
#### 1. Merge sets and create one data set
* There are 8 different files that need to be read and transformed into data tables:
        + "train/X_train.txt" := training set
        + "train/y_train.txt" := training activity labels
        + "test/X_test.txt" := test set
        + "test/y_test.txt" := test activity labels
        + "train/subject_train.txt" := each row identifies the subject who performed the activity
        + "test/subject_test.txt" := each row identifies the subject who performed the activity
        + "features.txt" := list of all features
        + "activity_labels.txt" := links the class labels (1 to 6) with their activity description
* From these, 6 are merged into a single data set. Namely, 
        + the 2 files corresponding to the training and test measurements; 
        + the 2 files corresponding to the training and test activities, and
        + the 2 files corresponding to the subjects who performed each activity for the training and test sets, added as two additional columns at the beginning of the dataset.
* Dimensions of created datasets are regularly checked to confirm that merging has been done correctly
* Naming of the columns:
        + The first two columns are manually named "subjectid" and "activity"
        + The "features.txt" file is then used to name the rest of the measurement columns of the merged dataset (columns 3 to 68)

#### 2. Extract measurements on mean and standard deviation for each measurement
* Once merged, only the columns which correspond to the measurements on the mean and standard deviation are extracted.
* Used the dplyr package to select the columns which contain the text "mean()" and "std()" in their description.
* Resulting data set has 10,299 rows and 68 columns.

#### 3. Use descriptive activity names to name the activities in the data set
* The activities performed by each subject are represented by numbers in the data set. The file "activity_labels.txt" is used to substitute the numbers for their corresponding descriptive labels (e.g. 1 substituted for WALKING).
* Since the activity labels are numeric, the levels are in the right order by default.

#### 4. Give descriptive variable names to labels in the data set
* A new vector of names is saved to avoid working with the full data set
* The following name changes are made¨
        + removed the "()" after "mean" and "std"
        + removed duplicated "BodyBody" in some variables and substituted for "body"
        + converted all letters to lower case
* The new vector of names is then used to rename the clean dataset columns

#### 5. Create a tidy data set with the average of each variable for each activity and each subject
* The dplyr package and the piping technique is used to:
        + group the dataset by activity and subjectid
        + summarise each of the measurement columns (i.e. from 3 to 68) by calculating the mean of all values for each column
* The tidy dataset is saved in a text file called "tidy_data.txt" using the function write.table


##Sources
Data description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
