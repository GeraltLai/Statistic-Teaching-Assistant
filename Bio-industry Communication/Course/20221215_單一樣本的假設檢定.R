#20221215 單一樣本的假設檢定
#If you see garbled characters, please reopen with UTF-8 encoding format

##### t test #####
beer <- read.csv('beer.csv',header = T,sep=',')

# two sided testing
t.test(beer$beer
       ,alternative = 'two.sided' # 雙尾/左尾/右尾檢定
       ,mu=350 
       ,conf.level = 0.95) # 1-alpha

qt(0.025,14) # 查表值

# one sided testing
t.test(beer$beer
       ,alternative = 'less' # 對立假說(H1)的大小於符號
       ,mu=350 
       ,conf.level = 0.95) 

qt(0.05,14) # 查表值，此時alpha不用除以2



