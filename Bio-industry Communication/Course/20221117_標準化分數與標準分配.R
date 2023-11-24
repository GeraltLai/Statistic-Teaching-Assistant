#20221117 標準化分數與標準分配
#If you see garbled characters, please reopen with UTF-8 encoding format

##### 標準化分數 #####
data(iris)
head(iris[,-5])

iris_std <- scale(iris[,-5])
iris_std <- as.data.frame(iris_std)
head(iris_std)

##### 標準常態分配下的機率 #####
## Ex: 假設iris sepal length服從常態分佈，請計算sepal length介於5至6的機率
sl_mean <- mean(iris$Sepal.Length)
sl_sd <- sd(iris$Sepal.Length)
sl_mean;sl_sd 

# 標準化後再做計算
upper <- (6 - sl_mean)/sl_sd
lower <- (5 - sl_mean)/sl_sd
pnorm(upper) - pnorm(lower)
  
# 直接做計算
pnorm(6,sl_mean,sl_sd)-pnorm(5,sl_mean,sl_sd)

### 非常態分配的資料進行標準化
set.seed(100)
x <- runif(100,-10,10)
plot(density(x), main = 'Density plot of X~unif(-10,10)')
plot(density(scale(x)), main = 'Density plot of standardizing uniform X')

##### 自訂函數 #####
class(mean);class(sd)
mfun1 <- function(x){
  result <- x+10
  return(result)
}
class(mfun1)
mfun1(1:10)

## Ex:自訂一函數，可以將任何輸入的數值依照iris sepal length的分佈標準化
lower;upper

fun_std_1 <- function(x){
  result <- (x - 5.843333)/0.8280661
  return(result)
}
fun_std_1(c(5,6))

fun_std_2 <- function(x,mean,sd){
  result <- (x - mean)/sd
  return(result)
}
fun_std_2(c(5,6),sl_mean,sl_sd)

##### CLT #####
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

