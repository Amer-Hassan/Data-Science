# In rstudio, install package quantmod
# load package 
library(quantmod)

# this is the three month t-bill rate. Note this is in percentage.
tb3=getSymbols('TB3MS',src='FRED', auto.assign = FALSE)
# The following is to obtain the t-bill rate from 2012-01 to 2020-08.

tb=as.vector(tb3[937:1040]) 

# obtain the daily return of sp500 index. "^GSPC" is the symbol for sp500 index.

sp500=getSymbols('^GSPC',from='2012-01-01',to='2020-08-31',auto.assign=FALSE)

sp500.adj=sp500$GSPC.Adjusted


# read the help file of monthlyReturn to find out how to compute log return
# instead of arithmetic return.
sp500.rtn.monthly=monthlyReturn(sp500.adj,type='log')


AMD=getSymbols('AMD',from='2012-01-01',to='2020-08-31',auto.assign=FALSE)
AMD.adj=AMD$AMD.Adjusted
AMD.rtn.monthly=monthlyReturn(AMD.adj,type='log')
# this computes the excess sp500 monthly return. For simplicity, we assume that 
# the monthly t-bill return (monthly risk free rate) is (annualized t-bill rate)/12.
sp500.excess=sp500.rtn.monthly-tb/(100*12)

# you job is to compute the excess return of your stock, and run a regression 
# with sp500.excess.

AMD.excess=AMD.rtn.monthly-tb/(100*12)

regression_excess = data.frame(AMD.excess,sp500.excess)
reg = lm(AMD.excess ~ sp500.excess, data = regression_excess)
summary(reg)

plot(reg)

#output
Call:
  lm(formula = AMD.excess ~ sp500.excess, data = regression_excess)

Residuals:
  Min       1Q   Median       3Q      Max 
-0.46072 -0.07354  0.00015  0.09098  0.29945 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.006345   0.014499   0.438    0.663    
sp500.excess 2.131541   0.377849   5.641 1.52e-07 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.1436 on 102 degrees of freedom
Multiple R-squared:  0.2378,	Adjusted R-squared:  0.2303 
F-statistic: 31.82 on 1 and 102 DF,  p-value: 1.518e-07

#1B Testing if B0 is significantly different from  0 and B1 are significantly different from 1
B0 = 0
B0 != 0
0.006345 / 0.014499 = 0.438

B1 = 1
B1 != 1

B1.null=(2.131541-1)/0.377849 = 2.994691
B1.null

#0 is not significantly different from B0, reject the null. 1 is significantly different from B1, accept the null. AMD has a beta
# that is significantly different from that of the market, meaning it is more sucesptible to changes in the market.

#1c - conclusions about AMD based on CAPM. CAPM = B1(Emr)+B0. We can conclude that if the S&P 500 represents the market return
# of 1, and given that we have a Beta of 2.13, that AMD is likely to react 2 times as much as the market does. 


#2
vec=(1:100)
result = numeric(length(vec))
for (i in 1:length(vec)) {
  if (vec[i] < 5 || vec[i] > 90) {
    result[i] = vec[i] * 10
  } else {
    result[i] = vec[i] * 0.1
  }
}
print(result)

