##### 1
grade=c(53,67,72,78,88,90)
rank=c()
for(i in 1:length(grade)){
  if(grade[i]>=90){
    rank[i]="P"
  }else if(grade[i]>=80){
    rank[i]="E"
  }else if(grade[i]>=70){
    rank[i]="G"
  }else if(grade[i]>=60){
    rank[i]="N"
  }else{
    rank[i]="F"
  }
}
data.frame(grade,rank)

##### 2-1
data=iris
y=data$Sepal.Length
trt=factor(data$Species)
fit=lm(y~trt)
anova(fit)

##### 2-2 
library(agricolae)
LSD.test(fit,trt = "trt",console = T)
library(asbio)
pairw.anova(y=y,x=trt,method="lsd")


##### 3
mtcars
model1=lm(hp~disp,data=mtcars)
summary(model1)
model2=lm(hp~disp+mpg+wt,data=mtcars)
summary(model2)
