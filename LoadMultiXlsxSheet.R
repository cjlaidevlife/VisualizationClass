library(openxlsx)
library(readxl)
#---
path <- readline("path:");# Key in your data path.
findWord <- readline("keyword:");# Key in your dataname or keyword.
dfName <- readline("data title:");# Key in you want to create sheet data title.
setwd(path)  #Your data path.
#---  
foderfile <- list.files(path = path)
wantdata <- grep(findWord,foderfile) # your dataname or keyword.
xlsxNumber<- length(excel_sheets(foderfile[wantdata]))
dfName <- paste0(dfName,1:xlsxNumber)
#---  
for(i in 1:xlsxNumber){
  assign(dfName[i],read.xlsx(foderfile[wantdata],sheet = i))
}# Create sheet data.
#---
rm(dfName);rm(findWord);rm(foderfile);rm(i);rm(path);rm(wantdata);rm(xlsxNumber);
cat("\014")# Clear your R console.
