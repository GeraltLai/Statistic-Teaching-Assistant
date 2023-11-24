#####
rm(list=ls())

##### data
airquality

##### 缺失值處理
data=airquality
### 方法一
# 回傳NA的位置
is.na(data[,1])
# 計算缺失值總數
sum(is.na(data[,1]))
# 回傳遺失值得列(欄)數
which(is.na(data[,1]))
# 移除有缺失值的data
new=data[-which(is.na(data[,1])),]
new

### 方法二
complete.cases(data)
new=data[complete.cases(data),]
new

##### 開新視窗
#windows()
# 建立一個畫布，上面已經有一張散布圖(Ozone to Wind)
plot(x=new$Ozone,
     y=new$Solar.R,
     main="Ozone to Solar.R",
     xlab="Ozone(ppb)",
     ylab="Solar.R(sv)",
     pch=16# 點的圖形
) 

# 現在我們要在這張圖片中，把5月的資料點用藍色標註上去
May_data=new[new$Month==7, ]   # 找出5月的資料
May_data

# 標上藍色的點
points(x=May_data$Ozone,                       
       y=May_data$Solar.R, 
       pch=16,                  # 點的圖形
       col="blue")              # 顏色

# 同理，也可以把8月的資料點用紅色標註上去
Aug_data=new[new$Month==8, ]   # 找出8月的資料
# 標上紅色的點
points(x=Aug_data$Ozone, 
       y=Aug_data$Solar.R, 
       pch=16,               # 點的圖形
       col="red")            # 顏色

# 在右上角做出標示
legend("topright",                                # 表示在右上角
       pch = 16,                                   # pch代表點的圖案
       col = c("blue", "red", "black"),           # col代表顏色 
       legend = c("July", "August", "Other Month"), # 顏色所對應的名稱
       cex=1
)

# 添加垂直線
mean(new$Ozone)
mean(new$Solar.R)
abline(h=mean(new$Solar.R),v=mean(new$Ozone),lwd=2,col="cornflowerblue")

# 添加文字
text(x=150,y=200,label="Solar.R平均值=184.8")
text(x=65,y=320,label="Ozone平均值=42.1")
