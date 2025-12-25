# Investment_and_Trading
R-based implementation of core technical analysis indicators, including moving averages, RSI, MACD, and Bollinger Bands, using real market data.

## Lab 7: Technical Analysis Indicators (R)

This lab, from the undergrad UCD Investment and Trading module (STAT30320) implements a range of widely used **technical analysis indicators** in R using real equity market data. The objective is to demonstrate how common trading indicators can be computed, visualised, and combined using standard financial libraries.

### Features
- Retrieval of historical equity price data via Yahoo Finance
- Computation of key technical indicators:
  - Simple Moving Averages (50-day and 200-day)
  - Relative Strength Index (RSI)
  - Moving Average Convergence Divergence (MACD)
  - Bollinger Bands
- Combination of indicators into a single structured dataset
- Visualisation of prices and indicators using financial charts

### Tools and Libraries
- `quantmod`
- `TTR`
- `dplyr`

### Notes
- Indicators are computed using daily adjusted price data.
- Missing values resulting from indicator lookback periods are removed prior to analysis.
- The lab focuses on implementation and interpretation rather than trading strategy optimisation.
