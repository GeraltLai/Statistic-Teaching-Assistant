####
rm(list=ls())

### 7-1
x=sample(x=c(1:6),size=100,replace=T)
x
mean(x)
sd(x)

### 7-2
x=seq(-3,3,length=100)
y=dnorm(x,mean=0,sd=1)
plot(x,y,type="l",ylab="Density",xlab="z",main="z~N(0,1)")
value_x=seq(-3,0,length=100)
value_y=dnorm(value_x,mean=0,sd=1)
polygon(x=c(value_x,rev(value_x)),y=c(value_y,numeric(length(value_y))),
        col="dodgerblue")


