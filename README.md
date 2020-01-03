# 資料視覺化    

>這是用來協助我整理一些基本的資料視覺化導讀，希望透過這篇文章不僅可以讓我整理觀念，並能夠為資料視覺化初學者釐清一些思路，並用來協助課堂教學分享所用。裡面尚有許多需要改進的地方，目前也還在摸索如何善用github這個平台，如果有任何好的建議我都會虛心受教。

1.想知道如何使用Hack MD請前往下面連結：[好站連結](https://hackmd.io/@hackmd/BJvtP4zGX)  
2.如何使用 Hack MD 的簡報(Slide)功能請前往下面連結：[好站連結](https://hackmd.io/@hackmd/HJO6srUx)  

###### tags: `資料視覺化` `實踐大學` `資訊科技與管理學系` `企業管理學系`

## 一、什麼是資料視覺化?   
> 先問問你(妳)怎麼看？

![](https://i.imgur.com/eZA0Af8.png)   
透過蒐集班上同學的想法所組成的文字雲，可以看出哪些端倪呢？

[<kbd>點我開始製作文字雲</kbd>](https://wordcloud.timdream.org/)

## 二、為何需要視覺化?   

### 2.1 需要解決的難題   

> 當你要進行分析，但遇上資料量很大，無從下手的時候...

[![](https://i.imgur.com/4I3yB0r.png)](https://udb.moe.edu.tw/Historical)  
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

> 轉為長資料能夠提升圖形『比較』的效果。

#### (二)欄位命名  

![](https://i.imgur.com/rgRwmhs.png)  

> 盡可能讓圖表上的資訊清楚、一目瞭然。  


#### (三)遺失值處理: 

![](https://i.imgur.com/wwrZuOY.png)  

> 資料量越少，遺失值處理越加重要!

### 步驟三 資料分佈

#### (一)最大值、最小值:
可以用來觀察目標在群體內的相對位置。

#### (二)中位數、平均值:
可以簡單的將資料做初步的分類。

>也可以嘗試去探討標準差、變異數。

### 步驟四 探索視覺化

#### (一)常見的圖表 [<kbd>請點我</kbd>](https://datavizcatalogue.com/index.html)   
>可以依照使用情境、目的的不同，選擇最合適的圖表。  

#### (二)靜態的圖    
![](https://i.imgur.com/zuK2vOu.png)  

>主要用在平面的場景，例如書面報告。

#### (三)自動的圖    
![](https://imgur.com/rY9At2k.gif)  
>用來吸引注意力，但解釋時有拘限性。

#### (四)互動的圖 [<kbd>請點我</kbd>](https://leemeng.tw/gapminder.html)  

>適合演講或報告用來拉近觀眾距離。
>特別感謝LeeMeng願意讓我放上他所做的互動式視覺化部落格。

## 四、解釋視覺化

### 4.1 解釋的基本步驟
| 解釋步驟 | 解釋項目 | 解釋說明 |
| -------- | -------- | -------- |
| 步驟一 | 數據軸 | x軸是什麼？y軸是什麼？ |
| 步驟二 | 數值 | 有哪些數值？這些數值的含義？ |
| 步驟三 | 級別 | 詳細程度？比例尺？年？月？日？ |
| 步驟四 | 焦距 | 圖表的重點？趨勢、模式、異常？哪些數據要突出？ |
| 步驟五 | 聽眾 | 你想表達出什麼訊息？丟出今天想探討的議題？ |
### 4.2 影片觀賞
[<kbd>YOUTUBE</kbd>](https://youtu.be/jbkSRLYSojo)
###### FROM : Hans Rosling's 200 Countries, 200 Years, 4 Minutes - The Joy of Stats - BBC Four

## 五、進階視覺化   

1. DECK GL [<kbd>好站連結</kbd>](https://deck.gl/#/)
2. D3 js [<kbd>好站連結</kbd>](https://d3js.org/)
3. ECHARTS [<kbd>好站連結</kbd>](https://echarts.apache.org/en/index.html)

## 六、採用教材

書名：[<kbd>Data Visualization Made Simple</kbd>](https://www.amazon.co.uk/Data-Visualization-Made-Simple-Insights-ebook/dp/B07HS23LTN)  



---  

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



