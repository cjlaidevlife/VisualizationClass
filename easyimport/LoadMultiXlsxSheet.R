#用來簡單解決輸入單xlsx檔案有多個Sheet的導入問題。
#---Input---#
path <- readline("Where are you data(path):");
findWord <- readline("Enter keywords:");
dfName <- readline("Nickname:");# Name your sheet Nickname from data.
setwd(path)
#---Check data---# 
foderfile <- list.files()
wantdata <- grep(findWord,foderfile) # your dataname or keyword.
xlsxNumber<- length(readxl::excel_sheets(foderfile[wantdata]))
dfName <- paste0(dfName,1:xlsxNumber)
#---Create---#  
for(i in 1:xlsxNumber){
  assign(dfName[i],openxlsx::read.xlsx(foderfile[wantdata],sheet = i))
}
#---Clean---#
rm(dfName);rm(findWord);rm(foderfile);rm(i);rm(path);rm(wantdata);rm(xlsxNumber);
cat("\014")# Clear your R console.
#---End---#
