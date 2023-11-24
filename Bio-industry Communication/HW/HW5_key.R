###
###
rm(list = ls())
ID = seq(1, 50, by = 1)
shop_1 = round(rnorm(50, mean = 4500, sd = 1500), 0)
shop_2 = round(rnorm(50, mean = 5000, sd = 500), 0)
consumption = data.frame(ID, shop_1, shop_2)
#write.csv(consumption, file = "C:/Users/stupi/Desktop/consumption.csv",row.names = F)

# 1-a
consumption = read.csv("C:/Users/lab205/Desktop/consumption.csv", header = T)
consumption$total = consumption$shop_1 + consumption$shop_2
head(consumption)

# 1-b
library(BSDA)
z.test(x = consumption$shop_2,
       mu = 4500,
       sigma.x = 1000,
       alternative = "two.sided")

# 1-c
sigma = 1500
mean = mean(consumption$total)
alpha = 0.05
n = nrow(consumption)
upper = mean + qnorm(1 - alpha/2) * sigma/sqrt(n)
lower = mean - qnorm(1 - alpha/2) * sigma/sqrt(n)
c(lower,upper)

# 1-d
mu0 = 9000
sigma = 1500
n = nrow(consumption) 
xbar = mean(consumption$total)
zstat = (xbar - mu0)/(sigma/sqrt(n))
p_value = pnorm(zstat,0,1,lower.tail = F)
round(p_value,4)

