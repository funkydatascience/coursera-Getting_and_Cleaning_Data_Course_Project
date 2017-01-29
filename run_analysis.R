# step 001: install and load required libraries if not already done so, uncomment statements below if must
#install.packages("dplyr")
#install.packages("reshape")
library(dplyr)
library(reshape)
df.packages <-data.frame(installed.packages(.Library))
write.table(df.packages, "r-packages.txt")

# step 002: set or change working directory
setwd("~/Documents/coursera/session03/peer_assignment/peer-project")

# step 003: download data file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "Human+Activity+Recognition+Using+Smartphones-dataset-201701282211.zip")

# step 004: unzip data file
unzip("Human+Activity+Recognition+Using+Smartphones-dataset-201701282211.zip")

# step 005: a list of files, convenient to reference later
df.data.files <- data.frame(files=dir("./UCI HAR Dataset", recursive = TRUE))

# step 006: load data files to data frames

# reading activity labels
df.activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# reading feature labels
df.features <- read.table("./UCI HAR Dataset/features.txt")

# reading training data
df.y.train <- read.table("./UCI HAR Dataset/train/y_train.txt")
df.X.train <- read.table("./UCI HAR Dataset/train/X_train.txt")
df.subject.train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# reading test data
df.y.test <- read.table("./UCI HAR Dataset/test/y_test.txt")
df.X.test <- read.table("./UCI HAR Dataset/test/X_test.txt")
df.subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# step 007: assign labels to dataframes for convenience

# assign labels to dataframes
names(df.activity.labels) <- c("activity.id", "activity.label")
names(df.features) <- c("feature.id", "feature.label")
names(df.X.train) <- df.features$feature.label
names(df.X.test) <- df.features$feature.label
names(df.y.train) <- c("target")
names(df.y.test) <- c("target")
names(df.subject.train) <- c("subject")
names(df.subject.test) <- c("subject")

# step 008: translating the target variable y to activity label text

# combining target identifier to activity.label, the label provided in the activity_labels dataset is used
# the variable is renamed to target indicating it is the dependant variable
df.y.train.text <- merge (df.y.train, df.activity.labels, by.x="target", by.y="activity.id") %>% select(target=activity.label)
df.y.test.text <- merge (df.y.test, df.activity.labels, by.x="target", by.y="activity.id") %>% select(target=activity.label)

# step 009: combining training data to one data set

# transforming the training set to one dataset
df.train.all <- cbind(df.X.train, subject=df.subject.train, target=df.y.train.text)
#names(df.train.all)

# step 010: combining test data to one data set

# transforming the test set to one dataset
df.test.all <- cbind(df.X.test, subject=df.subject.test, target=df.y.test.text)
#names(df.test.all)

# step 011: combining training and test data into one dataset

# combining training and test sets to one dataset
df.all <- rbind(df.train.all, df.test.all)
#names(df.all)

# step 012: projecting only columns containing a mean or standard deviation
#           note, included subject and target as well

# filters variable containing a mean or standard deviation. included subject and target as well
df.mean.and.sd <- df.all[, c(grep( "-mean\\(|-std\\()", names(df.all), value=TRUE, ignore.case=TRUE), "subject", "target")]
# names(df.mean.and.sd)

# step 013: calculating the mean for all measures over grouping by subject and target

# melt the data, grouping by subject and target as the key
df.melt <- melt(df.mean.and.sd, id.vars=c("subject","target"))
# cast by applying the mean to all non key/group variables
df.cast <- cast(df.melt, subject + target ~ variable, mean)

# step 014: making more conprehesible
list.new.names <- sapply( names(df.cast) , function(x) { if ( !(x %in% c("target", "subject")) ) paste0("mean of ", x) else x } )
names(df.cast) <- list.new.names
names(df.cast)[2] <- "activity"
#names(df.cast)
df.names <- data.frame(variable.names=names(df.cast))
write.table(df.names, "tidy-data-variable_names.txt")

write.table(df.cast, "tidy-data.txt", row.name=FALSE)
#df.tidy.data <- read.table("tidy-data.txt", header = TRUE)





