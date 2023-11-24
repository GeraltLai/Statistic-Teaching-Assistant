###【111-1 2022/12/01 Practice answer】
# If you see garbled characters, please reopen with UTF-8 encoding format

### a.
body <- read.csv('~/body', sep=',', header = T)
body <- read.csv(file.choose(), sep=',', header = T)

body$sex_2 <- 0
body$sex_2[which(body$sex == 'M')] <- 1
# Ans.

### b.
library(BSDA)
z.test(body$heights, sigma.x = 6.5, mu = 170)
qnorm(0.975)
# H0: Population mean height (mu_0) == 170
# H1: Population mean height (mu_0) != 170

# Since the z_value > 1.96, reject H0 and conclude that 
# the mean height is different with 170cm.

# Ans

### c.
prop_CI <- function(x,n,alpha=0.05){
  phat <- x/n
  z <- qnorm(1-alpha/2)
  ME <- z*sqrt(phat*(1-phat)/n)
  CI <- c(phat-ME,phat+ME)
  print(CI)
}

prop_CI(sum(body$sex_2),nrow(body),0.05)
# H0: Population proportion of male (p_hat) == 0.5
# H1: Population proportion of male (p_hat) != 0.5

# Since the interval contain 0.5, cannot reject H0,conclude that 
# the proportion of male could be a half.

# Ans

