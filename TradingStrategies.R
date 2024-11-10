library(data.table)
class(DATA)
df = DATA[,c('Date','PRIME','Shares Outstanding (Eop)','Cash And Cash Equivalents','Operating Income','Total Debt Per Share','Preferred Stock','Minority Interest')]
names(df)=c('date','ticker','so','cash','oi','tds','ps','mi')

library(data.table)
setDT(df)
df=df[order(ticker,date)]
df[,c('oi2','oi3','oi4'):=shift(oi,n=1:3),by=ticker]
df[,oiavg:=(oi+oi2+oi3+oi4)/4]
df2 = df[date %in% c(201706,201606,201506)]
setDT(pricedf)
pricedf[,period:=format(Date,'%Y')]
df2[,Year:=substr(date, 1, 4)]
df2[pricedf,price:=Price,on=c(ticker='Ticker',Year='period')]

df2[,td:=so*tds]
df2[,ey:=oiavg/(so*price+td - cash +ps + mi)]
################### lab # 3 solution above ######################

#######  if we want to save df2 as rds file ##################
#remember to change directory
saveRDS(df2,'df2.rds')
##########  end save ##############################################

dfno = df2[is.na(ey),.(ticker,ey,price,date)]
df3 = df2[is.finite(ey),.(ticker,ey,price,date)]
df3 =df3[order(date,-ey)]

df3[date==201606]
df3[date==201706]

#### Old Code #####################
e1 = df3[,head(ticker,1),by=date] #
###################################
#### New Code #####################
e1 = df3[,head(ticker,10),by=date] #
###################################

e1
library(quantmod)

#### Old Code ###########################################################
price=c()

for(i in e1$V1)                                                         #
{ 
  st=getSymbols(i,from='2018-05-20',to='2018-05-31',auto.assign = F)   #
  p = as.vector(last(st[,6]))                                           #
  price = c(price,p)                                                    #
}                                                                       #
#########################################################################
#### New Code ###########################################################
for(i in e1$V1)                                                         #
{ 
  tryCatch({
  st=getSymbols(i,from='2018-05-20',to='2018-05-31',auto.assign = F)    #
  p = as.vector(last(st[,6]))                                           #
  e1[V1==i,price:=p]
  },error=function(e){})                                                #
}
e1 = e1[is.finite(price)]
e1 = e1[,head(.SD,1),by=date]
names(e1) = c('date','V1','sellprice')
#########################################################################
e1

#e1[,sellprice:=price] Old don't need it anymore
e1[df3,buyprice:=price,on=c(V1='ticker',date='date')]
e1[,ret:=(sellprice/buyprice)-1]
e1$ret
1+e1$ret
11000*(1+e1$ret)
sum(11000*(1+e1$ret))
fv=sum(11000*(1+e1$ret))

lab4 = function(r)
{
 t= 11000*(1+r)^3 + 11000*(1+r)^2 + 11000*(1+r)- fv
 return(t)
}

uniroot(lab4,lower = 0,upper = .8) #old code 
uniroot(lab4,lower = -1,upper = 1) #new code 

df4=df3[,head(ticker,15),by=date]
df5=df3[ey>0,tail(ticker,15),by=date]
df6=df3[ey<0,head(ticker,15),by=date]
df7=df3[ey<0,tail(ticker,15),by=date]

df8=rbind(df4,df5,df6,df7)
NROW(unique(df8$V1))

tickers = unique(df8$V1)
for(i in tickers)
{
  tryCatch({
    st=getSymbols(i,from='2018-05-20',to='2018-05-31',auto.assign = F)
    p = as.vector(last(st[,6]))
    df8[V1==i,sellprice:=p]
  },error=function(e){})
}

#strategy 1
df4[df8,sellprice:=sellprice,on=c(V1='V1')]
df4[df3,buyprice:=price,on=c(V1='ticker',date='date')]
df4[,ret:=(sellprice/buyprice)-1]
strat1 = df4[is.finite(ret),head(ret,1),by=date]
fv=sum(11000*(1+strat1$V1))
uniroot(lab4,lower = 0,upper = .8) #old code
uniroot(lab4,lower = -1,upper = 1) #new code
#0.1143969

#strategy 2
df5[df8,sellprice:=sellprice,on=c(V1='V1')]
df5[df3,buyprice:=price,on=c(V1='ticker',date='date')]
df5[,ret:=(sellprice/buyprice)-1]
strat1 = df5[is.finite(ret),tail(ret,1),by=date]
fv=sum(11000*(1+strat1$V1))
uniroot(lab4,lower = -.8,upper = .8)
#-0.06886386

#strategy 3
df6[df8,sellprice:=sellprice,on=c(V1='V1')]
df6[df3,buyprice:=price,on=c(V1='ticker',date='date')]
df6[,ret:=(sellprice/buyprice)-1]
strat1 = df6[is.finite(ret),head(ret,1),by=date]
fv=sum(11000*(1+strat1$V1))
uniroot(lab4,lower = -.8,upper = .8)
#-0.06901987

#strategy 4
df7[df8,sellprice:=sellprice,on=c(V1='V1')]
df7[df3,buyprice:=price,on=c(V1='ticker',date='date')]
df7[,ret:=(sellprice/buyprice)-1]
strat1 = df7[is.finite(ret),tail(ret,1),by=date]
fv=sum(11000*(1+strat1$V1))
uniroot(lab4,lower = -.8,upper = .8) #old code
uniroot(lab4,lower = -.8,upper = 2) #new code
#0.3013305


#strategy 5
strat1 = df4[is.finite(ret),mean(head(ret,10)),by=date]
fv=sum(11000*(1+strat1$V1))
uniroot(lab4,lower = 0,upper = 5) #old code
uniroot(lab4,lower = 0,upper = 100) #new code
#1.393609

#strategy 6
strat1 = df5[is.finite(ret),mean(tail(ret,10)),by=date]
fv=sum(11000*(1+strat1$V1))
uniroot(lab4,lower = 0,upper = 5)
#0.09298145

#strategy 7
strat1 = df6[is.finite(ret),mean(head(ret,10)),by=date]
fv=sum(11000*(1+strat1$V1))
uniroot(lab4,lower = 0,upper = 5)
#0.03085361

#strategy 8
strat1 = df7[is.finite(ret),mean(tail(ret,10)),by=date]
fv=sum(11000*(1+strat1$V1))
uniroot(lab4,lower = 0,upper = 5)
#0.6755121