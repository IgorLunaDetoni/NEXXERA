library(tidyverse)
library(dplyr)
library(forecast)
library(tseries)
library(urca)
library(Quandl)
library(dplyr)
library(ggplot2)
library(fGarch)
library(rugarch)
library(FinTS)
library(xts)
library(prophet)
library(NTS)
library(gridExtra)
library(lubridate)
library(zoo)
library(readr)
library(NFCP)



df <- read_delim("C:/Users/igor-/OneDrive/Área de Trabalho/Deepen/NEXXERA/DOCS_AGG_SEMANA_202312061513/_SELECT_COD_CEDENTE_SUM_VALOR_NOMINAL_AS_TOTAL_CAST_DATA_VENCIME_202312061513.csv", 
                                                                                             delim = ";", escape_double = FALSE, trim_ws = TRUE)



#Trabalhar de forma semanal x = df[df['COD_CEDENTE'] == 38631]

x<-df %>% dplyr::filter(COD_CEDENTE == '38631')


x <- x %>% dplyr::select(c('DATA_FORMATADA','TOTAL'))



# ACF e PACF --------------------------------------------------------------

ret <- x$TOTAL[-1]
ret2 <- x$TOTAL[-1]^2

Acf(ret,60, na.action = na.pass)
Acf(x$TOTAL,60, na.action = na.pass)
Acf(ret2,60, na.action = na.pass)
Acf(ret2,60,type="partial", na.action = na.pass)


# Time series -------------------------------------------------------------


time_series_weekly <- ts(x$TOTAL, frequency = 52)  # 52 weeks in a year

# If you're using 'xts' for date-based data
data_xts_weekly <- xts(x$TOTAL, order.by = as.Date(x$DATA_FORMATADA))


plot(time_series_weekly)


decomposed_weekly <- decompose(time_series_weekly)
autoplot(decomposed_weekly)




# Forecast básico ---------------------------------------------------------



# Fit a time series model (e.g., ARIMA)
model_weekly <- auto.arima(time_series_weekly)

plot(model_weekly)

# Generate forecasts
forecast_values_weekly <- forecast(model_weekly, h = 16)  # Adjust the forecast horizon 'h' as needed
plot(forecast_values_weekly)





# Trabalhar principalmente com sazonalidade -------------------------------

# Tem que fazer um modelo que foque principalmente na sazonalidade e no erro








