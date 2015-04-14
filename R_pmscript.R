# This is a test R script.

setwd("/Users/lwaldrop/Desktop/Bio pipeline Waldrop/stormevents") #Sets working directory
getwd() #Prints working directory
filenames<-list.files() #Pulls file names and creates a list of them
class(filenames) #Returns type of class of filenames

storms<-read.csv(file=filenames[1]) #Reads in the first storm name file
storms2<-read.csv(file=filenames[2])

testcase<-lm(INJURIES_DIRECT~DEATHS_DIRECT,data=storms)
summary(testcase)
anova(testcase)
plot(INJURIES_DIRECT~DEATHS_DIRECT,data=storms)