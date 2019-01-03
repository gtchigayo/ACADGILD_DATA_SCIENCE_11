# read & View bank data 
setwd=("/Users/gift/work/ACADGILD")
getwd()
bank_data =read.csv("bank-full.csv" , header = TRUE ,sep = ";")
View(bank_data)
summary(bank_data)

#a. Create a visual for representing missing values in the dataset.
bank_data[bank_data=='unknown'] = NA
#table(bank_data$job)
summary(is.na(bank_data))
library(VIM)
aggr_plot <- aggr(bank_data, col=c('navyblue','red'), numbers=FALSE, sortVars=TRUE, labels=names(bank_data),  ylab=c("Histogram of missing data","Pattern"))

#b. Show a distribution of clients based on a Job.
jobcount <-table(bank_data$job)


barplot(height = jobcount[order(jobcount,decreasing = TRUE)] ,col = 'Red')

#c. Check whether is there any relation between Job and Marital Status?
#library(gmodels)
library(ggplot2)
CrossTable(bank_data$marital, bank_data$job)
ggplot(bank_data,aes(bank_data$marital,bank_data$job)) + geom_jitter()


#d. Check whether is there any association between Job and Education?
  ggplot(bank_data,aes(bank_data$education,bank_data$job)) + geom_jitter()


