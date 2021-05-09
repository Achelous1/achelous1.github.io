---
layout  : wiki
title   : 클린코드
summary : 클린코드를 향하여
date    : 2021-05-09 08:51:27 +0900
updated : 2021-05-09 16:41:17 +0900
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
* SOLID원칙의 단일책임의 원칙-한 클래스는 하나의 책임만 가져야 한다-과 더불어 간결한 코드를 구현하라

## YAGNI 원칙
> You Ain't Gonna Need It!
* 현재 필요하지 않은 기능, 사용하지 않는 기능, 그리고 지나치게 미래지향적인 코드는 지양하라

## Links
* [코딩 잘하는 팁 세가지 (이걸 알면 코드가 깔끔해 진다) by 드림코딩](https://www.youtube.com/watch?v=jafa3cqoAVM&t=401s)
