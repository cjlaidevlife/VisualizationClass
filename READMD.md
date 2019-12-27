---
title: 數據視覺化筆記
tags: Visualization,note    
disqus: HackMD # 開啟留言    
slideOptions:   
  allottedMinutes: 40 # 計時器
  parallaxBackgroundImage: 'https://i.gifer.com/BXe0.gif' # 背景圖   
  parallaxBackgroundSize: "1500px 1000px" # 背景圖   大小
  #transition: 'fade' #轉場模式
  #spotlight: # 簡報筆模式
   #enabled: true
  # F11:全螢幕、S:看小抄模式、ESC:大綱模式
---

# 資料視覺化    

>老實說，我認為自己對於資料分析與視覺化，沒有什麼天份。這篇筆記僅憑藉自己的熱情，胡搞瞎搞一段時間後，所歸納出的一點小小心得。雖然這篇筆記可能有交代的不清楚的地方，又或者觀念不夠正確。但我還是希望透過這篇筆記，陪伴那些即將踏入資料科學，特別為從未接觸過資料視覺化或是資料分析的菜鳥所準備。希望大家或多或少，都可以在這裡有所收穫。有空閒我就會添加繼續新的內容，如果有任何的疑問，歡迎來信指教。
✉️m0661007@g2.usc.edu.tw
:::spoiler
1.想知道如何使用Hack MD請前往下面連結：https://hackmd.io/@hackmd/BJvtP4zGX
2.如何使用 Hack MD 的簡報(Slide)功能請前往下面連結：https://hackmd.io/@hackmd/HJO6srUx
3.歡迎將我的Markdown語法套用在自己的HackMD。
4.筆記上請尊重各來源的原作者，盡量註明出處。
5.有任何疑惑都歡迎發mail給我，我會盡量回答我知道的部分。
:::

