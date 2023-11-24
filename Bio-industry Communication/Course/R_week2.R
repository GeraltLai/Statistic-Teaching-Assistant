#### clear memory
rm(list=ls())

#############################
##### basic operations ######
#############################
### plus
2+2

### minuis
2-2

### multiplication
2*2

### divided by
4/2

### exponential
exp(x=10)
exp(10)

### log
log(x=10)
log(10)
log(x=10,base=10)

### factorial
factorial(4)
4*3*2*1

### round
round(x=0.1234,digits = 2)
round(0.1234,2)

### vector 
x=c(1,2,3,4,5)
y=c(1,2,3,4,5)
x+y

### mean
mean(x)
mean(y)

### standard deviation
sd(x)
sd(y)

####################
##### practice #####
####################
### example 1
(factorial(5)/(factorial(2)*factorial(3)))*(0.4)^2*(0.6)^3
a=factorial(5)/(factorial(2)*factorial(3))
b=0.4^2*0.6^3
a*b
### example 2
round(exp(-6)*6^4/factorial(4),2)
a=exp(-6)*6^4
b=factorial(4)
round(a/b,2)

#################################
##### data input and output #####
#################################
data1=read.csv(file="C:/Users/stupi/Desktop/Farms.csv",header=T)
data2=read.table(file="C:/Users/stupi/Desktop/height.txt",header=T)
data3=read.csv(file.choose(),header=T)
data4=read.table(file.choose(),header=T)

#### view data
View(data1)
dim(data1)
head(data1)
tail(data1)
summary(data1)

### mean and sd
mean(data1$Farms)
sd(data1$Farms)
mean(data2$mheight)
sd(data2$mheight)

#### output data
write.csv(data1,file="C:/Users/stupi/Desktop/test.csv",row.names = F)
write.table(data2,file="C:/Users/stupi/Desktop/test2.txt",row.names = F)

####################
##### practice #####
####################
data2=read.table(file="C:/Users/stupi/Desktop/height.txt",header=T)
data2
mean(data2$dheight)
sd(data2$dheight)
write.table(data2,file="C:/Users/stupi/Desktop/課堂練習.txt",row.names = F)
