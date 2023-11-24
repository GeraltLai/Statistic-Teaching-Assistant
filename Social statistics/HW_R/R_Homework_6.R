####
rm(list=ls())

### 6-1
result=0
for(i in 1:50){
  result=result+2*i-1
}
result

### 6-2
weather=sample(c("sunny", "rainy", "cloudy"), size = 1)
if(weather=="sunny"){
  print("出去玩")
}else if(weather=="rainy"){
  print("待在家")
}else if(weather=="cloudy"){
  print("去健身房")
}

