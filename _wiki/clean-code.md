---
layout  : wiki
title   : 클린코드
summary : 클린코드를 향하여
date    : 2021-05-09 08:51:27 +0900
updated : 2021-05-09 17:42:42 +0900
tag     : 클린코드 clean-code
toc     : true
public  : true
parent  : [[programming]]
latex   : false
---
* TOC
{:toc}

# 클린코드를 향하여

## DRY 원칙
> Don't Repeat Yourself

### 목적
* 코드의 중복성 제거

### 예제#1

* 아래 함수들은 공통적으로 사용자의 이름을 출력

```javascript
function greetings(user){
    return `Hi ${user.firstName} ${user.lastName}`;
}

function goodbye(user){
    return `See you next time ${user.firstName} ${user.lastName}`;
}

```

* 문제점:
    * 해당 함수들에서 만약 user.middleName을 출력하고 싶다면 이름을 출력하는 모든 함수들을 변경해줘야 함
    * 만약 놓친 부분이 있다면 버그로 이어질 가능성이 다분하다

* 해결법

```javascript
function greetings(user){
    return `Hi ${user.getFullName()}`;
}

function goodbye(user){
    return `See you next time ${user.getFullName()}:wave:`;
}

class User{
    getFullName() {
        return `${this.firstName} ${this.middleName} ${this.lastName}`; // 이부분만 변경해주면 User 클래스를 사용하는 함수들은 getFullName()만 호출해주고 변경에 무심해도 된다.
    }
}
```

## KISS 원칙

> Keep It Simple -and- Stupid

### 목적
* SOLID원칙의 단일책임의 원칙-한 클래스는 하나의 책임만 가져야 한다-과 더불어 간결한 코드를 구현하라
 
> Most systems work best if they are kept simple rather than made complicated; therefore, **simplicity should be a key goal** in design and unnecessary complexity should be avoided. *by Kelly Johnson*

* 대부분의 시스템은 복잡하게 만들어지기 보다는 간단하게 만들어 졌을때 작동을 더 잘한다. 그러므로, 복잡함보다는 **간결함을 프로그래밍 설계에 있어서 핵심 목적*key goal* **로 잡아야 한다.

### 예제#1

* 코드

```javascript
// 배열을 매개변수로 받아서 isEven === true라면 처음으로 나오면 짝수 값을, 
// isEven === false라면 처음으로 나오는 홀수 값을 리턴한다.
function getFirst(array, isEven) {
    return array.find(x => (isEven ? x % 2 === 0 : x % 2 !== 0); // 한줄에 많은 것을 내포하면 가독성이 떨어진다
}

// 풀어서 가독성을 높힐 수 있으나, 특정 매개변수의 참/거짓값으로 다른 동작을 하도록 코딩을 하는 것은 KISS하지 않다
function getFirst(array, isEven) {
    if(isEven) {
        return array.find(x => x % 2 === 0);
    } else {
        return array.find(x => x % 2 !== 0);
    }
}
```

* 해결책

```javascript
// 사용자가 원하는 각각의 함수를 사용할 수 있게됨
function getFirstOdd(array) {
    return array.find(x => x % 2 !== 0);
}

function getFirstEven(array) {
    return array.find(x => x % 2 ===);
}
```

### 예제#2

* 코드

```javascript
function updateAndPrint(rawData) {
    // prep data...
    // more code...
    db.update(rawData);
    // get printer...
    // more code...
    printer.print(data);
}
```
* 문제점:
    * 한가지의 함수에서 여러가지 동작을 실행하는 것은 바람직하지 못하다.(update와 print 두가지 동작을 하게됨)

* 해결책:
    * 두가지를 한번에 동작하는 함수 대신 한가지 동작을 하나의 함수에 함으로써 코드의 간결함을 유지할 수 있다.
    
```javascript
function update(rawData) {
    // prep data...
    db.update(rawData);
    // more code...
    return data;
}

function print(data) {
    // get printer...
    // more code...
    printer.print(data);
}
```

## YAGNI 원칙

> You Ain't Gonna Need It!

* 현재 필요하지 않은 기능, 사용하지 않는 기능, 그리고 지나치게 미래지향적인 코드는 지양하라

## Links
* [코딩 잘하는 팁 세가지 (이걸 알면 코드가 깔끔해 진다) by 드림코딩](https://www.youtube.com/watch?v=jafa3cqoAVM&t=401s)
