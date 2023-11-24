rm(list = ls())

#######################
#####中央極限定理######
#######################
## Ex1. N(10,5^2)
xm1 <- xm2 <- xm3 <- c()
for(i in 1:10000){
  x1 <- rnorm(5, mean = 10, sd = 5)
  x2 <- rnorm(10, mean = 10, sd = 5)
  x3 <- rnorm(50, mean = 10, sd = 5)
  
  xm1 <- c(xm1, mean(x1))
  xm2 <- c(xm2, mean(x2))
  xm3 <- c(xm3, mean(x3))
}
sd(xm1); sd(xm2); sd(xm3)

hist(xm1, ylim = c(0,3000), xlim = c(0,20)
     , main = 'n = 5,  Xbar~N(10,2.2361)', xlab = 'xbar')
hist(xm2, ylim = c(0,3000), xlim = c(0,20)
     , main = 'n = 10, Xbar~N(10,1.5811)', xlab = 'xbar')
hist(xm3, ylim = c(0,3000), xlim = c(0,20)
     , main = 'n = 50, Xbar~N(10,0.7071)', xlab = 'xbar')

## Ex2. 非對稱分配
xm1 <- xm2 <- xm3 <- c()
for(i in 1:10000){
  x1 <- rgamma(5, 2, 2)
  x2 <- rgamma(10, 2, 2)
  x3 <- rgamma(50, 2, 2)
  
  xm1 <- c(xm1, mean(x1))
  xm2 <- c(xm2, mean(x2))
  xm3 <- c(xm3, mean(x3))
}
sd(xm1); sd(xm2); sd(xm3)

hist(xm1, ylim = c(0,3000), xlim = c(0,3.5)
     , main = 'n = 5,  Xbar~N(10,0.3162)', xlab = 'xbar')
hist(xm2, ylim = c(0,3000), xlim = c(0,3.5)
     , main = 'n = 10, Xbar~N(10,0.2236)', xlab = 'xbar')
hist(xm3, ylim = c(0,3000), xlim = c(0,3.5)
     , main = 'n = 50, Xbar~N(10,0.1)', xlab = 'xbar')

###################
#####顯著檢定######
###################
# 單一樣本z檢定
ts = abs((162-165))/(2/sqrt(60))
z_value = qnorm(1-0.05/2, mean = 0, sd = 1)
if(ts >= z_value){
  print("reject H0")
}else{
  print("do not resject H0")
}

# function
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


# pacckage 作法
install.packages('BSDA')
library(BSDA)
set.seed(123456)
dt = rnorm(60, mean = 162, sd = 2)
z.test(x = dt,
       mu = 165,
       sigma.x = 2,
       alternative = "two.side")