:::info
:mega: 如果想觀看簡報版 [<kbd>資訊系</kbd>](https://hackmd.io/@s97wzpzMREOn_q9CTUtCDg/ry0xz6uTH) [<kbd>企管系</kbd>](https://hackmd.io/@s97wzpzMREOn_q9CTUtCDg/SycJelbyU) 範例程式碼 [<kbd>Github</kbd>](https://github.com/s716134/Easy_R_visualization) 上課影片[<kbd>Youtube</kbd>](https://youtu.be/zy5UPJHjR_g) 
::: 

###### tags: `資料視覺化` `實踐大學` `資訊科技與管理學系` `企業管理學系`

## 一、什麼是資料視覺化?   
:::warning
:zap:先問問你(妳)怎麼看？
:::

![](https://i.imgur.com/eZA0Af8.png)   
>透過蒐集班上同學的想法所組成的文字雲，可以看出哪些端倪呢？

[<kbd>點我開始製作文字雲</kbd>](https://wordcloud.timdream.org/)

## 二、為何需要視覺化?   

### 2.1 需要解決的難題   
:::warning
:zap:當你要進行分析，但遇上資料量很大，無從下手的時候...
:::
[![](https://i.imgur.com/4I3yB0r.png =700x400)](https://udb.moe.edu.tw/Historical)   
**資料來源：大專校院校務資訊公開平臺>歷史資訊(105學年度以前)>學生類>學生數**

### 2.2 視覺化的用途   

(一) 比較 (Comparison)
(二) 分佈 (Distribution) 
(三) 關聯 (Relationship) 
(四) 組成 (Composition) 

## 三、如何做出視覺化?   

### 步驟一 理解資料   


| 資料類型 | Type | 說明 |
| :---: | :---: | --- |
| 時間 | Date&Time | 數字型態，許多時候當作獨立的類別。 |
| 數值 | Numeric | 變量要具有連續性才會作為數值看待。 |
| 類別 | Categorical | 用來分類，可以是文字或數字。 |
| 地理 | Geographical | 常見的是經緯度、郵遞區號等。 |
| 文本 | Text | 可以是文字、對話、評價等。 |

### 步驟二 處理資料   
#### (一)資料框結構:
1. 長資料 [<kbd>請點我</kbd>](https://i.imgur.com/WqVANbG.png)
2. 寬資料 [<kbd>請點我</kbd>](https://i.imgur.com/6LGBqpD.png)
:::info
:mega: 轉為長資料能夠提升圖形『比較』的效果。
::: 
#### (二)欄位命名

```graphviz
digraph dfd2{
        node[shape=record]
        subgraph{
        enti1 [label="geo.name" shape=box];
        enti2 [label="indicator.name" shape=box];
        enti3 [label="geo" shape=box];
        enti4 [label="indicator" shape=box];
        }
        subgraph cluster_level1{
                        label ="更改後";
                        proc1 [label="{<f0> New Name|<f1> 國家名稱\n\n\n}" shape=Mrecord];
                        proc2 [label="{<f0> New Name|<f1> 指標種類\n\n\n}" shape=Mrecord];
                        proc3 [label="{<f0> New Name|<f1> 國家代碼\n\n\n}" shape=Mrecord];
                        proc4 [label="{<f0> New Name|<f1> 指標代碼\n\n\n}" shape=Mrecord];

        }
        enti1 -> proc1
        enti2 -> proc2
        enti3 -> proc3
        enti4 -> proc4
}
```

:::info
:mega: 盡可能讓圖表上的資訊清楚、一目瞭然。
:::

#### (三)遺失值處理:

```graphviz
digraph hierarchy {

                nodesep=1.0
                node [color=Red,fontname=Courier,shape=box] 
                edge [color=Blue, style=dashed]

                遺失值->{剔除資料 自行定義}
                自行定義->{類別 數值}
                數值 ->{取近似值 補上0}
                類別 ->{補上NULL}
                {rank=same;數值 類別} 
                {rank=same;取近似值 補上0} 
}
```
:::info
:mega: 資料量越少，遺失值處理越加重要!
:::

### 步驟三 資料分佈

#### (一)最大值、最小值:
可以用來觀察目標在群體內的相對位置。

#### (二)中位數、平均值:
可以簡單的將資料做初步的分類。
:::info
:mega: 也可以嘗試去探討標準差、變異數。
:::

### 步驟四 探索視覺化

#### (一)常見的圖表 [<kbd>請點我</kbd>](https://datavizcatalogue.com/index.html)
>可以依照使用情境、目的的不同，選擇最合適的圖表。
#### (二)靜態的圖 [<kbd>請點我</kbd>](https://i.imgur.com/zuK2vOu.png)
>主要用在平面的場景，例如書面報告。

#### (三)自動的圖 [<kbd>請點我</kbd>](https://imgur.com/rY9At2k.gif)
>用來吸引注意力，但解釋時有拘限性。

#### (四)互動的圖 [<kbd>請點我</kbd>](https://leemeng.tw/gapminder.html)
>適合演講或報告用來拉近觀眾距離。
:::success
:mega:特別感謝LeeMeng願意讓我放上他所做的互動式視覺化部落格。
:::

## 四、解釋視覺化

### 4.1 解釋的基本步驟
| 解釋步驟 | 解釋項目 | 解釋說明 |
| -------- | -------- | -------- |
| 步驟一 | 數據軸 | x軸是什麼？y軸是什麼？ |
| 步驟二 | 數值 | 有哪些數值？這些數值的含義？ |
| 步驟三 | 級別 | 詳細程度？比例尺？年？月？日？ |
| 步驟四 | 焦距 | 圖表的重點？趨勢、模式、異常？哪些數據要突出？ |
| 步驟五 | 聽眾 | 你想表達出什麼訊息？丟出今天想探討的議題？ |
### 4.2 影片DEMO
{%youtube jbkSRLYSojo%}
###### Video : Hans Rosling's 200 Countries, 200 Years, 4 Minutes - The Joy of Stats - BBC Four
**影片來源：YOUTUBE**

## 五、進階視覺化

### (一) DECK GL [<kbd>請點我</kbd>](https://deck.gl/#/)
![](https://i.imgur.com/6klp5cg.jpg =450x250)
### (二) D3 js [<kbd>請點我</kbd>](https://d3js.org/)
![](https://i.imgur.com/0ixRRbS.jpg =450x250)
### (三) ECHARTS [<kbd>請點我</kbd>](https://echarts.apache.org/en/index.html)
![](https://i.imgur.com/0g9q2Lt.jpg =450x250)
## 六、採用教材

[![](https://images-eu.ssl-images-amazon.com/images/I/51wnowwIoXL._SY346_.jpg =150x200)](https://www.amazon.co.uk/Data-Visualization-Made-Simple-Insights-ebook/dp/B07HS23LTN)
###### Book : Data Visualization Made Simple
**圖片來源:AMAZON**
## 參考資料
* https://wordcloud.timdream.org/
* https://udb.moe.edu.tw/Historical
* https://datavizcatalogue.com/index.html
* https://leemeng.tw/gapminder.html
* https://youtu.be/jbkSRLYSojo
* https://deck.gl/#/
* https://d3js.org/
* https://echarts.apache.org/en/index.html
* https://www.amazon.co.uk/Data-Visualization-Made-Simple-Insights-ebook/dp/B07HS23LTN


