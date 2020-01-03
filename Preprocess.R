#+++需要的套件+++#
library(tidyverse)
library(gganimate)
library(plotly)
library(openxlsx)

#+++讀取資料+++#
setwd("~/Desktop/data_visualization/dataset")
n <- list.files()
df <- read.csv(n[1],header = FALSE)

#+++確認資料型態與理解變數內容+++#
str(df)
summary(df)

#+++資料清理+++#
df <- df[,-1]
dfName_v<- as.vector(t(df[2,]))
dfName_v[9:11] <- c("學生總數","男學生總數","女學生總數")
colnames(df) <- dfName_v
df <-df[-c(1,2,3),]

#---資料型態轉換---#
df[,1] <- as.numeric(as.character(df[,1]))
for(i in 9:11){
  df[,i] <- as.numeric(as.character(df[,i]))}

#+++整理完的資料+++#
head(df)
summary(df)
str(df)