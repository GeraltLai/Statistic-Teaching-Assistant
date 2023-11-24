# 20211014_計算統計值_程式碼

# 讀檔
body <- read.csv("C:/Users/stupi/Desktop/body.csv", header=TRUE)
body <- read.csv(file.choose(), header=TRUE)

# 敘述統計-平均數
sum(body$ages)            # 計算年齡總和
sum(body$ages)/nrow(body) # 年齡總和/樣本數
mean(body$ages)           # 直接用指令算

# 敘述統計-中位數、眾數
median(body$ages)                  # 直接用指令計算年齡中位數
table(body$ages)                   # 算出各個年齡分別有多少人
which.max(table(body$ages))        # 挑出最大的那個(40歲的，位於第19個)
names(which.max(table(body$ages))) # 抓出年齡40歲的名稱

# 敘述統計-變異數
a1 <- body$ages-mean(body$ages) # 計算分子(尚未平方)
a2 <- a1^2                      # 平方
sum(a2)                         # 分子加總
sum(a2)/(nrow(body)-1)          # 除以分母(樣本數-1)
var(body$ages)                  # 直接用指令算

# 敘述統計-標準差
sqrt(sum(a2)/(nrow(body)-1)) # 將計算好的變異數開根號
sd(body$ages)                # 直接用指令算

# 敘述統計-最大值、最小值
max(body$ages)        # 最大值(81歲)
min(body$ages)        # 最小值(22歲)
which.max(body$ages)  # 最大值位在第77個
which.min(body$ages)  # 最小值位在第2個

# 敘述統計-全距
max(body$ages)-min(body$ages) # 最大值減最小值
range(body$ages)              # 抓出資料的範圍(最小值與最大值)
diff(range(body$ages))        # 算相鄰兩數的差異

# 敘述統計-四分位數、百分位數
quantile(body$ages, probs=c(0.25, 0.75), type=6) # 計算第一四分位數、第三四分位數
quantile(body$ages, probs=0.3, type=6)           # 計算第30百分位數

# 敘述統計-四分位距
Q <- quantile(body$ages, probs=c(0.25, 0.75), type=6) # 計算第一四分位數、第三四分位數(存入Q中)
as.numeric(Q[2]-Q[1])                                 # 將四分位數相減，並轉成數值
IQR(body$ages, type=6)                                # 直接用指令算      

# 敘述統計-條件式(變數寫法)
x = body[1,2]
if(x >= 65){
  print("中老年人")
}else{
  print("年輕人")
}
# 敘述統計-條件式(非變數寫法)
if(body$ages[1] >= 65){
  print("中老年人")
}else{
  print("年輕人")
}


# 敘述統計-條件式(另外的寫法)
body$old <- ifelse(body$age>=65, 1, 0)  # 年齡大於65的標1，小於24的標0
body$old                                # 印出來
sum(body$old)                           # 算出年齡大於24的人數
sum(body$old)/nrow(body)                # 算出年齡大於24的整體比例


# 簡易迴圈-例子
1+2+3+4+5
total = 0
for(i in 1:5){
  total = total + i
}
total

# 迴圈 + 條件辦別
total = 0
for(i in 1:nrow(body)){
  if(body[i,2] >= 65){
    total = total +1
  }else{
    total =total
  }
}
total

# 練習
total = 0
for(i in 1:nrow(body)){
  if(body[i,6] == "M"){
    total = total +1
  }else{
    total = total
  }
}
total
