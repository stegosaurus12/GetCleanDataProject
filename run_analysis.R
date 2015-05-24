library(dplyr)
library(plyr)

#read in training and test sets, note that file paths may be slightly different for other users
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")

#read in features, subjects, and activity labels
features <- read.table("Downloads/UCI HAR Dataset/features.txt")
subjectTrain <- read.table("Downloads/UCI HAR Dataset/train/subject_train.txt")
subjectTest <- read.table("Downloads/UCI HAR Dataset/test/subject_test.txt")
activity <- read.table("Downloads/UCI HAR Dataset/activity_labels.txt")

#combine training set together
#combine data
alldata <- rbind(xtrain, xtest)
#add features to data as column names
colnames(alldata) <- features$V2
#combine labels
allLabels <- rbind(ytrain, ytest)
#add activity labels to number labels
newlabels <- join(allLabels, activity, by = "V1")
#combine all subjects
allsubjects <- rbind(subjectTrain, subjectTest)
#combine all into 1 table
mergedData <- cbind(allsubjects, newlabels, alldata)
#rename first 3 column names
colnames(mergedData)[1:3] <- c("Subject", "ActivityCode", "Activity")

#remove columns with duplicated names (none of these refer to mean or sd)
mergedData <- mergedData[,!(duplicated(names(mergedData)))]
#extract only columns referr
dataMean <- select(mergedData, contains("mean()"))
dataSD <- select(mergedData, contains("std"))
dataMeanSD <- cbind(dataMean, dataSD)
#reorder columns alphabetically so mean is close to std for each measurement
dataMeanSD <- dataMeanSD[, order(names(dataMeanSD))]

#add back in the subject and activity to dataframe
tidydata <- cbind(mergedData[c(1,3)], dataMeanSD)

write.table(tidydata, "tidydata_course_project.txt", row.names = FALSE, col.names = TRUE, sep = "\t")
