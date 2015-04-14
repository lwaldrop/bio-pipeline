# This is a test R script.

setwd("/Users/lwaldrop/Desktop/Bio pipeline Waldrop/stormevents") #Sets working directory
getwd() #Prints working directory
filenames<-list.files() #Pulls file names and creates a list of them
class(filenames) #Returns type of class of filenames

storms<-read.csv(file=filenames[1]) #Reads in the first storm name file
storms2<-read.csv(file=filenames[2]) #Reads in the second storm name file


# Ways of viewing your newly loaded data
head(storms) # Produces first six rows
view(storms) # Brings up window like double clicking
ncol(storms) # Reports number of columns
nrow(storms) # Reports number of rows
levels(storms$MONTH_NAME) # Reports the levels of a category, the types of labels (ie the months available)

# Indexing data in an array
storms[,2:3] # All of the rows, only columns 2 and 3
storms["STATE"] # Reports only the data in column with header STATE
storms$STATE # Same as above!! 
storms$INJURIES_DIRECT[storms$STATE=="TEXAS"] # Pulls out values for direct injuries in the state of Texas only

aggplot<-aggregate(storms$DEATHS_DIRECT,by=list(storms$MONTH_NAME),FUN=sum) #Aggregates 
plot(aggplot,cex.axis = 0.8)

# Basic linear regression
testcase<-lm(INJURIES_DIRECT~DEATHS_DIRECT,data=storms)
summary(testcase)
anova(testcase)
plot(INJURIES_DIRECT~DEATHS_DIRECT,data=storms)

# Some plots
boxplot(storms$INJURIES_DIRECT~storms$MONTH_NAME)
pairs(storms) # Does all pair plots for looking at correlation

install.packages("dataRetrieval") #Appears to be not working
