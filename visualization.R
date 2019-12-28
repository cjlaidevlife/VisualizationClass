#---package---#
library(tidyverse)
library(openxlsx)
library(gganimate)
library(plotly)
#---load csv---#
setwd("~/Desktop/data_visualization")
n <- list.files()
df <- read.csv(n[28],header = FALSE)
# data ETL
df <- df[,-1]
dfName_v<- as.vector(t(df[2,]))
dfName_v[9:11] <- c("學生總數","男學生總數","女學生總數")
colnames(df) <- dfName_v
df <-df[-c(1,2,3),]

df[,1] <- as.numeric(as.character(df[,1]))
for(i in 9:11){
  df[,i] <- as.numeric(as.character(df[,i]))
}

# find data+++++++++++++++++++++++++++++++++++++++++++++++++
df_ShihChien <- 
  df%>%
    filter(學校名稱=="實踐大學" & 學年度=="104")
#state++++++++++++++++++++++++++++++++++++++++++++++++++++++
#max
male_n<- max(df_ShihChien$男學生總數)
female_n<- max(df_ShihChien$女學生總數)

ggplot(df_ShihChien,aes(男學生總數,女學生總數))+
  geom_point(aes(size=學生總數),alpha=0.7)+
  geom_label(data= df_ShihChien%>%
               filter(男學生總數==male_n),
             label="資訊科技與通訊學系",
             family="黑體-繁 中黑",
             fontface = "bold",
             colour = "white",
             fill="blue",
             vjust="inward",
             hjust="inward")+
  geom_label(data= df_ShihChien%>%
               filter(女學生總數==female_n),
             label="觀光管理學系",
             family="黑體-繁 中黑",
             fontface = "bold",
             colour = "white",
             fill="red")+
  geom_label(data= df_ShihChien%>%
               filter(系所名稱=="資訊科技與管理學系" & 學制=="學士班(日間)"),
             label="資訊科技與管理學系",
             family="黑體-繁 中黑",
             fontface = "bold",
             colour = "white",
             fill="green",
             vjust="inward",
             hjust="inward")+
  geom_label(x=0,y=0,
             label="最小值",
             family="黑體-繁 中黑",
             fontface = "bold",
             colour = "white",
             fill="gray",
             vjust="inward",
             hjust="inward")+
  theme(text=element_text(family="黑體-繁 中黑"))

# mean
male_mean<- mean(df_ShihChien$男學生總數)
female_mean<- mean(df_ShihChien$女學生總數)
male_median <- median(df_ShihChien$男學生總數)
female_median <- median(df_ShihChien$女學生總數)

ggplot(df_ShihChien,aes(男學生總數,女學生總數))+
  geom_point(aes(size=學生總數),alpha=0.7)+
  geom_hline(yintercept=female_mean, color="red", size=5,alpha=0.5) +
  geom_vline(xintercept=male_mean, color="blue", size=5,alpha=0.5) +
  geom_hline(yintercept=female_median, color="red", size=1) +
  geom_vline(xintercept=male_median, color="blue", size=1) +
  geom_label(data= df_ShihChien%>%
               filter(系所名稱=="資訊科技與管理學系" & 學制=="學士班(日間)"),
             label="資訊科技與管理學系",
             family="黑體-繁 中黑",
             fontface = "bold",
             colour = "white",
             fill="green",
             vjust="inward",
             hjust="inward")+
  theme(text=element_text(family="黑體-繁 中黑",size=14))

# general+++++++++++++++++++++++++++++++++++++++++++++++++

# point
ggplot(df_ShihChien,aes(男學生總數,女學生總數))+
  geom_point(aes(size=學生總數,color=學制),alpha=0.7)+
  theme(text=element_text(family="黑體-繁 中黑",size=14))
# text
ggplot(df_ShihChien,aes(男學生總數,女學生總數,label=系所名稱,family="黑體-繁 中黑",size=學生總數,alpha=0.7))+
  geom_text(check_overlap = TRUE)+
  facet_wrap(~學制)+
  geom_label(aes(fill=學制), colour = "white", fontface = "bold")+
  theme(text=element_text(family="黑體-繁 中黑"))

# find data(time)+++++++++++++++++++++++++++++++++++++++++++++++++
df_ShihChien_v2 <- 
  df%>%
  filter(學校名稱=="實踐大學")
# gganimate+++++++++++++++++++++++++++++++++++++++++++++++++

# gganimate point
ggplot(df_ShihChien_v2,aes(男學生總數,女學生總數))+
  geom_point(aes(size=學生總數,color=學制),alpha = 0.7)+
  theme(text=element_text(family="黑體-繁 中黑",size=14))+
  facet_wrap(~學制)+
  transition_time(學年度)+
  labs(title = "學年度: {frame_time}")
# gganimate text
ggplot(df_ShihChien_v2,aes(男學生總數,女學生總數,label=系所名稱,family="黑體-繁 中黑",size=學生總數))+
  geom_text(check_overlap = TRUE)+
  geom_label(aes(fill=學制), colour = "white", fontface = "bold",alpha=0.7)+
  theme(text=element_text(family="黑體-繁 中黑"))+
  facet_wrap(~學制)+
  transition_time(學年度)+
  labs(title = "學年度: {frame_time}")
# plotly point+++++++++++++++++++++++++++++++++++++++++++++++++
df_ShihChien_v2%>%
  plot_ly(
    x = ~男學生總數, 
    y = ~女學生總數, 
    size = ~學生總數, 
    color = ~學制, 
    frame = ~學年度, 
    text = ~系所名稱, 
    hoverinfo = "text",
    type = 'scatter',
    mode = 'markers'
  )%>%
  layout(
    xaxis = list(
      type = "log"
    )
  )





