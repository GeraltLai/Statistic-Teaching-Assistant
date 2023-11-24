#20221201 標準化分數與標準分配
#If you see garbled characters, please reopen with UTF-8 encoding format

##### 已知母體變異的區間估計 #####
height <- read.table('data.height.txt',header = T,sep = ' ')

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

##### 比例資料的區間估計 #####
alpha = 0.05
n <- 100; phat <- 72/100
z <- qnorm(1-alpha/2)
ME_3 <- z*sqrt(phat*(1-phat)/n)
CI_3 <- c(phat-ME_3,phat+ME_3)
CI_3

prop_CI <- function(x,n,alpha=0.05){
  phat <- x/n
  z <- qnorm(1-alpha/2)
  ME <- z*sqrt(phat*(1-phat)/n)
  CI <- c(phat-ME,phat+ME)
  print(CI)
}

prop_CI(72,100,0.05)


