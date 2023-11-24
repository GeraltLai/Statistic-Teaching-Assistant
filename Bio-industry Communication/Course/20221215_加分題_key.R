###【111-1 2022/12/15 Practice answer】
# If you see garbled characters, please reopen with UTF-8 encoding format

### a.
beer <- read.csv('beer.csv',header = T,sep=',')
which(beer$pH < 4.2 | beer$pH > 4.5) # 5, 13

# Ans.

### b.
# 1. H0: mu > 4.5; H1: mu <= 4.5
# 2. alpha = 0.01
# 3. Z test (since sigma is known)
# 4. Reject H0 when the CI do not cover the mu_0 value

# 5. 
library(BSDA)
z.test(beer$pH, sigma.x = 0.1, alternative = 'less', mu=4.5, conf.level = 0.99)

# 6. Since the CI (-Inf, 4.413599] do not contain 4.5, reject H0 
#    and conclude that the population mean pH value is less than 4.5,
#    means that this batch of beer passed the QC test.

# Ans

### c.
# 題目標示有誤，原題目Margin of error為0.02
n <- (0.1*qnorm(0.995)/0.02)^2
ceiling(n) #166

# 使用0.2計算出來的結果為n=2
n <- (0.1*qnorm(0.995)/0.2)^2
ceiling(n) #2

# Ans