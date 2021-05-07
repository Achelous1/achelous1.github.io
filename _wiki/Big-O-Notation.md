---
layout  : wiki
title   : Big O Notation 
summary : 
date    : 2021-02-17 16:55:34 +0900
updated : 2021-02-17 17:06:40 +0900
tag     : complexity performance 
toc     : true
public  : true
parent  : [[programming]] 
latex   : false
---
* TOC
{:toc}

# Big O Notation
> $$O(n)$$ is Big O Notation and refers to the complexity of a given algorithm. n refers to the size of the input, in your case it's the number of items in your list.
> 
> $$O(n)$$ means that your algorithm will take on the order of n operations to insert an item. e.g. looping through the list once (or a constant number of times such as twice or only looping through half).
>
> $$O(1)$$ means it takes a constant time, that it is not dependent on how many items are in the list.
>
> $$O(n^2)$$ means that for every insert, it takes n*n operations. i.e. 1 operation for 1 item, 4 operations for 2 items, 9 operations for 3 items. As you can see, $$O(n^2)$$ algorithms become inefficient for handling large number of items.
> 
> For lists $$O(n)$$ is not bad for insertion, but not the quickest. Also note that $$O(n/2)$$ is considered as being the same as $$O(n)$$ because they both grow at the same rate with n.

# Links
* [Stack Overflow](https://stackoverflow.com/questions/1909307/what-does-on-mean/1909374#:~:text=O(n)%20is%20Big%20O,operations%20to%20insert%20an%20item.)
* [Wikipedia](https://en.wikipedia.org/wiki/Big_O_notation)
