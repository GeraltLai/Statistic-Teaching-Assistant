#####
rm(list=ls())

##### load data
data=read.csv("C:/Users/lab205/Desktop/data.csv",header=T)
data

##### Homework 2-1
str(data)

##### Homework 2-2
sum(data[,5]); range(data[,5]); mean(data[,5]) ; var(data[,5]); sd(data[,5])
sum(data[,6]); range(data[,6]); mean(data[,6]) ; var(data[,6]); sd(data[,6])
sum(data[,7]); range(data[,7]); mean(data[,7]) ; var(data[,7]); sd(data[,7])

##### Homework 2-3
new=data[data[,4]=="M",]
new

##### Homework 2-4
pulse_pressure_differenc=data$SBP-data$DBP
new_data=cbind(data,pulse_pressure_differenc)
new_data[1:10,]

##### Homework 2-5
new_data
data1=new_data[,-2]
sub=data1[11:20,]
sub
