rm(list=ls())
###
n=10^4
x=runif(n,0,2)
sum=0
for(i in 1:length(x)){
  y=exp(x[i])
  sum=sum+y
}
(sum/n)*2

###HW02
x=seq(0,5,0.00001)
y=numeric(length(x))
for(i in 1:length(x)){
  if(x[i]>=1 && x[i]<2) y[i]=2*x[i-1]+1
  else if(x[i]>=2 && x[i]<6) y[i]=5
}
plot(x,y,type="l")
###HW03
#1
pbinom(7,25,0.2)
ppois(2,1.6)
qnorm(0.8,20,16)
#2-a
x <- seq(-1, 2, length=100)
y <- dunif(x, min = 0, max = 1)
plot(x, y, type = 'l',xlab="",ylab = "probability")
#2-b
x1=runif(30, min = 0, max = 1)
mean(x1)
#2-c
x2=runif(10, min = 0, max = 1)
y2=mean(x2)
x3=runif(100, min = 0, max = 1)
y3=mean(x3)
x4=runif(1000, min = 0, max = 1)
y4=mean(x4)
x5=runif(10000, min = 0, max = 1)
y5=mean(x5)
#
n <- 100 #1,10,100,1000,10000
means <- c()
for (i in 1:n) {
  x <- runif(20,min = 0,max = 1)
  means[i] <- mean(x)
}

hist(means,xlim = c(0,1),main = "",xlab = "",ylab = "",probability = T)
curve(dnorm(x, mean=0.5, sd=1/12), 
      col="darkblue", lwd=2, add=TRUE, yaxt="n")

###HW4-1
rm(list=ls())
library(asbio)#z-test
###
one.sample.z(null.mu=10,sigma=7,xbar=16,n=25,alternative = "two.sided")

###other solution
z=(16-10)/(7/5)
qnorm(1-0.05/2)

###4-2
#-1.96<Za<1.96
r=(1.96*7/5)+10
l=(-1.96*7/5)+10
beta=pnorm(r,mean=16,sd=7/5)-pnorm(l,mean=16,sd=7/5)
power=1-beta
power

###
rm(list=ls())
library(asbio)#z-test
###other solution
sigma=7/5    # theoretical standard deviation
mu0=10   # expected value under H0
mu1=16   # expected value under H1
alpha=0.05  # probability of type I error

# critical value for a level alpha test
crit=qnorm(1-alpha/2, mu0, sigma)

# power: probability for values > or < critical value under H1
(pow=pnorm(crit, mu1, sigma, lower.tail=FALSE))

# probability for type II error: 1 - power
(beta=1-pow)

###
xLims <- c(0, 25)
left  <- seq(xLims[1],   crit, length.out=100)
right <- seq(crit, xLims[2],   length.out=100)
yH0r  <- dnorm(right, mu0, sigma)
yH1l  <- dnorm(left,  mu1, sigma)
yH1r  <- dnorm(right, mu1, sigma)

###
curve(dnorm(x, mu0, sigma), xlim=xLims, lwd=2, col="red", xlab="x", ylab="density",
      main="Normal distribution under H0 and H1", ylim=c(0, 0.3), xaxs="i")
curve(dnorm(x, mu1, sigma), lwd=2, col="blue", add=TRUE)
polygon(c(right, rev(right)), c(yH0r, numeric(length(right))), border=NA,
        col=rgb(1, 0.3, 0.3, 0.6))
polygon(c(left,  rev(left)),  c(yH1l, numeric(length(left))),  border=NA,
        col=rgb(0.3, 0.3, 1, 0.6))
polygon(c(right, rev(right)), c(yH1r, numeric(length(right))), border=NA,
        density=5, lty=2, lwd=2, angle=45, col="darkgray")
abline(v=crit, lty=1, lwd=3, col="red")

###
text(crit+0.1,  0.03,  adj=0, label="¡öcritical value")
text(mu0+2.5,  0.25, adj=1, label="distribution under H0")
text(mu1-2,  0.25, adj=0, label="distribution under H1")
text(crit+2,  0.1,  adj=0, label="power", cex=1.3)
text(crit-1.2, 0.01,  expression(beta),  cex=1.3)
text(crit+0.5,  0.01, expression(alpha), cex=1.3)

###4-3
alpha=0.05
data=c(6.5,7.2,6.9,6.5,6.8,7.0,6.0,5.9,7.0)
n=length(data)
t.test(data)

#####5-1
rm(list=ls())
library(EnvStats)
x=c(252.1,244.6,254.9,253.4,239.3,246.4,249.2,241.7,252.3,237.2)
varTest(x,sigma.squared=25,alternative = "greater")

#####5-2
x1=c(15,32,18,5)
x2=c(8,29,23,18)
x3=c(1,20,25,22)
x=rbind(x1,x2,x3)
chisq.test(x)

#####5-3
data=sample(c(1:6),size=1000,replace=T)
x=table(data)
chisq.test(x)

##### HW6 #####
rm(list=ls())

##### 6-1 #####
data=iris
y=data$Sepal.Length
trt=factor(data$Species)
fit=lm(y~trt)
anova(fit)

##### 6-2 #####
library(agricolae)
LSD.test(fit,trt = "trt",console = T)
library(asbio)
pairw.anova(y=y,x=trt,method="lsd")

##### 6-3 #####
x1=data$Sepal.Length
x2=data$Petal.Length
cor(x1,x2)


##### 6-4 #####
fit=lm(x1~x2)
summary(fit)



