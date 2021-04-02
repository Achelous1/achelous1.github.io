---
layout  : wiki
title   : SQL의 칠거지악
summary : 엔코아의 SQL 작성시 하지 말아야 할 7가지 규칙
date    : 2021-04-02 09:44:20 +0900
updated : 2021-04-02 11:04:20 +0900
tag     : sql guide do-nots
toc     : true
public  : true
parent  : [[programming]]
latex   : false
---
* TOC
{:toc}

# SQL 칠거지악

1. 좌변을 가공하지 말라 (DB column을 가공하지 말고 치환시켜 상수(변수)부분을 가공하라.)

2. 데이터 존재 유무를 확인하기 위해 count(*) ... cnt > 0 를 사용하지 말 것.

3. Decode 또는 Case를 사용시에 새끼를 증손자 이상 낳지 마라. (decode(decode...))

4. Union 을 사용할 때 다시 한번 Union all로 사용할 수 없는지 확인하라.

5. In Line View 또는 out of temp를 사용할 때 진정 필요한 In Line View인지를 확인하라.

6. 조인 SQL일 경우 집합의 복제(카테시안곱)를 제외하고는 연결고리 Relation 상 1:M 이든, M:1이든, 1:1 이든 어느 한쪽은 반드시 1 인지 확인하고 함부로 Outer Join을 하지말고 Outer join이 자주 나타난다면 설계자(모델러)에게 다시 한번 확인하라.

7. 결과에만 만족하지 말고 실행계획(Execution plan)에 관심을 가지고 절차형 로직 (If Then Else)을 버리고 집합적 하나의 SQL로 임무를 완수토록 하라.
    
# 출처
* [불쥐의 눈으로 본 세상](https://bluejini.co.kr/25)
