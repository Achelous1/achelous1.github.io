---
layout  : wiki
title   :  3-Tier Web Application이란
summary : 3티어 웹 어플리케이션에 대해서 알아보자
date    : 2022-03-06 13:05:46 +0900
updated : 2022-03-06 13:05:46 +0900
tag     : web-application architecture
toc     : true
public  : true
parent  :  [[tech]]
latex   : false
---
* TOC
{:toc}

## 3티어 웹 어플리케이션에 대해서 알아보자
### 정의
* 3-tier web application(*이하 3TWA*)이란 **프레젠테이션 계층**, **어플리케이션 계층**, 그리고 **데이터 계층**으로 이뤄져 있는 모듈러 클라이언트-서버 아키텍쳐이다.
	* **프레젠테이션 계층**에서는 그래픽 사용자 인터페이스(GUI)를 담당하며, 다른 두 계층과 통신을 주고받는다.
	* **어플리케이션 계층**에서는 비즈니스적 논리를 담당한다.
	* **데이터 계층**에선 정보를 저장한다.
	* 상위 계층들은 물리적이지 않은 논리적*logical*계층이며, 같은 물리적인 서버에서 동작할 수도 있고 동작하지 않을 수도 있다.

![image](https://user-images.githubusercontent.com/24582045/156908954-4e1cf03f-0848-4943-9250-26035ef7a243.png)

### Presentation Tier (프레젠테이션 계층)
* 해당 계층은 HTML과 CSS 그리고 JavaScript로 이뤄지며, **웹브라우저***Web browser* 또는 **웹 기반 어플리케이션***Web-based application*을 통하여 디바이스로 배포된다.
* 프레젠테이션 계층은 API(application program interface)를 통하여 다른 두 계층과 통신한다.

### Application Tier (어플리케이션 계층)
* 논리 계층이라고도 불리는 어플리케이션 계층은 Java와 같은 프로그래밍 언어로 작성되며, 비즈니스로직이라고도 불리는 어플리케이션의 핵심 기능들을 제공한다.
* 어플리케이션 계층은 처리능력에 요구사항에 따라, 클라우드 또는 사내서버로의 배포를 통해 호스팅 될 수 있다.

### Data Tier (데이터 계층)
* 데이터베이스와 그 데이터베이스의 읽기/쓰기관리의 권한을 가진 프로그램(DBMS)으로 이뤄진 계층이다. 해당 계층은 스토리지 계층이라고도 불리우며 클라우드 또는 온-프레미스 형식으로 호스팅될 수 있다.
* 유명한 DBMS로는 MySQL, PostgreSQL, Microsoft SQL Server와 MongoDB 등이 있다.

### 3-tier application 아키텍쳐의 장점
* 3TWA의 장점으로는 수평적인 확장성*scalability*, 성능*performance*, 그리고 가용성*availability*에 있다. 
* 3개의 계층으로, 각자 다른 개발팀들이 동시에, 각자 다른 계층의 개발자들은 각각 다른 언어로 개발이 가능하게 한다. 다른 계층에 영향을 주지 않고 변경 또는 이 동이 가능하기에, 기업은 새로운 니즈와 기회에 대하여 어플리케이션을 끊임없이 진화시키는 것이 쉬워진다.
* 기존재하는 어플리케이션 또는 중요한 파츠*critical parts* 들은 임시 또는 영구적으로 새로운 계층 내에 캡슐화 시킬수 있다.

# Links
* [3-tier application architecture](https://searchsoftwarequality.techtarget.com/definition/3-tier-application)
* [Multitier Architecture](https://en.wikipedia.org/wiki/Multitier_architecture)

# 주석
