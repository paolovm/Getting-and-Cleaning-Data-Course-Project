---
title: "Code Book"
author: "Paolo Malafaia"
date: "December 28, 2018"
output: html_document
---

## Full_Data
In general this is a dataset with the full information from the source experiment. The full info can be found on their website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

For our purposes the set of variables that were filtered from the original data source are:

* mean: Mean value
* std: Standard deviation

For each record its also provided

* Its activity label. 
* An identifier of the subject who carried out the experiment.

## Average_Data
For each unique combination of subject and activity this dataset will provide the averages extracted from full_data.
The columns that identify the record are:

* SubActivity
* Activity_ID
* Activity_Desc
* Subject_ID

The remaining columns are exactly the same as in the full_table, but with the addition of the "SubActMEAN_"" prefix to identify that this is a transformation. The full list is:

* SubActMEAN_tBodyAcc-mean()-X
* SubActMEAN_tBodyAcc-mean()-Y
* SubActMEAN_tBodyAcc-mean()-Z
* SubActMEAN_tBodyAcc-std()-X
* SubActMEAN_tBodyAcc-std()-Y
* SubActMEAN_tBodyAcc-std()-Z
* SubActMEAN_tGravityAcc-mean()-X
* SubActMEAN_tGravityAcc-mean()-Y
* SubActMEAN_tGravityAcc-mean()-Z
* SubActMEAN_tGravityAcc-std()-X
* SubActMEAN_tGravityAcc-std()-Y
* SubActMEAN_tGravityAcc-std()-Z
* SubActMEAN_tBodyAccJerk-mean()-X
* SubActMEAN_tBodyAccJerk-mean()-Y
* SubActMEAN_tBodyAccJerk-mean()-Z
* SubActMEAN_tBodyAccJerk-std()-X
* SubActMEAN_tBodyAccJerk-std()-Y
* SubActMEAN_tBodyAccJerk-std()-Z
* SubActMEAN_tBodyGyro-mean()-X
* SubActMEAN_tBodyGyro-mean()-Y
* SubActMEAN_tBodyGyro-mean()-Z
* SubActMEAN_tBodyGyro-std()-X
* SubActMEAN_tBodyGyro-std()-Y
* SubActMEAN_tBodyGyro-std()-Z
* SubActMEAN_tBodyGyroJerk-mean()-X
* SubActMEAN_tBodyGyroJerk-mean()-Y
* SubActMEAN_tBodyGyroJerk-mean()-Z
* SubActMEAN_tBodyGyroJerk-std()-X
* SubActMEAN_tBodyGyroJerk-std()-Y
* SubActMEAN_tBodyGyroJerk-std()-Z
* SubActMEAN_tBodyAccMag-mean()
* SubActMEAN_tBodyAccMag-std()
* SubActMEAN_tGravityAccMag-mean()
* SubActMEAN_tGravityAccMag-std()
* SubActMEAN_tBodyAccJerkMag-mean()
* SubActMEAN_tBodyAccJerkMag-std()
* SubActMEAN_tBodyGyroMag-mean()
* SubActMEAN_tBodyGyroMag-std()
* SubActMEAN_tBodyGyroJerkMag-mean()
* SubActMEAN_tBodyGyroJerkMag-std()
* SubActMEAN_fBodyAcc-mean()-X
* SubActMEAN_fBodyAcc-mean()-Y
* SubActMEAN_fBodyAcc-mean()-Z
* SubActMEAN_fBodyAcc-std()-X
* SubActMEAN_fBodyAcc-std()-Y
* SubActMEAN_fBodyAcc-std()-Z
* SubActMEAN_fBodyAccJerk-mean()-X
* SubActMEAN_fBodyAccJerk-mean()-Y
* SubActMEAN_fBodyAccJerk-mean()-Z
* SubActMEAN_fBodyAccJerk-std()-X
* SubActMEAN_fBodyAccJerk-std()-Y
* SubActMEAN_fBodyAccJerk-std()-Z
* SubActMEAN_fBodyGyro-mean()-X
* SubActMEAN_fBodyGyro-mean()-Y
* SubActMEAN_fBodyGyro-mean()-Z
* SubActMEAN_fBodyGyro-std()-X
* SubActMEAN_fBodyGyro-std()-Y
* SubActMEAN_fBodyGyro-std()-Z
* SubActMEAN_fBodyAccMag-mean()
* SubActMEAN_fBodyAccMag-std()
* SubActMEAN_fBodyBodyAccJerkMag-mean()
* SubActMEAN_fBodyBodyAccJerkMag-std()
* SubActMEAN_fBodyBodyGyroMag-mean()
* SubActMEAN_fBodyBodyGyroMag-std()
* SubActMEAN_fBodyBodyGyroJerkMag-mean()
* SubActMEAN_fBodyBodyGyroJerkMag-std()



