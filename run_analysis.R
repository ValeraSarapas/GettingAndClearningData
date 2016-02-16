
##Get the data
#Download the file and unzip
path=getwd()
url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
file_name = 'Dataset.zip'
download.file(url, file_name)
unzip(file_name)
dir()

#Unzipped files are in the folderUCI HAR Dataset. Get the list of the files

pathData <- file.path(path, "UCI HAR Dataset")
list.files(pathData, recursive = TRUE)

#Read data from the files into the variables
library(data.table)

dataActivityTest  <- read.table(file.path(pathData, "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(pathData, "train", "Y_train.txt"),header = FALSE)

dataSubjectTrain <- read.table(file.path(pathData, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(pathData, "test" , "subject_test.txt"),header = FALSE)

dataFeaturesTest  <- read.table(file.path(pathData, "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(pathData, "train", "X_train.txt"),header = FALSE)

#Look at the properties of the above varibles
str(dataActivityTest)
str(dataSubjectTest)
str(dataFeaturesTest)

## Merges the training and the test sets to create one data set
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")

#Look at the merges
str(dataSubject)
str(dataActivity)
str(dataFeatures)

##Extracts only the measurements on the mean and standard deviation for each measurement
#Subset Name of Features by measurements on the mean and standard deviation
#i.e taken Names of Features with "mean()" or "std()"

dataFeaturesNames <- read.table(file.path(pathData, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2

dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)


subdataFeaturesNames<-dataFeaturesNames$V2[grep("(mean|std)\\(\\)", dataFeaturesNames$V2)]
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )

Data<-subset(Data,select=selectedNames)

#Check Data
str(Data)

##Uses descriptive activity names to name the activities in the data set

activityNames <- read.table(file.path(pathData, "activity_labels.txt"),header = FALSE)
Data$activity<-factor(Data$activity); 
Data$activity<- factor(Data$activity,labels=as.character(activityNames$V2)) 

##Appropriately labels the data set with descriptive variable names

names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

#Check
names(Data)

##Creates a second,independent tidy data set and ouput it
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]


write.table(Data2, file = "tidydata.txt",row.name=FALSE)
