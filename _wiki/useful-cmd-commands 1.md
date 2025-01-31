---
layout  : wiki
title   : 자주 쓰이고 유용한 CMD 커맨드
summary : 
date    : 2021-03-29 10:42:55 +0900
updated : 2021-03-29 10:48:15 +0900
tag     : cmd commands
toc     : true
public  : true
parent  : programming
latex   : false
---
* TOC
{:toc}

# 자주 쓰이는 커맨드라인
#### netstat
* case : 특정 포트를 사용하는 프로세스를 검색하고 싶을 때:

```cmd
> netstat -a -n -o | find "{pid}"
```

#### taskkill
* case : 특정 pid를 가진 프로세스를 **강제로** 종료하고 싶을때:

```cmd
> taskkill /F /PID "{pid}"
```
