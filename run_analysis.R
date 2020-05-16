####### Peer graded Assignment #######

##### Downloading Zip File #####
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "UCI HAR Dataset.zip")

##### Unzipping the File #####
unzip("UCI HAR Dataset.zip")

##### Reading the data files #####
Activity_Labels <- read.table("UCI HAR Dataset/activity_labels.txt")
Features_Details <- read.table("UCI HAR Dataset/features.txt")
#features_info <- read.table("UCI HAR Dataset/features_info.txt")

# Subject Data
Test_Subject_Data <- read.table("UCI HAR Dataset/test/subject_test.txt")
Train_Subject_Data <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Activity Data
Test_Activity_Data <- read.table("UCI HAR Dataset/test/y_test.txt")
Train_Activity_Data <- read.table("UCI HAR Dataset/train/y_train.txt")

# Features Data
Test_Features_Data <- read.table("UCI HAR Dataset/test/X_test.txt")
Train_Features_Data <- read.table("UCI HAR Dataset/train/X_train.txt")


##### Naming Columns #####
#colnames(Train_Activity_Data) <- "Training Labels"
#colnames(Test_Activity_Data) <- "Testing Labels"
#colnames(Train_Subject_Data) <- "Training Subject ID"
#colnames(Test_Subject_Data) <- "Testing Subject ID"
names(Features_Details) <- c("Sr. No.","Functions")
names(Activity_Labels) <- c("Sr. No.","Activity")

names(Train_Activity_Data) <- "Activity Labels"
names(Test_Activity_Data) <- "Activity Labels"

names(Train_Features_Data) <- Features_Details$Functions
names(Test_Features_Data) <- Features_Details$Functions

names(Train_Subject_Data) <- "Subject ID"
names(Test_Subject_Data) <- "Subject ID"


##### Step 1: Merging Dataset #####
# Combining Activity, Features and Subject Data
Merged_Activity_Data <- rbind(Train_Activity_Data, Test_Activity_Data)
Merged_Features_Data <- rbind(Train_Features_Data, Test_Features_Data)
Merged_Subject_Data <- rbind(Train_Subject_Data, Test_Subject_Data)

#Combining Entire Data
Merged_Data <- cbind(Merged_Subject_Data, Merged_Activity_Data, Merged_Features_Data)


##### Step 2: Extracting Mean and Standard Deviation Functions from Features Deatils
require(xfun)
?grepl
Column_Mean_Std <- grepl("Subject|Labels|mean|std", colnames(Merged_Data))
Merged_Data_Mean_Std <- Merged_Data[,Column_Mean_Std]
View(Merged_Data_Mean_Std)


##### Step 3: Naming Activity Labels #####
Merged_Data_Mean_Std$`Activity Labels` <- factor(Merged_Data_Mean_Std$`Activity Labels`,
                                                 levels = Activity_Labels$`Sr. No.`,
                                                 labels = Activity_Labels$Activity)
View(Merged_Data_Mean_Std)


##### Step 4: Naming Column Name #####
library(xfun)
?gsub
colnames(Merged_Data_Mean_Std) <- gsub("^f", "Frequency", colnames(Merged_Data_Mean_Std))
colnames(Merged_Data_Mean_Std) <- gsub("^t", "Time", colnames(Merged_Data_Mean_Std))
colnames(Merged_Data_Mean_Std) <- gsub("Acc", "Accelerometer", colnames(Merged_Data_Mean_Std))
colnames(Merged_Data_Mean_Std) <- gsub("freq", "Frequency", colnames(Merged_Data_Mean_Std))
colnames(Merged_Data_Mean_Std) <- gsub("Gyro", "Gyroscope", colnames(Merged_Data_Mean_Std))
colnames(Merged_Data_Mean_Std) <- gsub("Mag", "Magnitude", colnames(Merged_Data_Mean_Std))
colnames(Merged_Data_Mean_Std) <- gsub("mean", "Mean", colnames(Merged_Data_Mean_Std))
colnames(Merged_Data_Mean_Std) <- gsub("std", "StandardDeviation", colnames(Merged_Data_Mean_Std))
View(Merged_Data_Mean_Std)


##### Step 5: Second Independent Tidy Dataset #####
library(dplyr)
?summarise_each

Second_Independent_Tidy_Dataset <- Merged_Data_Mean_Std %>%
    group_by(`Subject ID`, `Activity Labels`) %>%
    summarize_each(funs = mean)

?aggregate
#Second_Independent_Tidy_Dataset <- aggregate(. ~`Subject ID` + `Activity Labels`, Merged_Data_Mean_Std, mean)
#Second_Independent_Tidy_Dataset <- Second_Independent_Tidy_Dataset[order(Second_Independent_Tidy_Dataset$`Subject ID`,
#                                                                   Second_Independent_Tidy_Dataset$`Activity Labels`),]

View(Second_Independent_Tidy_Dataset)

##### Saving the Tidy Dataset #####
library(utils)
?write.table

write.table(Second_Independent_Tidy_Dataset, "Tidy_Data_Table.txt", row.names = F)
