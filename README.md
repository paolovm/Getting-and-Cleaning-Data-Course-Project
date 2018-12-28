---
title: "Run Analysis - Read Me"
author: "Paolo Malafaia"
date: "December 28, 2018"
output: html_document
---

## Objective
Complete the requirements for the Getting and Cleaning Data course in Coursera. The following are the requirements

"You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."

## Data Sources
The source data is split between master data. The last two have very similar structures. 

### Master Data
* activity labels: the code and description of the activities available
* features: list of all the variables measured in the experiment

### Training
* subject_train: list of individuals in training partition
* X_train: list of measures in training partition.
* y_train list of activities in training partition

### Test
* subject_test:list of individuals in test partition
* X_test:list of measures in test partition
* y_test:list of activities in test partition




## Steps to create one tidy data set full_data (requirements 1, 2, 3 and 4) 

* read all the 8 different data sources listed above in different objects
* create a link between the activities (y file in each partition) with their descriptions (activity labels in master data)
* create a link between the columns in the data file (x file in each partition) with the variables name in the features file from master data
* filter all the variables that realted to either mean and SD variables using regular expressions
* combine the data, subject and activity files for each partition using the cbind 
* combine the test and train files using rbind




## Steps to create new data set with averages for subject and activity (requirement 5)
* add a variable that combines subject id and activity id in a single column - SUBACTIVITY
* using the unique function in SUBACTIVITY create a new table which will be the final output
* the above table initially contains only the unique combinations of SUBACTIVITY plus individual columns for the subject id, activity id and activity description for reference
* loop through the column names of the measured variables and for each: 
        + use a temporary empty table to store each iteration
        + use tapply to get the mean of the vector with that column name splitting the result by SubActivity field
        + add the sequence of SubActivity in this specific column to the temporary table
        + merge the temporary table (list of means, subactivity) with the final output using the subactivity as the key
* arrange the result of the above loop 

## Output Objects
### Full_Data
This is the merge of the original 6 raw files which contains subject, activity, activity description and the means and sd deviation for each of the measures in the original study

### Average_Data
This is table contains the average of each variable for each of the existing combinations of activity and subject
