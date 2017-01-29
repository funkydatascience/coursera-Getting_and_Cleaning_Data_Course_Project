
# CodeBook related to dataset "tidy-data.txt"

## environment

platform and operating system: Apple MacBook running MacOS 10.12.2
R version: R version 3.3.1 (2016-06-21)
packages: see "r-packages.txt"

## origin, licence and copyright statement of the original dataset

original source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


## origin of the data

* see above origin and license statement
* original dataset is described in a file README.txt, activity\_labels.txt, features.txt, features\_info.txt

## transformations performed on the original data

* following transformations where requested and performed as part of the assigment

1. Merges the training and the test sets to create one data set.

  these activities are executed as part of steps 001 to 011 in script "run_analysis.R"
  
  test and training data is first column wise assembled individually
  
  after that rows are appended

2. Extracts only the measurements on the mean and standard deviation for each measurement.

  these activities where executed as part of step 012 in script "run_analysis.R"
  
  a regular expression is used to filter

3. Uses descriptive activity names to name the activities in the data set

  these activities where executed as part of step 008 in script "run_analysis.R"

  the label (second column) available in activity\_labels.txt is used

4. Appropriately labels the data set with descriptive variable names.

  these activities where executed as part of step 007 in script "run_analysis.R"
  
  this was done early on in the analysis to facilitate data transformation

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

  activities where executed as part of steps 013 and 014 in script "run_analysis.R"

## resulting data set tidy-data.txt consists of variables

* "1" "subject"
* "2" "activity"
* "3" "mean of tBodyAcc-mean()-X"
*"4" "mean of tBodyAcc-mean()-Y"
*"5" "mean of tBodyAcc-mean()-Z"
*"6" "mean of tBodyAcc-std()-X"
*"7" "mean of tBodyAcc-std()-Y"
*"8" "mean of tBodyAcc-std()-Z"
*"9" "mean of tGravityAcc-mean()-X"
*"10" "mean of tGravityAcc-mean()-Y"
*"11" "mean of tGravityAcc-mean()-Z"
*"12" "mean of tGravityAcc-std()-X"
*"13" "mean of tGravityAcc-std()-Y"
*"14" "mean of tGravityAcc-std()-Z"
*"15" "mean of tBodyAccJerk-mean()-X"
*"16" "mean of tBodyAccJerk-mean()-Y"
*"17" "mean of tBodyAccJerk-mean()-Z"
*"18" "mean of tBodyAccJerk-std()-X"
*"19" "mean of tBodyAccJerk-std()-Y"
*"20" "mean of tBodyAccJerk-std()-Z"
*"21" "mean of tBodyGyro-mean()-X"
*"22" "mean of tBodyGyro-mean()-Y"
*"23" "mean of tBodyGyro-mean()-Z"
*"24" "mean of tBodyGyro-std()-X"
*"25" "mean of tBodyGyro-std()-Y"
*"26" "mean of tBodyGyro-std()-Z"
*"27" "mean of tBodyGyroJerk-mean()-X"
*"28" "mean of tBodyGyroJerk-mean()-Y"
*"29" "mean of tBodyGyroJerk-mean()-Z"
*"30" "mean of tBodyGyroJerk-std()-X"
*"31" "mean of tBodyGyroJerk-std()-Y"
*"32" "mean of tBodyGyroJerk-std()-Z"
*"33" "mean of tBodyAccMag-mean()"
*"34" "mean of tBodyAccMag-std()"
*"35" "mean of tGravityAccMag-mean()"
*"36" "mean of tGravityAccMag-std()"
*"37" "mean of tBodyAccJerkMag-mean()"
*"38" "mean of tBodyAccJerkMag-std()"
*"39" "mean of tBodyGyroMag-mean()"
*"40" "mean of tBodyGyroMag-std()"
*"41" "mean of tBodyGyroJerkMag-mean()"
*"42" "mean of tBodyGyroJerkMag-std()"
*"43" "mean of fBodyAcc-mean()-X"
*"44" "mean of fBodyAcc-mean()-Y"
*"45" "mean of fBodyAcc-mean()-Z"
*"46" "mean of fBodyAcc-std()-X"
*"47" "mean of fBodyAcc-std()-Y"
*"48" "mean of fBodyAcc-std()-Z"
*"49" "mean of fBodyAccJerk-mean()-X"
*"50" "mean of fBodyAccJerk-mean()-Y"
*"51" "mean of fBodyAccJerk-mean()-Z"
*"52" "mean of fBodyAccJerk-std()-X"
*"53" "mean of fBodyAccJerk-std()-Y"
*"54" "mean of fBodyAccJerk-std()-Z"
*"55" "mean of fBodyGyro-mean()-X"
*"56" "mean of fBodyGyro-mean()-Y"
*"57" "mean of fBodyGyro-mean()-Z"
*"58" "mean of fBodyGyro-std()-X"
*"59" "mean of fBodyGyro-std()-Y"
*"60" "mean of fBodyGyro-std()-Z"
*"61" "mean of fBodyAccMag-mean()"
*"62" "mean of fBodyAccMag-std()"
*"63" "mean of fBodyBodyAccJerkMag-mean()"
*"64" "mean of fBodyBodyAccJerkMag-std()"
*"65" "mean of fBodyBodyGyroMag-mean()"
*"66" "mean of fBodyBodyGyroMag-std()"
*"67" "mean of fBodyBodyGyroJerkMag-mean()"
*"68" "mean of fBodyBodyGyroJerkMag-std()"

## description of the variable names of above

* activity: target dependent variable originates from original datasets y\_train.txt and y\_test.txt translated via activity\_labels.txt

* subject: originates from original datasets subject_test.txt for test and training data as such

* variables whose name starts with "mean of": are the mean by subject and activity of the referred original variables in their respective units, see original datasets, explained in features.txt, features\_info.txt