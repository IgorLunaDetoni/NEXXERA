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



#Trabalhar de forma semanal

