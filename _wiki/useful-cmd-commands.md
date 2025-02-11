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

```bash
> netstat -a -n -o | find "{pid}"
```

#### taskkill
* case : 특정 pid를 가진 프로세스를 **강제로** 종료하고 싶을때:

```bash
> taskkill /F /PID "{pid}"
```

#### lsof
- case: 열려 있는 파일 및 리소스 관리의 필수 도구(List Open Files)
##### 설치
```bash
> sudo apt install lsof
```
##### 실행
- 특정 디렉토리를 사용 중인 프로세스 찾기
```bash
> lsof +D /path/to/directory
```
- 특정 포트를 점유하고 있는 프로세스 찾기
```bash
> lsof -i :80
```
