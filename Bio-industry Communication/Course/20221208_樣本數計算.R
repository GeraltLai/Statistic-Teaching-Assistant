rm(list = ls())

##### 單一樣本z檢定 ######
z_test = function(data){
  m = mean(data)
  ts = abs((m-165))/(2/sqrt(60))  
  z_value = qnorm(1-0.05/2, mean = 0, sd = 1)
  if(ts >= z_value){
    print("reject H0")
  }else{
    print("do not resject H0")
  }
}
dt = rnorm(60, mean = 162, sd = 2)
z_test(dt)

# package
library(BSDA)
dt = rnorm(60, mean = 162, sd = 2)
z.test(x = dt,
       mu = 165,
       sigma.x = 2,
       alternative = "two.side")

##### 已知母體變異的區間估計 #####
height <- read.table('C:/Users/lab205/Desktop/data.height.txt',header = T,sep = ' ')

# by definition
# population sigma = 5, alpha - 0.05
sigma <- 5; alpha <- 0.05
n <- nrow(height)
z <- qnorm(1-alpha/2)
ME_1 <- z*(sigma/sqrt(n))

xbar <- mean(height$height)
CI_1 <- c(xbar-ME_1,xbar+ME_1)
CI_1

# by function z.test
library(BSDA)
z.test(height$height,sigma.x = sigma,mu=165)

##### 未知母體變異的區間估計 #####
# by definition
# alpha - 0.05
s <- sd(height$height); alpha <- 0.05
n <- nrow(height)
t <- qt(1-alpha/2,n-1)
ME_2 <- t*(s/sqrt(n))

xbar <- mean(height$height)
CI_2 <- c(xbar-ME_2,xbar+ME_2)
CI_2

# by function t.test
t.test(height$height, mu=165)

# set seed for reproducibility
set.seed(123)

# generate and plot the sample data
Y = rnorm(n = 100, mean = 5, sd = 5)
plot(Y, pch = 19, col = "steelblue")

# CI
cbind(CIlower = mean(Y) - 1.96 * 5 / 10, 
      CIupper = mean(Y) + 1.96 * 5 / 10)

# initialize vectors of lower and upper interval boundaries
lower = numeric(1000)
upper = numeric(1000)

# loop sampling / estimation / CI
for(i in 1:1000) {
  Y = rnorm(100, mean = 5, sd = 5)
  lower[i] = mean(Y) - 1.96 * 5 / 10
  upper[i] = mean(Y) + 1.96 * 5 / 10
}

# join vectors of interval bounds in a matrix
CIs = cbind(lower, upper)
CIs

# identify intervals covering mu
ID = which(CIs[1:100, 1] <= 5 & 5 <= CIs[1:100, 2])

# initialize the plot
plot(0, 
     xlim = c(3, 7), 
     ylim = c(1, 100), 
     ylab = "Sample", 
     xlab = expression(mu), 
     main = "Confidence Intervals")

# set up color vector
colors = rep(gray(0.6), 100)
colors[-ID] <- "red"

# draw reference line at mu=5
abline(v = 5, lty = 2)

# add horizontal bars representing the CIs
for(j in 1:100) {
  lines(c(CIs[j, 1], CIs[j, 2]), 
        c(j, j), 
        col = colors[j], 
        lwd = 2)
  
}
# legend for plot
legend("topright", legend=c("Cover mu","Not cover mu"),
       lty=c(2,2),lwd=c(4,4),
       col=c(gray(0.6),'red'),
       bty="o")

##### 樣本數計算 #####
### Ex1: 樣本平均的信賴區間
alpha = 0.05
sigma = 5
ME = 2.5
n = (qnorm(alpha/2,lower.tail = F)*sigma/ME)^2

# function
nmin_mean <- function(alpha,sigma,ME){
  n <- (qnorm(alpha/2,lower.tail = F)*sigma/ME)^2
  return(ceiling(n))
}

nmin_mean(alpha,sigma,ME)

### Ex2: 樣本比例的信賴區間
alpha = 0.05
phat = 0.5
ME = 0.05
n <- phat*(1-phat)*(qnorm(alpha/2,lower.tail = F)/ME)^2

# function
nmin_prop <- function(alpha,phat,ME){
  n <- phat*(1-phat)*(qnorm(alpha/2,lower.tail = F)/ME)^2
  return(ceiling(n))
}
nmin_prop(alpha,phat,ME)

