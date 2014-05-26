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

> R 中有很多內建資料庫

> 其中包括你不可以不知道的 iris 資料庫

> 用法也很簡單，只要輸入以下指令：


```r
data(iris)
```


> 1. 可以把 data frame 想像成以 factor 為直欄堆疊起來的資料形態。

> 2. names(iris) 將可以看到 iris 所有欄位的名字。

> 3. 我說他是 factor 疊起來的東西你就信了嗎? Try it yourself!

     Species <- iris[, 'Species']
     class(Species)

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

1. 定義一個 list 變數 map 

2. 用一個 for 迴圈

--- &interactive

## Interactive Mode

```r
a <- 1
b <- 3
a + b
```

[1] 4



