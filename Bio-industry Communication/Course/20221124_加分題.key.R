rm(list = ls())
# 1
ztest = function(data, mu, sd, alpha){
  m = mean(data)
  n = length(data)
  ts = abs((m-mu))/(sd/sqrt(n))  
  z_value = qnorm(1-alpha/2, mean = 0, sd = 1)
  if(ts >= z_value){
    print("reject H0")
  }else{
    print("do not resject H0")
  }
}

# 2
library(BSDA)
data = read.table("C:/Users/stupi/Desktop/data.height.txt", header = T)
z.test(x = data$height,
       mu = 170,
       sigma.x = 5,
       alternative = "two.side")

ztest(data = data$height, mu = 170, sd = 5, alpha = 0.05)

# reject H0

# 3
set.seed(123)
dt = rnorm(50, mean = 173, sd = 5)
hist(dt, ylim = c(0,20),
     xlab = "身高", ylab = "人數",
     main = "常態分佈隨機抽樣結果")




