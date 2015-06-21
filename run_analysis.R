# Load the necessary libraries
library(dplyr)
library(reshape2)

# Step 1: Merge the training and the test sets to create one data set
# -------------------------------------------------------------------
# Read the column names from the features file
features_DF <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", colClasses = "character")
colNames_VCT <- features_DF[,2]
# Remove the "(", ")", "-", "," characters from the feature names
# so they can become legitimate variable names
colNames_VCT <- gsub("(", "", colNames_VCT, fixed=TRUE)
colNames_VCT <- gsub(")", "", colNames_VCT, fixed=TRUE)
colNames_VCT <- gsub("-", "", colNames_VCT, fixed=TRUE)
colNames_VCT <- gsub(",", ".", colNames_VCT, fixed=TRUE)

# Read the test data set
# ----------------------
X_test_DF <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", colClasses = "numeric", header=FALSE, blank.lines.skip = TRUE, fill=TRUE)
colnames(X_test_DF) <- colNames_VCT

y_test_VCT <- scan("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", what = "integer", blank.lines.skip = TRUE) 
subject_test_VCT <- scan("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", what = "integer", blank.lines.skip = TRUE)

# Add the subject number and the activity number columns
X_test_DF["subjectNo"] <- subject_test_VCT
X_test_DF["activityNo"] <- y_test_VCT

# Read the training data set
# --------------------------
X_train_DF <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", colClasses = "numeric", header=FALSE, blank.lines.skip = TRUE, fill=TRUE)
colnames(X_train_DF) <- colNames_VCT

y_train_VCT <- scan("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", what = "integer", blank.lines.skip = TRUE)
subject_train_VCT <- scan("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", what = "integer", blank.lines.skip = TRUE)

# Add the subject number and the activity number columns
X_train_DF["subjectNo"] <- subject_train_VCT
X_train_DF["activityNo"] <- y_train_VCT

# Merge the training and the test data frames
X_merge = merge(X_train_DF, X_test_DF, all=TRUE)

# Step 2: Extract only the measurements on the mean and standard deviation 
# for each measurement
# -------------------------------------------------------------------------
mean_tBodyAcc <- select(X_merge, tBodyAccmeanX:tBodyAccmeanZ)
std_tBodyAcc <- select(X_merge, tBodyAccstdX:tBodyAccstdZ)

mean_tGravityAcc <- select(X_merge, tGravityAccmeanX:tGravityAccmeanZ)
std_tGravityAcc <- select(X_merge, tGravityAccstdX:tGravityAccstdZ)

mean_tBodyAccJerk <- select(X_merge, tBodyAccJerkmeanX:tBodyAccJerkmeanZ)
std_tBodyAccJerk <- select(X_merge, tBodyAccJerkstdX:tBodyAccJerkstdZ)

mean_tBodyGyro <- select(X_merge, tBodyGyromeanX:tBodyGyromeanZ)
std_tBodyGyro <- select(X_merge, tBodyGyrostdX:tBodyGyrostdZ)

mean_tBodyGyroJerk <- select(X_merge, tBodyGyroJerkmeanX:tBodyGyroJerkmeanZ)
std_tBodyGyroJerk <- select(X_merge, tBodyGyroJerkstdX:tBodyGyroJerkstdZ)

mean_tBodyAccMag <- select(X_merge, tBodyAccMagmean)
std_tBodyAccMag <- select(X_merge, tBodyAccMagstd)

mean_tGravityAccMag <- select(X_merge, tGravityAccMagmean)
std_tGravityAccMag <- select(X_merge, tGravityAccMagstd)

mean_tBodyAccJerkMag <- select(X_merge, tBodyAccJerkMagmean)
std_tBodyAccJerkMag <- select(X_merge, tBodyAccJerkMagstd)

mean_tBodyGyroMag <- select(X_merge, tBodyGyroMagmean)
std_tBodyGyroMag <- select(X_merge, tBodyGyroMagstd)

mean_tBodyGyroJerkMag <- select(X_merge, tBodyGyroJerkMagmean)
std_tBodyGyroJerkMag <- select(X_merge, tBodyGyroJerkMagstd)

mean_fBodyAcc <- select(X_merge, fBodyAccmeanX:fBodyAccmeanZ)
std_fBodyAcc <- select(X_merge, fBodyAccstdX:fBodyAccstdZ)

mean_fBodyAccJerk <- select(X_merge, fBodyAccJerkmeanX:fBodyAccJerkmeanZ)
std_fBodyAccJerk <- select(X_merge, fBodyAccJerkstdX:fBodyAccJerkstdZ)

mean_fBodyGyro <- select(X_merge, fBodyGyromeanX:fBodyGyromeanZ)
std_fBodyGyro <- select(X_merge, fBodyGyrostdX:fBodyGyrostdZ)

mean_fBodyAccMag <- select(X_merge, fBodyAccMagmean)
std_fBodyAccMag <- select(X_merge, fBodyAccMagstd)

mean_fBodyBodyAccJerkMag <- select(X_merge, fBodyBodyAccJerkMagmean)
std_fBodyBodyAccJerkMag <- select(X_merge, fBodyBodyAccJerkMagstd)

mean_fBodyBodyGyroMag <- select(X_merge, fBodyBodyGyroMagmean)
std_fBodyBodyGyroMag <- select(X_merge, fBodyBodyGyroMagstd)

mean_fBodyBodyGyroJerkMag <- select(X_merge, fBodyBodyGyroJerkMagmean)
std_fBodyBodyGyroJerkMag <- select(X_merge, fBodyBodyGyroJerkMagstd)

# Step 3: Use descriptive activity names to name the activities in the data set
# -----------------------------------------------------------------------------
activityLabels_DF <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
colnames(activityLabels_DF) <- c("activityNo", "activityName")

# Step 4: Appropriately label the data set with descriptive variable names
# ------------------------------------------------------------------------
# Merge with the activity database
X_merge = merge(X_merge, activityLabels_DF, by.x = "activityNo", all=TRUE)
# Drop the un-necessary "activityNo" column
dropColumns <- c("activityNo")
X_merge[,(names(X_merge) %in% dropColumns)] <- list(NULL)

# Step 5: From the data set in step 4, create a second, independent tidy data set
# with the average of each variable for each activity and each subject
# -------------------------------------------------------------------------------
X_melted <- melt(X_merge, id.vars = c("activityName","subjectNo"))
X_tidy <- dcast(X_melted, activityName+subjectNo~variable, fun.aggregate = mean, na.rm = TRUE)
X_tidy <- arrange(X_tidy, activityName, as.numeric(subjectNo))

# Step 6: Write the tidy data to a txt file created with write.table() using 
# row.name=FALSE
# --------------------------------------------------------------------------
if (!file.exists("tidydata")) {
        dir.create("tidydata")
}
# Write into file with Windows end of line characters
write.table(X_tidy, file = "./tidydata/tidydata.txt", sep=" ", eol = "\r\n", row.names = FALSE)


