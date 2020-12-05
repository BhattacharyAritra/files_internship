#Setup working directory
getwd()
setwd("C:/Users/ari_b/Documents/Forage/ANZ/Task 1")
#----------------
#Load data into R studio
install.packages("readxl")
library(readxl)
data_load=read_excel("dataset by anz.xlsx")
head(data_load)
nrow(data_load)
ncol(data_load)
str(data_load)
levels(data_load)
summary(data_load)
#-----------------
#Change date format in date column
#data_load$date<-as.POSIXct(data_load$date, format="%d/%m/%Y %H:%M")
data_load$date=as.Date(data_load$date, format="%d/%m/%Y")
head(data_load$date)

#Weekday and hour derivation attempt
install.packages("lubridate")
library(lubridate)
data_load$extraction<-as.character(data_load$extraction)
data_load$hour<-hour(as.POSIXct(substr(data_load$extraction,12,19), format="%H:%M:%S"))
data_load$day<-weekdays(data_load$date)
data_load$hour
data_load$day
#-----------------
#linking of customer account and id
colnames(data_load)
#data_load>%>select(account, customer_id)>%>unique()>%>nrow()
nrow(unique(select(data_load$account, data_load$customer_id)))

