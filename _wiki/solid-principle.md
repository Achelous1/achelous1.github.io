---
layout  : wiki
title   : SOLID 원칙
summary : 객체지향의 설계원칙
date    : 2021-04-02 14:38:52 +0900
updated : 2021-04-02 15:05:31 +0900
tag     : OOP design principle
toc     : true
public  : true
parent  : [[programming]]
latex   : false
---
* TOC
{:toc}

# SOLID 원칙이란
* 객체지향의 5대 설계원칙인 `단일책임원칙`*Single Responsibility Principle*, `개방-폐쇄원칙`*Open-Closed Principle*, `리스코프치환원칙`*Liskov Substitution Principle*, `인터페이스분리원칙`*Interface Segregation Principle*, `의존역전원칙`*Dependency Inversion Principle*의 각 앞글자를 따서 `SOLID원칙`이라 부른다.

#### 단일책임원칙
* 한 클래스는 하나의 책임만 가져야 한다

#### 개방-폐쇄원칙
* 소프트웨어 요소는 확장에는 열려있으니 변경에는 닫혀있어야 한다

#### 리스코프치환원칙
* 프로그램의 객체는 프로그램의 정확성을 깨뜨리지 않으면서 하위 타입의 인스턴스로 바꿀 수 있어야 한다.[^DESBYCONT-1]

#### 인터페이스분리원칙
* 특정 클라이언트를 위한 인터페이스 여러개가 범용 인터페이스 하나보다 낫다.

#### 의존역전원칙
* 프로그래머는 `추상화에 의존해야지, 구체화에 의존하면 안된다`. 의존성 주입은 이 원칙을 따르는 방법 중 하나다.

## 주석
[^DESBYCONT-1]: 계약에 의한 설계를 참고

## Links
* [Wikipedia](https://ko.wikipedia.org/wiki/SOLID_(%EA%B0%9D%EC%B2%B4_%EC%A7%80%ED%96%A5_%EC%84%A4%EA%B3%84))
