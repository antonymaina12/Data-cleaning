##reading x_test/train.txt into R

x_test<-read.delim("X_test.txt", header = FALSE)
x_train<-read.delim("X_train.txt", header = FALSE)

##reading Y_test/train.txt into R

y_test<-read.delim("y_test.txt", header = FALSE)
y_train<-read.delim("y_train.txt", header = FALSE)

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

##renaming the headers of the merged train and test data
names(train_data)<- c("Activity","data")
names(test_data)<- c("Activity","data")

##merging x and y data into one dataframe.
full_data<-rbind(train_data,test_data)

