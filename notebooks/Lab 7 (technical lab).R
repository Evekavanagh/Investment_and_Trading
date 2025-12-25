#lab 7 - technical lab  (### to change)
# ======================================================
# Technical Analysis Indicators in R
# ======================================================
# Install missing packages
install.packages("quantmod")
install.packages("TTR")
install.packages("dplyr")

# Load libraries
library(quantmod)
library(TTR)
library(dplyr)

# ------------------------------------------------------
# Example: Get stock data (Apple in this case)
# ------------------------------------------------------
getSymbols("APPL", src = "yahoo", from = "2022-01-01", auto.assign = TRUE) ###
prices <- na.omit(AAPL)  # OHLC time series                                ###

# ------------------------------------------------------
# Compute Technical Indicators
# ------------------------------------------------------
compute_technicals <- function(prices) {
  close <- Cl(prices)
  
  # Moving Averages
  ma50 <- SMA(close, n = 50)
  ma200 <- SMA(close, n = 200)
  
  # RSI
  rsi14 <- RSI(close, n = 14)
  
  # MACD
  macd_vals <- MACD(close, nFast = 12, nSlow = 26, nSig = 9, maType = EMA)
  
  # Bollinger Bands
  bb <- BBands(HLC(prices), n = 20, maType = SMA, sd = 2)
  
  # Volume (already in OHLC data)
  vol <- Vo(prices)
  
  # Combine all indicators into one object
  indicators <- cbind(
    close,
    ma50,
    ma200,
    rsi14,
    macd_vals,
    bb[, c("up", "dn", "mavg")],
    vol
  )
  
  colnames(indicators) <- c(
    "Close", "MA50", "MA200", "RSI14",
    "MACD", "Signal",
    "BB Upper", "BB Lower", "BB Mid",
    "Volume"
  )
  
  return(na.omit(indicators))
}

# ------------------------------------------------------
# Run the function
# ------------------------------------------------------
techs <- compute_technicals(prices)

# Preview
head(techs)

# ------------------------------------------------------
# Example Chart with Indicators
# ------------------------------------------------------
chartSeries(prices, name = "Apple Inc. (AAPL)")                           ###
addSMA(n = 50, col = "blue")
addSMA(n = 200, col = "red")

# Green/yellow line → Apple’s daily stock price.

addRSI ( n = 14 )
addMACD( )
addBBands ( n =20 , sd = 2 )

