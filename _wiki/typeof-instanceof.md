---
layout  : wiki
title   : typeof와 instanceof의 차이점
summary : 
date    : 2021-02-05 14:28:19 +0900
updated : 2021-02-05 15:46:00 +0900
tag     : javascript typeof instanceof
toc     : true
public  : true
parent  : [[JavaScript]]
latex   : false
---
* TOC
{:toc}

# 자바스크립트의 "typeof"와 "instanceof"연산자의 차이점
* 자바스크립트엔 `typeof`연산자와 `instanceof`연산자가 있다. 두연산자는 비슷해 보이지만 다른 기능을 한다.

## typeof 연산자
* `typeof` 연산자는 해당 변수 또는 값의 원시*primitive*타입을 반환하는 연산자이다.
* `typeof` 연산자의 반환값들은 다음과 같다:
    1. "number"
    2. "string"
    3. "object"
    4. "boolean"
    5. "bigint"
    6. "function"
    7. "undefined"
    8. "symbol"
    
## instanceof 연산자
* `instanceof` 연산자는 해당변수가 특정 `prototype` 생성자에 의해 생성이 되었는지 확인하는 연산자이다.
