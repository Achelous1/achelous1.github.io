---
layout  : wiki
title   : 자바 코딩가이드
summary : 구글의 자바 코딩가이드
date    : 2021-01-22 10:26:09 +0900
updated : 2021-01-22 16:11:06 +0900
tag     : guideline java style 
toc     : true
public  : true
parent  : [[programming]]
latex   : false
---
* TOC
{:toc}

# 구글의 자바 코딩스타일 가이드
## 구글에서 사용하는 자바코딩의 가이드라인을 알아보자

## 1 기본

### 1.1 용어정리
1. 클래스(class)라 함은 이타적(inclusive)으로 "통상적"인 클래스, 열거형 클래스, 인터페이스 또는 애너테이션유형(@interface)를 지칭한다.
2. 멤버(member- *of a class*)라 함은 이타적으로 중첩클래스(nested class), 필드, 메서드 또는 생성자(constructor- initializer와 comment를 뺀 모든 최상위 컨텐츠(all top-level contents)이다)를 지칭한다.
3. 주석(comment)라 함은 언제나 구현주석(implementation comment)를 지칭한다. 문서주석(documentation comment)란 단어는 사용하지 않으며 통상적인 자바독(Javadoc)이란 용어를 사용한다.

## 2 소스파일 기본
### 2.1 파일명명규칙
* 파일명은 해당 자바파일에 정의된 최상위 클래스의 대소문자 구분 된 클래스명을 따르며 .java의 확장자를 사용한다.

### 2.2 소스파일 인코딩
* 소스파일은 UTF-8형식의 인코딩을 사용한다.

### 2.3특수문자
* 2.3.1 공백문자
	* 끝자리 문자 이외에는 **ASCII 가로공백문자** (ASCII horizontal space character `0x20`)만이 소스파일 내에서 사용되며, 이는,
	1. 다른 모든 공백문자나 문자리터럴은 이스케이프 되어야 한다.
	2. 탭(Tab)문자는 인덴트로 사용되지 **않는다**.
* 2.3.2 특수문자 이스케이프 순서
	* 특수 이스케이프 시퀀스 (\b, \t, \n, \f, \r, \", \'및 \\)가있는 문자의 경우 해당하는 8진수(\012)나 유니코드(\u000a) 대신 해당 시퀀스가 사용된다.


---
## Links
[Google Java Style Guide](https://google.github.io/styleguide/javaguide.html)
