App for sticker albums
========================================================
author: Filip Cools
date: 

<CENTER><img src="panini1.JPG" alt="&nbsp;Photo&nbsp;" height=280 border=0 align=top hspace=10"> <img src="panini2.JPG" alt="&nbsp;Photo&nbsp;" height=280 border=0 align=top hspace=10></CENTER>

Documentation for app
========================================================
A popular leisure activity for children (but also adults), especially during sport tournaments such as the soccer world cup, is to get an empty sticker album and to buy/collect stickers to fill in the album.

With this app, you can compute the expected number of stickers you will have to buy/collect in order to get a full album. Note : this is under the assumption that you are not swapping stickers with friends.

You can also try this out yourself : create a virtual sticker collection (generated at random) and check whether your album is full or not.

Computing the expected number
========================================================

Reference: 
http://en.wikipedia.org/wiki/Coupon_collectors_problem


```r
exp_num <- function(num1){
    E <- 0
    for(i in 1:num1) {E<- E+1/i}
    E <- E*num1
    E
}
```

E.g., for the Panini 'Fifa World Cup Brasil' album: 


```r
exp_num(640)
```

```
[1] 4505.258
```

Generating a virtual sticker collection
========================================================

The function `st_col` creates a virtual sticker collection consisting of `num2` stickers for an album with `num1` stickers and using `set.seed(ss)`. 


```r
st_col <- function(num1,num2,ss){
    vector<-rep(0,num1)
    set.seed(ss)
    stickers<-sample(1:num1,num2,replace=TRUE)
    for(i in 1:num1) {
        vector[i]<-sum(stickers==i)
    }
    vector
}
```

The output is in the form of a vector. 

Example
========================================================
A virtual sticker collection consisting of `20` stickers for an album with `10` stickers using `set.seed(111)`: 


```r
st_col(10,20,111)
```

```
 [1] 4 2 0 3 3 5 1 1 0 1
```

Note that the expected number of stickers needed to fill the album is:


```r
exp_num(10)
```

```
[1] 29.28968
```
