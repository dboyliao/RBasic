---
title       : The Basic of R
subtitle    : Amazing R
author      : 'Taiwan R User Group'
job         : 'for R Hacker'
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [quiz, bootstrap, interactive]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
logo        : Taiwan-R-logo.png
github:
  user: DboyLiao
  repo: RBasic

--- &twocol

## Table of Content
*** =left
- DATA: 一切的起源
  - 資料屬性
  - 資料形態
- 基礎運算
  - 邏輯運算
  - 數值運算
  - 字串處理
- Loop
  - if/else
  - for
  - while

*** =right
- Build-in funcions in R

- Define Your Own Function
 - Syntex
 - Something you will not do in R....But it is FUN!!
 
- apply系列函數
  - apply
  - lapply
  - sapply
  - tapply / split


---

## Before We Start
It is good to have some handy commands at hand.
- rm() / ls()
  - rm(list = ls()): clear all objects in Global Enviroment.
- getwd() / setwd()
- memory.size() / memory.limit(): This is for **Windows user only**.
- ? : The helper function.
- class()
- names()

--- &twocol

## DATA: 一切的起源
*** =left
以資料屬性來分：
- Character (字串)
- Integer (整數)
- Numeric (雙浮點數 / 實數)
- Complex (複數)
- Logical (邏輯值)

*** =right
以資料形態來分：
- 一般變數
- Vector
- Matrix
- Array
- Factor
- Data Frame

---

## 基本賦值語法

```r
(x <- "R is easy to learn!")
(y <- 3)
(z <- pi)
```

```
## [1] "R is easy to learn!"
```

```
## [1] 3
```

```
## [1] 3.142
```



---

## Logical

```r
bol1 <- T
bol2 <- TRUE
bol1 & bol2
```

[1] TRUE


### Funtime

```r
mix_vec1 <- c("a", 2)
mix_vec2 <- c(2, T)
```

猜看看結果會如何?

(c()為 R 中建立向量的內建函式)

> 1. [1] "a" "2"
> 2. [1] 2 1

---

## Vector

---

## Relating Methods (Vector)
- length(): 
  - 語法: length(my_vect)
  - 傳回 my_vect 的長度
- +, -, *, /:
  - 語法: **my_vect + other_vect**
  - 注意: R 中所有運算皆向量化。(element by element operation)

---

## Matrix and Array

---

## Factor

---

## Data Frame

- R 中有很多內建資料庫，其中包括你不可以不知道的 iris 資料庫。

- 用法也很簡單，只要輸入以下指令：


```r
data(iris)
```



1. 可以把 data frame 想像成以 factor 為直欄堆疊起來的資料形態。

2. names(iris) 將可以看到 iris 所有欄位的名字。

3. 我說他是 factor 疊起來的東西你就信了嗎? Try it yourself!


```r
Species <- iris[, "Species"]
class(Species)  # R 會告訴你他是個 factor。
Species2 <- as.numeric(Species)
print(Species2)  # 直接把 factor 轉成 numeric 向量。
```


---

## Useful Function for Data Frame

給定一個名叫 data 的 data frame

- names(data): 傳回 data 的所有欄位名稱。

- nrow(data) / ncol(data): 傳回 data 的列 / 行數目。

- which(exp): Demo?

- sort

- max

- min


---

## List

- list 是非常方便好用的資料形態。尤其是需儲存不同類型資料的時候，特別好用。

- Vector, Matrix, Data Frame and List.

- 還記得剛剛提過的優先順序嗎？
 - c(1, '2')
 - c(1, T)

- 比較：
 - list(1, '2')
 - list(1, T)

---
## Loop
### if / else
Syntex:


    if (condition_1){
        #Do something here....
    } else if (conditon_2){
        #Do something here
    } else {
        #Do something here
    }


Note: **else if** and **else** are optional.

--- 

## Coding Style for Loop

以下 2 個片段的 code 是等價的，但我們最推薦第一種寫法。


```r
value <- 5
if (value > 4) {
    print("The value is greater than 4")
} else if (2 < value & value <= 4) {
    print("The value is greater than 2 and no greater than 4.")
} else {
    print("The value is no greater than 2.")
}
```


---

## Coding Style for Loop (Cont.)

    {
            if (value > 4)
                    print('The value is greater than 4')
            else if (2 < value & value <= 4)
                    print('The value is greater than 2 and no greater than 4.')
            else
                    print('The value is no greater than 2.')
    }

> 1. 當然，如果你是 Python 的重度愛好者，要寫成這樣我也不反對啦~(攤手)
> 2. 我自己是覺得第一種比較好看!(自以為狀態啟動)
> 3. 特別注意到的是，如果把 { } 去掉，程式會出錯喔!(不一定不能跑，但有可能是錯的)

---

## User-Defined Function
- Syntex:

```r
my_function <- function(arg1, arg2, ...) {
    # do something here
}
```

- Scoping Rule
 - Local Variable
 - Global Variable

---

## Global v.s. Local

- Example:


