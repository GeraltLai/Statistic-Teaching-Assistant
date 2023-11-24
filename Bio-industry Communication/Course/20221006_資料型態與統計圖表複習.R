#20221006 資料型態與統計圖表複習
#If you see garbled characters, please reopen with UTF-8 encoding format

##### 資料型態與結構 #####
## 資料型態 -----
# 利用class()查看資料的型態

# numeric
num <- 8
class(num)

# character
# '' and "" are basically same things
# 很多行短短的程式碼寫起來很佔空間，可以用分號(;)分隔整理成同一行
chr_1 <- 'character'; chr_2 <- '8'; chr_3 <- '中文'
class(chr_1); class(chr_2); class(chr_3)

# logical
# There are only 4 elements in logic (T, TRUE, F, FALSE)
logi_1 <- T;logi_2 <- TRUE
logi_3 <- F;logi_4 <- FALSE
class(logi_1)

# T = TURE, F = FALSE
logi_1 == logi_2
logi_3 == logi_4

## vector -----
# 利用c()合併元素，就會形成vector
# 顯示在Environment的Values中
vec_num <- c(1,2) 
vec_num

vec_chr <- c('a','b','c') 
vec_chr

# seq(from,to,by)也可以形成vector
sequence <- seq(0,1,0.1)

# 利用class可以查看資料類型
# vector的資料類型會顯示裏面元素的資料類型（numeric,character ...）
class(vec_num)
class(vec_chr)

# 查看vector 元素
length(vec_num)
vec_num[1]

## factor -----
# ordinal vector
score <- c('a+','b+','b','a','a+','a-','b+','b','b-')
class(score)
score_fac <- factor(score,labels = c('a+','a','a-','b+','b','b-'))
class(score_fac)
score_fac

## data.frame -----
# 平常讀入csv檔就是data.frame
# 顯示在Environment的Data中
# 利用class()查看會得到"data.frame"
class(iris)
names(iris)
nrow(iris);ncol(iris);dim(iris)
iris[1,1:5]

# data.frame(col_1, col_2)可以生成新的dataframe
new.dt <- data.frame(
  c1 = c(1,2,3,4,5),
  c2 = c('a','b','c','d','e')
)

# dataframe就是由vector構成column，用$可以讀取特定cloumn，這時讀到的是vector
class(new.dt)
class(new.dt$c1)
class(new.dt$c2)

##### 條件式複習 #####
# 兩種條件式寫法
# 1. if(...){...}else if(...){...}else{...} #注意大小括號位置
# 2. ifelse(...) #只用了小括號

# Ex1: 判斷數字是奇數、偶數或是0 -> 用1.
# sample(x = 母體, size = 樣本數) 進行抽樣
set.seed(100) #讓每次抽樣出來結果一致（假隨機種子）
x <- sample(x = 0:5, size = 1)
print(x)
if(x == 0){
  print('0')
}else if(x %% 2 == 1)  {
  print('odd')
}else{
  print('even')
}

# Ex2: 判斷同學是否pass -> 用2.
set.seed(100)
x <- sample(x = 50:100, size = 10) #產生10名同學的成績
print(x)
p_or_f <- ifelse(x >= 60, 'pass','fail')
print(p_or_f)

##### 計算統計值 #####
## 平均數-----
#計算總和/樣本數
sum(iris$Sepal.Length)            
sum(iris$Sepal.Length)/nrow(iris) 
#或直接用指令算
mean(iris$Sepal.Length)           

## 中位數-----
#排序後手動找中間值
sort(iris$Sepal.Length)
#直接用指令計算中位數
median(iris$Sepal.Length) 

## 眾數-----
#算出各個長度的樣本數量
table(iris$Sepal.Length) 
#找出樣本數最多的長度（5cm，位於表上第8個）
which.max(table(iris$Sepal.Length))  
#抓出表上第8個的名字（5cm）
names(which.max(table(iris$Sepal.Length)))

## 最大值、最小值-----
# max/min找出最大or最小的數值
max(iris$Sepal.Length)        
min(iris$Sepal.Length)       
#which.max/which.min找出最大or最小的是第幾筆資料
which.max(iris$Sepal.Length) 
which.min(iris$Sepal.Length)  

#全距 = 最大-最小
max(iris$Sepal.Length) - min(iris$Sepal.Length)
#range找出最大值和最小值
range(iris$Sepal.Length)         
#利用diff將range找出的最大最小值相減
diff(range(iris$Sepal.Length))        

## 百分位數-----
# quantile()找出百分位數，0.25, 0.5, 0.75百分位數就是第一二三四分位數
quantile(iris$Sepal.Length, probs=c(0.25, 0.75), type=6) 
quantile(iris$Sepal.Length, probs=0.3, type=6)          

#四分位距 = 第三百分位數 - 第一百分位數
#算出Q3和Q2
Q <- quantile(iris$Sepal.Length, probs=c(0.25, 0.75), type=6) 
#將兩個數值相減並轉成數字
as.numeric(Q[2]-Q[1])  
#也可以用前面用過的diff()
as.numeric(diff(Q))
#直接用指令計算
IQR(iris$Sepal.Length, type=6)   

## 變異數 & 標準差-----
# 手算變異數：sum((x-mean(x))^2)/(n-1)
a1 <- iris$Sepal.Length-mean(iris$Sepal.Length)
a2 <- a1^2                      
sum(a2)                        
sum(a2)/(nrow(iris)-1)       
#把上面整合成一步
sum((iris$Sepal.Length - mean(iris$Sepal.Length))^2)/(nrow(iris)-1)
#直接用指令算
var(iris$Sepal.Length)   

