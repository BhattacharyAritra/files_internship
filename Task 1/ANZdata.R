getwd()
setwd("C:/Users/ari_b/Documents/Forage/ANZ/1")
#----------------------------

#readxl() package to read excel files into R Studio
install.packages("readxl")
library("readxl")
dataset <- read_excel("ANZ synthesised transaction dataset.xlsx")
head(dataset)
tail(dataset)
summary(dataset)
nrow(dataset) #12043
ncol(dataset) #23

#-----------------------------
#NUMBBER OF NULL VALUES
dataset[,is.na(dataset)]
sum(is.na(dataset))

#CLEANING DATASET OF NA VALUES
nona_dataset = na.omit(dataset)
attach(nona_dataset)

#OUTLIERS DETECTION
summary(dataset$date)
summary(dataset$balance)
summary(dataset$age)

IQR_age=(38-22)
IQR_age

lower_limit=22 - 1.5*IQR_age
upper_limit=38 + 1.5*IQR_age

lower_limit
upper_limit