```r
x <- 5
my_fun <- function() {
    x <- 6
    return(x + 1)
}
my_fun()
print(x)
```


- 大家來 Try Try See 吧!

---

## Mini-project 1: friend_info_update

- User What We've Learned to Build a Directory!
 - Builde a function called **friend_info_update**.
  - **friend_info_update** takes two arguments: **name_list** and **info_list**.
  - **friend_info_update** will update your friend's information according to 
  **name_list** and **info_list**.
  - **friend_info_update** will output one csv file named **friend_info**

---
## Sample output: 

    name_list <- list('Dboy', 'Boyo')
    info_D <- c(phone = '0912110266', address = 'Kindom Far Far Away',
                email = 'qmalliao@farway.com', B_day= '1987/03/29')
    info_B <- c(phone = '0911988987', address = 'Kindom Not So Far Away',
                email = 'boyo@notfaraway.com', B_day= '1988/02/13')
    info_list <- list(info_D, info_B)
    friend_info_update(name_list, info_list)
    
<img src="assets/img/friend_demo.png" class="fit100" />

---

## Mini project 2: little_game()

    little_game()
    [1] "O" "O" "O" "O" "O"
    [1] "O" "O" "O" "O" "O"
    [1] "O" "O" "O" "O" "O"
    [1] "O" "O" "O" "O" "O"
    [1] "O" "O" "O" "O" "O"
    Guess the x:1
    Guess the y:1
    [1] "X" "O" "O" "O" "O"
    [1] "O" "O" "O" "O" "O"
    [1] "O" "O" "O" "O" "O"
    [1] "O" "O" "O" "O" "O"
    [1] "O" "O" "O" "O" "O"
    [1] "You miss."


---

## Little Game: tips
接下來我們將一步步指導該如何造出這個 little_game()。

- 定義一個 list 變數 map 如下

```r
map = list(c("O", "O", "O", "O", "O"), c("O", "O", "O", "O", "O"), c("O", "O", 
    "O", "O", "O"), c("O", "O", "O", "O", "O"), c("O", "O", "O", "O", "O"))
```


-  用一個 for 迴圈把 map 中的每一個項目 print 出來。(看看它會長啥樣子吧!)

- 定義一個變數 tr 並給予初始值 0 。(此變數將用於記錄玩家已經試過幾次)

- 用一個 while 迴圈來判斷 tr 是否超過可嘗試次數。如果沒有，更新 map 並顯示適當訊息。若已超過， break 當前迴圈。

- 增加新功能: 如果玩家輸入的坐標有誤? 如果玩家炸到已經炸過的地點?

---

## littel_game() 成品範例

    little_game <- function(num_guess = 5, cheat = F){
            ship_x <- sample.int(5, size = 1)
            ship_y <- sample.int(5, size = 1)
            if (cheat){
                    print(ship_x)
                    print(ship_y)
            }
            map =list(c('O', 'O', 'O', 'O', 'O'),
                      c('O', 'O', 'O', 'O', 'O'),
                      c('O', 'O', 'O', 'O', 'O'),
                      c('O', 'O', 'O', 'O', 'O'),
                      c('O', 'O', 'O', 'O', 'O'))
            for (r in map){
                    print(r)
            }
            tr <- 0

---

## littel_game() 成品範例 (續)

        while (tr < num_guess){
                    x <- as.numeric(readline('Guess the x:'))
                    y <- as.numeric(readline('Guess the y:'))
                    if (x <= 5 && y <= 5 && x > 0 && y > 0){ 
                            map[[y]][x] <- 'X'
                            for (r in map){
                                    print(r)
                            }
                            if (x == ship_x & y == ship_y){
                                    cat('Oh NO~~~You shrink my boat!!')
                                    break
                            } else{
                                    cat('You miss.')
                                    tr <- tr + 1
                            }

---

## littel_game() 成品範例 (續)

                            if (tr >= num_guess){
                                    cat('You loss.')
                            }
                    } else {
                            cat('Invalid x or y coordinate.')
                    }
            }
        
    }

---

## little_game() mini-project 後小檢討

1. 在開始 coding 之前，最好先用一張小紙條寫好: 我要做什麼?

2. 把大問題拆成小問題逐一解決，再組合起來。
  1. 以 little_game() 來說，它可以先被分解成兩個迴圈。一個 for 迴圈用來於螢幕顯示初始 map 長什麼樣子，一個 while 迴圈用以判斷遊戲是否繼續。
  
  2. 而 while 迴圈又可以進一步分解成兩個部分。第一部分用以於螢幕顯示現在的 map 長什麼樣子，第二部分則會根據玩家輸入的坐標更新 map ，並於螢幕顯示適當訊息。
  
3. 全部組合起來。

4. 新功能: 當新功能進來時，該思考應該在上面的小問題的哪個位置插入適當的程式碼。(判斷玩家重複炸了同一地點?無效的坐標?)

5. 大問題 -> 小問題s -> 大問題

6. test

---
## apply 系列函數

--- &interactive

## Interactive Mode

```r
a <- 1
b <- 3
a + b
```

[1] 4



