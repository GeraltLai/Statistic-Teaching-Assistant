# 20221013 離散型與連續型機率分配
# If you see garbled characters, please reopen with UTF-8 encoding format
rm(list = ls())


###### 機率概論 ######
# 內建資料
iris

# 集合運算：應用
A <- which(iris$Petal.Length==1.4) # 花瓣長度為1.4公分的鳶尾花
B <- which(iris$Petal.Width==0.2)  # 花瓣寬度為0.2公分的鳶尾花
setequal(A, B)  # 1. 花瓣長度為1.4公分的鳶尾花與花瓣寬度為0.2公分的鳶尾花是否一致

# 集合運算：應用
union(A, B)     # 2. 花瓣長度為1.4公分或花瓣寬度為0.2公分的鳶尾花
intersect(A, B) # 3. 花瓣長度為1.4公分且花瓣寬度為0.2公分的鳶尾花

# 集合運算：應用
setdiff(A, B)   # 4. 花瓣長度為1.4公分但花瓣寬度不為0.2公分的鳶尾花
setdiff(B, A)   # 5. 花瓣長度不為1.4公分但花瓣寬度為0.2公分的鳶尾花


# 集合運算：練習
HW1 <- c(11, 16, 23, 31, 36, 47, 50)            # 第一次作業缺交
HW2 <- c(3, 9, 16, 20, 27, 31, 36, 49, 50)      # 第二次作業缺交
boy <- seq(1, 50, 2)                            # 男生
girl <- seq(2, 50, 2)                           # 女生

# (1) 第一次作業與第二次作業皆缺交的男生座號
intersect(boy, intersect(HW1, HW2))

# (2) 第一次作業與第二次作業皆缺交的女生座號
intersect(girl, intersect(HW1, HW2))

# (3) 第一次作業有交，但第二次作業沒交的男生
intersect(boy, setdiff(Hw2, HW1))

# (4) 第一次作業沒交，但第二次作業有交的女生
intersect(girl, setdiff(HW1, HW2))


###### 二項分配 #####
# 機率密度：投進2球機率 = 0.3456 
# 算法一：公式計算
factorial(5)/factorial(2)/factorial(3)*(0.4)^2*(0.6)^3 
# 組合數可以使用choose()來計算
choose(5, 2)*(0.4)^2*(0.6)^3   

#算法二：套入函式dbinom()
dbinom(2, 5, 0.4)

#累積機率：投進多於2球機率 = 0.31744
# 算法一：手動累加
# p(>2球) = p(3球)+p(4球)+p(5球)
dbinom(3, 5, 0.4)+dbinom(4, 5, 0.4)+dbinom(5, 5, 0.4) 

# 算法二：套入函式pbinom()
# p(>2球) = 1 - p(<= 2球) 
1-pbinom(2, 5, 0.4, lower.tail=T)
# lower.tail = F，計算P[X > x]
pbinom(2, 5, 0.4, lower.tail=F) 

# 隨機資料：模擬投球10000次，觀察次數分佈
x <- rbinom(100000,5,0.4)
relativex <- table(x)/length(x)
barplot(relativex,ylim=c(0,0.35)
        ,main = 'rbinom(100000,5,0.4)',xlab = 'x',ylab = 'relative frequency')

##### 均勻分配 #####
dunif(0, min = 0, max = 1)
punif(0.5, min = 0, max = 1)
qunif(0.5, min = 0, max = 1)
runif(10, min = 0, max = 1)

# 簡單作圖
x <- seq(-4, 4, length=100) # 定義x軸
y <- dunif(x, min = -3, max = 3) # 計算y軸機率
plot(x, y, type = 'l') # 畫出均勻分配圖


##### 常態分配 #####
# 連續型分佈通常計算累積機率或區間機率
# 累積機率：體重小於等於65公斤機率 = 0.8413
pnorm(65,60,5)
# 也可以先標準化
(65-60)/5
pnorm(1)

# 區間機率：體重介於55~65公斤機率 = 0.6827
# P(55 <= x <= 65) = P(x <= 65) = P(x <= 55)
pnorm(65,60,5) - pnorm(55,60,5)

# 隨機樣本
# 設定隨機種子，確保結果可以再現
set.seed(100)
x <- rnorm(100000,60,5)
hist(x,main = 'rnorm(100000,60,5)',col = 'gray',freq = F
     ,xlim=c(35,85),ylim = c(0,0.09))
lines(density(x),col = 'red')

plot(density(x))
polygon(density(x),col='red')

# 百分位數：體重之97.5百分位數為何
# approximate = mean + 2sd
qnorm(0.975,60,5)
# 將標準常態分佈查表值轉換
qnorm(0.975)*5 + 60

