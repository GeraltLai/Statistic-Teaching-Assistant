###【111-1 2022/11/17 Practice answer】
# If you see garbled characters, please reopen with UTF-8 encoding format

### a.
body <- read.csv('~/body', sep=',', header = T)
body <- read.csv(file.choose(), sep=',', header = T)

summary(body)

# continuous or not (T/F)
# 1. ID: F
# 2. ages: T/F
# 3. weights: T
# 4. heights: T
# 5. bmi: T
# 6. sex: F

body_std <- scale(body[,2:5])
body_std <- as.data.frame(body_std)

# Ans.

### b. 
round(body_std[249,3],2)
round(pnorm(body_std[249,3]),2)

# Ans.

### c.
bh_m <- mean(body$heights); bh_sd <- sd(body$heights)
lower <- (165-bh_m)/bh_sd; upper <- (195-bh_m)/bh_sd

round(pnorm(upper) - pnorm(lower),2)

# Ans.
