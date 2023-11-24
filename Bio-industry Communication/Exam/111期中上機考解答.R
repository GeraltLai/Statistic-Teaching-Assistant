####
rm(list = ls())

### 1-a
data1 = read.csv(file = "C:/Users/stupi/Desktop/McDonald's.csv", header = T)
head(data1)
# Ans

### 1-b
data1$diff = data1$bigmac2009 - data1$bigmac2003
# Ans

### 1-c
mean(data1$diff)
sd(data1$diff)
# Ans

### 2-a
data2 = read.table(file = "C:/Users/stupi/Desktop/body_check.txt", header = T)
# Ans

### 2-b
barplot(table(data2$min), xlab = "每日運動時間", ylab = "人數", 
        main = "不同的每日運動時間人數")
# Ans

### 2-c
cutpoint <- seq(from = 20, to = 40, by = 5)
data.cut <- cut(data2$year, cutpoint, right = F)
cumutable <- c(0, cumsum(table(data.cut)))
plot(cutpoint ,cumutable, xlab = "年齡", ylab = "累積次數",
     main = "成年人年齡累積次數", pch = 16)
lines(cutpoint, cumutable)
# Ans

### 2-d
round(data2$weight[50]/(data2$height[50]/100)^2, 2)
# Ans

### 2-e
# 方法1：intersect
girl = which(data2$gender == "F")
weight = which(data2$weight >= 50)
round(length(intersect(girl, weight))/length(girl), 1)
# 方法2：ifelse
round(sum(ifelse(data2$gender == "F" & data2$weight >= 50, 1, 0))/
        sum(ifelse(data2$gender == "F", 1, 0)), 1)
# Ans

### 2-f
data2$BMI = round(data2$weight/(data2$height/100)^2, 2)
data2$cluster = c()
for(i in 1:length(data2$BMI)){
  if(data2$BMI[i] < 18.5){
    data2$cluster[i] = "過輕"
  }else if(18.5 <= data2$BMI[i] & data2$BMI[i] <= 24){
    data2$cluster[i] = "正常"
  }else{
    data2$cluster[i] = "過重"
  }
}
ans1 = ftable('BMI結果' = data2$cluster,
              "每日運動時間" = data2$min,
              sex = data2$gender)
ans1


## ans

### 3-a
pbinom(5, 20, 0.2)
# Ans

### 3-b
HW1 = c(1, 5, 9, 11, 16, 23, 31, 36, 40, 45, 47, 50)  # 第一次作業實交
HW2 = c(3, 6, 9, 16, 20, 27, 31, 36, 49, 50)          # 第二次作業實交
boy = seq(1, 50, 2)      # 男生
girl = seq(2, 50, 2)     # 女生
#  第一次作業有交，但第二次作業沒交的男生
intersect(boy, setdiff(HW1, HW2))
# Ans


