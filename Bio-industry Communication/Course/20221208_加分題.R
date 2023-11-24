rm(list = ls())

# 1
library(BSDA)
data = c(19500,21650,20585,23560,24560,25420,25655)
z.test(x = data, mu = 20000, sigma.x = 1000)


# 2
alpha = 0.05
sigma = 400
ME = 50
n = (qnorm(alpha/2,lower.tail = F)*sigma/ME)^2
n

# function
nmin_mean <- function(alpha,sigma,ME){
  n <- (qnorm(alpha/2,lower.tail = F)*sigma/ME)^2
  return(ceiling(n))
}

nmin_mean(alpha,sigma,ME)

#3 
alpha = 0.05
phat = 0.56
ME = 0.1
n <- phat*(1-phat)*(qnorm(alpha/2,lower.tail = F)/ME)^2
ceiling(n)

# function
nmin_prop <- function(alpha,phat,ME){
  n <- phat*(1-phat)*(qnorm(alpha/2,lower.tail = F)/ME)^2
  return(ceiling(n))
}
nmin_prop(alpha,phat,ME)

