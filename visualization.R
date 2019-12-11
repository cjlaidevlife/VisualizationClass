setwd("~/Downloads") # dir
path = getwd()
#---
library(openxlsx)
library(tidyverse)
library(readxl)
library(DescTools)
#---
foderfile <- list.files(path = path)
wantdata <- grep("gap",foderfile) # key word.
xlsxNumber<- length(excel_sheets(foderfile[wantdata]))
dfName <- paste0("df",1:xlsxNumber)

for(i in 1:xlsxNumber){
  assign(dfName[i],read.xlsx(foderfile[wantdata],sheet = i))
}
#---
sum(dim(df1))
