##reading x_test/train.txt into R

x_test<-read.delim("UCI HAR Dataset/test/X_test.txt", sep="", header = FALSE)
x_train<-read.delim("UCI HAR Dataset/train/X_train.txt", sep="", header = FALSE)

##reading Y_test/train.txt into R

y_test<-read.delim("UCI HAR Dataset/test/y_test.txt", header = FALSE)
y_train<-read.delim("UCI HAR Dataset/train/y_train.txt", header = FALSE)

##read the subject files
subject_train<-read.delim("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject_test<-read.delim("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

##labeling the Activity as factors
y_train<- ordered(y_train$V1, levels = c(1,2,3,4,5,6), 
                 labels = c("WALKING",
                                " WALKING_UPSTAIRS",
                                "WALKING_DOWNSTAIRS",
                                 "SITTING",
                                "STANDING",
                                "LAYING"))

y_test<- ordered(y_test$V1, levels = c(1,2,3,4,5,6), 
                 labels = c("WALKING",
                         " WALKING_UPSTAIRS",
                        "WALKING_DOWNSTAIRS",
                        "SITTING",
                        "STANDING",
                        "LAYING"))

##merging train data x&y into one dataframe
train_data<-cbind(y_train,x_train)

##merging test data x&y into one dataframe
test_data<-cbind(y_test,x_test)

##combine the subject files

subject<- rbind(subject_train,subject_test)


##renaming the headers of the merged train and test data
names(train_data)<- c("Activity","data")
names(test_data)<- c("Activity","data")

##merging x and y data into one dataframe.
full_data<-rbind(train_data,test_data)

##combine subject and x and y data
complete_data<-cbind(subject,full_data)

##reading features file
features<-read.delim("UCI HAR Dataset/features.txt", header = FALSE)

##rename columns
colnames(complete_data) <- c("subject","activity",features$V1)
colnames(complete_data) <- tolower(colnames(complete_data))

##selecting only the columns with mean and std
x <-grep("subject|activity|mean|std",names(complete_data))
complete_data<- complete_data[,x]

#average of each variable for each activity and each subject.

tidy_data<- aggregate(complete_data,mean ,by= list(complete_data$subject,
                                                   complete_data$activity))
