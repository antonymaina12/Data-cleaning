##reading the test inertia Signals .txt files in R

body_gyro_y_test<-read.delim("body_gyro_y_test.txt", header = FALSE, sep = ";")
body_gyro_z_test<-read.delim("body_gyro_z_test.txt", header = FALSE, sep = ";")
body_gyro_x_test<-read.delim("body_gyro_x_test.txt", header = FALSE, sep = ";")

total_acc_y_test<-read.delim("total_acc_y_test.txt", header = FALSE, sep = ";")
total_acc_z_test<-read.delim("total_acc_z_test.txt", header = FALSE, sep = ";")
total_acc_x_test<-read.delim("total_acc_x_test.txt", header = FALSE, sep = ";")

body_acc_x_test<-read.delim("body_acc_x_test.txt", header = FALSE, sep = ";")
body_acc_y_test<-read.delim("body_acc_y_test.txt", header = FALSE, sep = ";")
body_acc_z_test<-read.delim("body_acc_z_test.txt", header = FALSE, sep = ";")

##reading the train inertia signals .txt files into R

body_gyro_y_train<-read.delim("body_gyro_y_train.txt", header = FALSE, sep = ";")
body_gyro_z_train<-read.delim("body_gyro_z_train.txt", header = FALSE, sep = ";")
body_gyro_x_train<-read.delim("body_gyro_x_train.txt", header = FALSE, sep = ";")

total_acc_y_train<-read.delim("total_acc_y_train.txt", header = FALSE, sep = ";")
total_acc_z_train<-read.delim("total_acc_z_train.txt", header = FALSE, sep = ";")
total_acc_x_train<-read.delim("total_acc_x_train.txt", header = FALSE, sep = ";")

body_acc_x_train<-read.delim("body_acc_x_train.txt", header = FALSE, sep = ";")
body_acc_y_train<-read.delim("body_acc_y_train.txt", header = FALSE, sep = ";")
body_acc_z_train<-read.delim("body_acc_z_train.txt", header = FALSE, sep = ";")

##renaming the column headers of the test inertia signal files
names(body_gyro_x_test)<-"body_gyro_x"
names(body_gyro_y_test)<-"body_gyro_y"
names(body_gyro_z_test)<-"body_gyro_z"

names(total_acc_y_test)<-"total_acc_y"
names(total_acc_z_test)<-"total_acc_z"
names(total_acc_x_test)<-"total_acc_x"

names(body_acc_y_test)<-"body_acc_y"
names(body_acc_z_test)<-"body_acc_z"
names(body_acc_x_test)<-"body_acc_x"


##renaming the column headers of the train inertia signal files

names(body_gyro_x_train)<-"body_gyro_x"
names(body_gyro_y_train)<-"body_gyro_y"
names(body_gyro_z_train)<-"body_gyro_z"

names(total_acc_y_train)<-"total_acc_y"
names(total_acc_z_train)<-"total_acc_z"
names(total_acc_x_train)<-"total_acc_x"

names(body_acc_y_train)<-"body_acc_y"
names(body_acc_z_train)<-"body_acc_z"
names(body_acc_x_train)<-"body_acc_x"

##joining the Inertia Signals train and test .txt files

body_gyro_y<- full_join(body_gyro_y_train,body_gyro_y_test, by = "body_gyro_y")
body_gyro_z<- full_join(body_gyro_z_train,body_gyro_z_test, by = "body_gyro_z")
body_gyro_x<- full_join(body_gyro_x_train,body_gyro_x_test, by = "body_gyro_x")

total_acc_x<- full_join(total_acc_x_train,total_acc_x_test, by = "total_acc_x")
total_acc_y<- full_join(total_acc_y_train,total_acc_y_test, by = "total_acc_y")
total_acc_z<- full_join(total_acc_z_train,total_acc_z_test, by = "total_acc_z")

body_acc_x<- full_join(body_acc_x_train,body_acc_x_test, by = "body_acc_x")
body_acc_y<- full_join(body_acc_y_train,body_acc_y_test, by = "body_acc_y")
body_acc_z<- full_join(body_acc_z_train,body_acc_z_test, by = "body_acc_z")

##creating a data.frame of all the innertia signals i.e body_gyro,total_acc,body_acc.
inertia_signals<-data.frame(c(body_gyro_y,body_gyro_z,body_gyro_x,
                              total_acc_x,total_acc_y,total_acc_z,
                              body_acc_x,body_acc_y,body_acc_z))