library(lubridate)
library(ggplot2)
library(TTR)
library(ggfortify)
library(forecast)

d <- read.csv('Total_consumption_(Btu)_for_all_sectors_monthly.csv',header=T)
head(d)
consumption_ts <- ts(rev(d$MMBtu),frequency=12,start=c(2001,1))
autoplot(consumption_ts,ts.colour='dodgerblue3')

d.arima <- auto.arima(consumption_ts)
d.forecast <- forecast(d.arima,level=c(95),h=12)
autoplot(d.forecast)


ts12 = SMA(consumption_ts,n=12)
autoplot(ts12)

comps <- decompose(consumption_ts)
autoplot(comps)
