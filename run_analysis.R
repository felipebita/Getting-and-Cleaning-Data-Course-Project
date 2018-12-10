library(dplyr)


features <- read.table("features.txt")

###### Train Data and Subject Names ######

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")


names(x_train) <- features[,2]
train_data <- cbind(subject_train, y_train, x_train)
names(train_data)[1:2] <- c("subject","activity")

###### Test Data and Subject Names ######

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")


names(x_test) <- features[,2]
test_data <- cbind(subject_test, y_test, x_test)
names(test_data)[1:2] <- c("subject","activity")

###### Creating one data set ######

train_data$data <- "train"
test_data$data <- "test"

train_data <- train_data[,c(564, 1:563)]
test_data <- test_data[,c(564, 1:563)]

full_data <- bind_rows(train_data, test_data)

###### Mean and Standard Deviation ######

meannames <- grep("mean", names(full_data))
stdnames <- grep("std", names(full_data))
meanstdnames <- sort(append(meannames, stdnames))

MeanStd_data <- select(full_data, 1:3, meanstdnames)

###### Activity Names ######

MeanStd_data$activity <- gsub(1, "walking", MeanStd_data$activity)
MeanStd_data$activity <- gsub(2, "walking_upstairs", MeanStd_data$activity)
MeanStd_data$activity <- gsub(3, "walking_downstairs", MeanStd_data$activity)
MeanStd_data$activity <- gsub(4, "sitting", MeanStd_data$activity)
MeanStd_data$activity <- gsub(5, "standing", MeanStd_data$activity)
MeanStd_data$activity <- gsub(6, "laying", MeanStd_data$activity)

####### Mean table #######

subjact_groups <- group_by(MeanStd_data, subject, activity)
all_means <- summarize_at(subjact_groups, 4:82, mean)


##################################################### RESULTS #####################################################

## Step 5 ##

View(all_means)

write.table(all_means, "step5", row.name=FALSE)










