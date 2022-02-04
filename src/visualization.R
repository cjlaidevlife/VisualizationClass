#---選定觀測值---#
df_ShihChien <- 
  df%>%
  filter(學校名稱=="實踐大學" & 學年度=="104")

#---靜態泡泡分佈圖---#
ggplot(df_ShihChien,aes(男學生總數,女學生總數))+
  geom_point(aes(size=學生總數,color=學制),alpha=0.7)+
  theme(text=element_text(family="STKaiti",size=14))

#---靜態文字標籤分佈圖---#
ggplot(df_ShihChien,aes(男學生總數,女學生總數,label=系所名稱,family="STKaiti",size=學生總數,alpha=0.7))+
  geom_text(check_overlap = TRUE)+
  facet_wrap(~學制)+
  geom_label(aes(fill=學制), colour = "white", fontface = "bold")+
  theme(text=element_text(family="STKaiti"))

#---選定觀測值(加入時間元素)---#
df_ShihChien_v2 <- 
  df%>%
  filter(學校名稱=="實踐大學")

#---普通會動的泡泡分佈圖---#
ggplot(df_ShihChien_v2,aes(男學生總數,女學生總數))+
  geom_point(aes(size=學生總數,color=學制),alpha = 0.7)+
  theme(text=element_text(family="STKaiti",size=14))+
  facet_wrap(~學制)+
  transition_time(學年度)+
  labs(title = "學年度: {frame_time}")

#---會動的文字標籤分佈圖---#
ggplot(df_ShihChien_v2,aes(男學生總數,女學生總數,label=系所名稱,family="STKaiti",size=學生總數))+
  geom_text(check_overlap = TRUE)+
  geom_label(aes(fill=學制), colour = "white", fontface = "bold",alpha=0.7)+
  theme(text=element_text(family="STKaiti"))+
  facet_wrap(~學制)+
  transition_time(學年度)+
  labs(title = "學年度: {frame_time}")

#---具有互動功能的分佈圖---#
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