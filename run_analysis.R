library(dplyr)

# read all the data sources in different objects
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
raw_data_test <- read.table("UCI HAR Dataset/test/X_test.txt")
raw_activity_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
raw_data_train <- read.table("UCI HAR Dataset/train/X_train.txt")
raW_activity_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# add description to the activities
activity_test <- merge(raw_activity_test,activity_labels,by="V1",all.x =TRUE)
activity_train <- merge(raW_activity_train,activity_labels,by="V1",all.x =TRUE)

# name the variables
names(activity_test)<- c("Activity_ID", "Activity_Desc")
names(activity_train)<- c("Activity_ID", "Activity_Desc")
names(raw_data_test) <- features$V2
names(raw_data_train)<- features$V2
names(subject_test) <- "Subject_ID"
names(subject_train)<- "Subject_ID"

#transform into factors
subject_train$Subject_ID <- as.numeric(subject_train$Subject_ID)
subject_test$Subject_ID <- as.numeric(subject_test$Subject_ID)
activity_test$Activity_ID <- as.numeric(activity_test$Activity_ID )
activity_train$Activity_ID <- as.numeric(activity_train$Activity_ID )

#filter only the mean and SD variables
selected_data_test <-raw_data_test[,grepl("mean|std()",names(raw_data_test))&!grepl("meanFreq",names(raw_data_test))]
selected_data_train <-raw_data_train[,grepl("mean|std()",names(raw_data_train))&!grepl("meanFreq",names(raw_data_train))]


# combine the data, subject and activity files for each partition
data_test<-cbind(activity_test,subject_test,selected_data_test)
data_train<-cbind(activity_train,subject_train,selected_data_train)

# combine the test and train files
full_data <- rbind(data_test,data_train)
full_data$SubActivity<-as.factor(paste( "Sub", full_data$Subject_ID , "Act" , full_data$Activity_ID,sep=""))
full_data <- arrange(full_data, Subject_ID,Activity_ID)

#create a table with the unique combinations of Subject and activity to use as key
average_data<-data.frame(key=unique(full_data$SubActivity))

# add the pure variables for subject and activity
average_data<-cbind(average_data,arrange(unique(full_data[,1:3]),Subject_ID,Activity_ID))

#loop through the columns to be calculated and apply the average function
# then merge using the key field with the average_table created above
for (each_column in colnames(selected_data_test)){
        temp_data<-tapply(full_data[[each_column]],full_data$SubActivity,mean)
        temp_data<-as.data.frame(temp_data)
        temp_data$key<-rownames(temp_data)
        names(temp_data)<-c(paste("SubActMEAN",each_column,sep = "_"),"key")
        average_data<-merge(average_data,temp_data,by="key")
}
average_data<-arrange(average_data,Subject_ID,Activity_ID)

