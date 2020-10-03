##read the subject files
subject_train<-read.delim("subject_train.txt", header = FALSE)
subject_test<-read.delim("subject_test.txt", header = FALSE)

##combine the subject files

subject<- rbind(subject_train,subject_test)
complete_data<-cbind(subject,full_data)

##rename subject column
names(complete_data)<-c("subject","Activity","data")