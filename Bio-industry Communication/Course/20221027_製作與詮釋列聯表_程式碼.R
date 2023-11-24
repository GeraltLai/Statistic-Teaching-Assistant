#20221027 製作與詮釋列聯表
#If you see garbled characters, please reopen with UTF-8 encoding format
rm(list=ls())

##### 列聯表 #####
data <- read.csv('titanic.csv',header=T,sep=',')

### 雙變數列聯表
#Ex: 性別與生還關係
table1 <- table('生還' = data$Survived, sex = data$Sex)
class(table1)
table1

table2 <- xtabs(~ Survived + Sex, data = data)
class(table2)
table2

### 比例列聯表
#最直觀的方法
table1/sum(table1)

#利用函數來做
prop.table(table1)
#1:row, 2:column，請注意兩者差異，選用適當的答案
prop.table(table1,margin = 1)
prop.table(table1,margin = 2)

### 多變數列聯表
#Ex: 性別、艙等與生還關係

#艙等實際上是ordinal data，將其轉換為factor
#使用table()作多變數列聯表，會產出可讀性低的結果，為錯誤示範
data$Pclass <- factor(data$Pclass)
table(sex = data$Sex
      , Pclass = data$Pclass
      , survived = data$Survived)

#多變數列聯表時，使用ftable能更好的呈現
#注意ftable的依變數要放在最後，繪製出來會在column（事後再手動轉成在row）
ft <- ftable(sex = data$Sex
       , Pclass = data$Pclass
       , survived = data$Survived)
#也可以轉換為比例，此時margin=1（因為事後要再手動轉方向）
prop.table(ft,1)


