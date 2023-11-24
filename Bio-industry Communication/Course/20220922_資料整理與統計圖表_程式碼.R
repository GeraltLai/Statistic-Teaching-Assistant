#20220922 資料整理與統計圖表
#If you see garbled characters, please reopen with UTF-8 encoding format

##### 資料整理 #####
rm(list=ls())

# 讀入資料
# 可以設定好工作路徑，把檔案都放在這個資料夾中方便讀取
setwd('~/統計學與實習/111-1/實習/0922/') 
iris <- read.csv('iris.csv',sep=',',header = T) 
iris <- read.csv(file.choose(),sep=',',header = T)

# 讀入資料方法二
# iris是r內建的資料集，可以用data(iris)來讀取，一樣可以在系統中叫出來
# 此方法僅限R內建或package包含的資料，不是每種資料都可以
data(iris)

head(iris)
dim(iris)
summary(iris)



# 資料存取
# data[row,column]來選擇要存取的資料
# data$column也可以選擇資料（僅限column）
iris[1,]

iris.5 <- iris[1:5,]
iris.5[,5] <- c('a','b','c','d','e')
iris.5

iris.5$Sepal.Length

# 排序
iris.5 <- iris[1:5,]
iris.5$Sepal.Length

# sort, rank, order
# sort:把數值排序
# rank:數值依大小排序後的位置
# order:sorting後數列中資料點在原始資料的位置
sort(iris.5$Sepal.Length)
rank(iris.5$Sepal.Length)
order(iris.5$Sepal.Length)

# 條件資料選取
# Ex1:選出品種為versicolor的資料
# unique可以查看資料裡面有哪些類別
unique(iris$Species)

# 運算模式：利用which()找出符合條件的row有哪些，再取出這些資料
iris.versicolor <- iris[which(iris$Species == 'versicolor'),]
unique(iris.versicolor$Species)

# Ex2:選出Sepal length介於5~5.5公分的資料
summary(iris$Sepal.Length)

iris.sepl <- iris[which(iris$Sepal.Length > 5 & iris$Sepal.Length < 5.5),]
summary(iris.sepl$Sepal.Length)

##### 次數分配表 #####
# 類別型變數製表
# 以species為例
table(iris$Species)
# 換算成比例（除以資料筆數）
table(iris$Species)/nrow(iris)

# 連續型變數製表
# 以Petal.Length為例

# 確認數值分佈（1至6.9）
summary(iris$Petal.Length)

# 分割連續型資料為類別型
# Ex: 每二公分切成一組 (1~3cm, 3~5cm, 5~7cm ...)
# cut(): 將連續型資料依照指定的cutpoint分組
# cut(資料,cutpoint,label(每個區間的名稱),right = T(是否包含區間最大值)) 詳見?cut()
cutpoint <- seq(from=1,to=7,by=2)
iris$Petal.Length_cut <- cut(iris$Petal.Length,cutpoint)

table(iris$Petal.Length_cut)
table(iris$Petal.Length_cut)/nrow(iris)

# 累積次數
cumsum(table(iris$Petal.Length_cut))


##### 統計繪圖 #####
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

## 散佈圖
plot(iris$Petal.Length,iris$Sepal.Length #x and y
     ,main = 'Scatter plot of iris petal length & sepal length' 
     ,xlab = 'Petal length (cm)'
     ,ylab = 'Sepal length (cm)'
     ,pch = 10) #自定點樣式示範

# 補充：趨勢線（迴歸線）
# 繪製底圖，再繪製趨勢線疊上去
plot(iris$Petal.Length,iris$Sepal.Length 
     ,main = 'Scatter plot of iris petal length & sepal length' 
     ,xlab = 'Petal length (cm)'
     ,ylab = 'Sepal length (cm)'
     ,pch = 10) 
# lm(y~x)建立趨勢線，abline()畫上去
abline(lm(iris$Sepal.Length~iris$Petal.Length)
       ,col = 'red')

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
