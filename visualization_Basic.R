#---選定觀測值---#
df_ShihChien <- 
  df%>%
  filter(學校名稱=="實踐大學" & 學年度=="104")

#---利用最大值判別目標---#
male_n<- max(df_ShihChien$男學生總數)
female_n<- max(df_ShihChien$女學生總數)
ggplot(df_ShihChien,aes(男學生總數,女學生總數))+
  geom_point(aes(size=學生總數),alpha=0.7)+
  geom_label(data= df_ShihChien%>%
               filter(男學生總數==male_n),
             label="資訊科技與通訊學系",
             family="STKaiti",
             fontface = "bold",
             colour = "white",
             fill="blue",
             vjust="inward",
             hjust="inward")+
  geom_label(data= df_ShihChien%>%
               filter(女學生總數==female_n),
             label="觀光管理學系",
             family="STKaiti",
             fontface = "bold",
             colour = "white",
             fill="red")+
  geom_label(data= df_ShihChien%>%
               filter(系所名稱=="資訊科技與管理學系" & 學制=="學士班(日間)"),
             label="資訊科技與管理學系",
             family="STKaiti",
             fontface = "bold",
             colour = "white",
             fill="green",
             vjust="inward",
             hjust="inward")+
  geom_label(x=0,y=0,
             label="最小值",
             family="STKaiti",
             fontface = "bold",
             colour = "white",
             fill="gray",
             vjust="inward",
             hjust="inward")+
  theme(text=element_text(family="STKaiti"))

#---利用平均數與中位數切割資料---#
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
             family="STKaiti",
             fontface = "bold",
             colour = "white",
             fill="green",
             vjust="inward",
             hjust="inward")+
  theme(text=element_text(family="STKaiti",size=14))