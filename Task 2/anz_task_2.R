install.packages("readxl")
library("readxl")
getwd()
setwd("C:\\Users\\ari_b\\Documents\\Forage\\ANZ\\Task 2")
salary <- read_excel("ANZ synthesised transaction dataset (1).xlsx")
head(salary)
dim(salary)
tail(salary)
str(salary)
levels(salary)

#-------------------------------------------

#library(gapminder)
#install.packages("gapminder")
#gapminder%>% convert(chr(currency))
typeof(salary)
typeof(salary$currency)
typeof(salary$amount)
typeof(salary$balance)
typeof(salary$date)
salary$date <- as.Date(salary$date, format="%d/%m/%Y")

salary$account <- factor(salary$account)
typeof(salary$account)
salary$first_name <- factor(salary$first_name)
typeof(salary$first_name)
typeof(salary$movement)
unique(salary$movement)
salary$total <- salary$amount + salary$balance
salary$total
unique(is.na(salary$total))
unique(is.na(salary$amount))
unique(is.na(salary$balance))
salary$annual_amount <- salary$total * 12
salary$annual_amount
unique(is.na(salary$annual_amount))
salary$annual_amount <- factor(salary$annual_amount)
str(salary)
salary$account

#------------------------------------------------

install.packages("dplyr")
library(dplyr)
tot_sal <- summarise_at(group_by(salary, account), vars(total), funs(sum(.,na.rm = TRUE)))
tot_sal
count(tot_sal)
unique(tot_sal)
typeof(tot_sal)
#annual_sal = list()
#lapply(tot_sal, "*", 12)
#annual_sal
#annual_sal <- NULL
colnames(salary)
ncol(tot_sal)
nrow(tot_sal)
tot_sal
unique(tot_sal)
typeof(tot_sal)

tot_sal$annual_salary <- tot_sal$total*12
ncol(tot_sal)
unique(tot_sal)

#----------------------------------------------

min(salary$age)
max(salary$age)

unique(salary$movement)
typeof(salary$movement)

typeof(salary$age)

name_age<-data.frame(salary$first_name, salary$age)
name_age
unique(name_age)
  
typeof(name_age)
colnames(name_age)

head(name_age)

unique(salary$bpay_biller_code)

