#標準差 = 變異數開根號
sqrt(sum(a2)/(nrow(iris)-1))
#直接用指令算
sd(iris$Sepal.Length) 

##### 統計繪圖 （新增boxplot和散佈圖新功能） #####
# 函數的完整說明，可以使用?函數名稱來查詢，或是R studio右邊help中搜尋函數名稱
# Ex: ?barplot()

# 使圖固定為正方形(可加可不加)
par(pty='s')

## 圓餅圖
# 要先轉換成次數表才能畫
# 直接放資料：Error:'x'values must be positive

# Ex1: species
species <- table(iris$Species)
pie(species
    ,main = 'Pie of iris species') #主標題

# Ex2: Petal.Length, 2公分一組
cutpoint <- seq(from=1,to=7,by=2)
plc <- table(cut(iris$Petal.Length,cutpoint))
pie(plc
    ,main = 'Pie of iris petal length'
    ,labels = c('1~3 cm','3~5 cm','5~7 cm')) #各個類別的標註

## 長條圖
# 跟圓餅圖相似，要轉成次數表才能繪製
# Ex: Petal.Length, 2公分一組
cutpoint <- seq(from=1,to=7,by=2)
plc <- table(cut(iris$Petal.Length,cutpoint))
barplot(plc
        ,main = 'barplot of iris petal length' 
        ,xlab = 'Petal length (cm)',ylab = 'conut' #自訂x, y 軸標圖
        ,ylim = c(0,60)) #自訂y軸範圍

### 折線圖
plot(plc,type = 'b' 
     ,main = 'line graph of iris petal length' 
     ,xlab = 'Petal length (cm)',ylab = 'conut' 
     ,ylim = c(0,60))

plot(plc,type = 'l' 
     ,main = 'line graph of iris petal length' 
     ,xlab = 'Petal length (cm)',ylab = 'conut' 
     ,ylim = c(0,60))

# 累積長條/折線圖
cumsumt <- cumsum(plc)
barplot(cumsum(plc) #改用累積次數分配表
        ,main = 'cumulative barplot of iris petal length' 
        ,xlab = 'Petal length (cm)',ylab = 'cumulative conut' 
        ,ylim = c(0,150)) 

plot(cumsumt,type = 'b' 
     ,main = 'cumulative line graph of iris petal length' 
     ,xlab = 'Petal length (cm)',ylab = 'cumulative conut' 
     ,ylim = c(0,150))

## 直方圖
# 直接放入data，不用轉成次數分配表
hist(iris$Petal.Length
     ,main = 'Histogram of iris petal length' 
     ,xlab = 'Petal length (cm)'
     ,ylim = c(0,35)
     ,col = 'ivory') #自訂顏色示範

# 補充
hist(iris$Petal.Length
     ,breaks = 15 #可以自定要分成幾段
     ,freq = T #可以自定y軸要用freq(出現頻率)或是density(機率密度)
     ,main = 'Histogram of iris petal length' 
     ,xlab = 'Petal length (cm)'
     ,ylim = c(0,35)
     ,col = 'ivory') #自定顏色示範

## 散佈圖 (新增加上直線功能)
plot(iris$Petal.Length,iris$Sepal.Length #x and y
     ,main = 'Scatter plot of iris petal length & sepal length' 
     ,xlab = 'Petal length (cm)'
     ,ylab = 'Sepal length (cm)'
     ,pch = 16)

# abline()加上直線
# ex: 加上x = 3 cm的垂直線以及y = 6的水平線
abline(v = 3, col = 'red') # v for vertical
abline(h = 6, col = 'red') # h for horizontal

## 累積次數多邊圖
cutpoint <- seq(from=4,to=8,by=0.5)
cut.sepal.length <- cut(iris$Sepal.Length,cutpoint)
table.sepal.length <- table(cut.sepal.length)
cumu.sepal.length <- c(0,cumsum(table.sepal.length)) 

plot(cutpoint,cumu.sepal.length
     ,main = 'cumulative frequency polygon of iris sepal length' 
     ,xlab = 'Sepal length (cm)',ylab = 'cumulative frequency' 
     ,ylim = c(0,150)
     ,pch = 16
     ,xaxt= 'n') #xaxt='n'會讓繪製出來的圖沒有x刻度（yaxt='n'就是沒有y刻度）
lines(cutpoint, cumu.sepal.length)
#axis()加上軸線上刻度
#1代表x軸,2代表y軸
axis(1,cutpoint)

## 箱型圖 

# 構成boxplot的要素：四分位數、IQR
quantile(iris$Sepal.Length,c(0.25,0.5,0.75),type = 6)
IQR(iris$Sepal.Length,type = 6)

boxplot(iris$Sepal.Length
        ,main = 'Boxplot of iris sepal length' 
        ,ylab = 'Sepal length (cm)'
        ,ylim = c(4,8)
        ,col = 'gray')

boxplot(iris[,1:4]
        ,main = 'Boxplot of iris sepal and petals length and width'
        ,ylab = 'cm')

boxplot(iris$Sepal.Length ~ iris$Species
        ,main = 'Boxplot of iris sepal length with 3 species'
        ,xlab = 'Species', ylab = 'Sepal length (cm)')

