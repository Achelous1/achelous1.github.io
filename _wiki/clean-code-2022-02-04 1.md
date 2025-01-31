---
layout  : wiki
title   : 클린코드 2022-02-04의 기록
summary : 
date    : 2022-02-04 12:15:25 +0900
updated : 2022-02-04 12:15:25 +0900
tag     : clean-code nomad-coders
toc     : true
public  : true
parent  : [[nomad-book-club]]
latex   : false
---
* TOC
{:toc}

# DAY15
* 오늘 읽은 범위 : 오류처리 ~p142

### 책에서 기억하고 싶은 내용을 써보세요
> * **특수사례패턴**-예외 처리 때문에 코드의 논리를 따라가기 힘들다면 클래스나 객체를 조작해 예외적인 상황을 캡슐화해서 처리해라[^SPECIAL_CASE_PATTERN-1]
> * **null 반환 금지**-null을 반환하는 코드는 일거리를 늘릴 뿐만 아니라 호출자에게 문제를 떠넘긴다. 누구 하나라도 null확인을 빼먹는다면 애플리케이션이 통제불능에 빠질지도 모른다.
>      * 애플리케이션 저 아래서 발생한 *NullPointerException*을 어떻게 처리하란 말인가?
>      * null 반환대신 빈 객체를 보낸다면 코드가 훨씬 깔끔해질 수 있다.
> * **null 전달 금지**- 대다수 프로그래밍 언어는 호출자가 실수로 넘기는 null을 적절히 처리하는 방법이 없다. 애초에 null을 넘기지 못하도록 금지하는 정책이 합리적이다. -애초에 인수로 null이 넘어온다면 코드에 문제가 있다는 말이다.
> * 깨끗한 코드는 읽기도 좋아야 하지만 안정성도 높아야 한다.
> * 오류 처리를 프로그램 논리와 분리해 독자적인 사안으로 고려하면 튼튼하고 깨끗한 코드를 작성할 수 있다.

### 오늘 읽은 소감은? 떠오르는 생각을 가볍게 적어보세요
> 1. 이때까지 개발을 하며 null반환과 null전달을 하는 많은 함수를 짜온 제 자신을 반성하게 되는 장이었습니다. null반환과 null전달로 인하여 적절한 처리가 되지 않는다면 프로그램에 많은 영향을 끼칠 수 있다는 문제를 알게 되었으며 앞으로는 null전달과 null반환은 되도록이면 안하는 것으로 해야겠다고 다짐했습니다.
> 2. 깨끗한 코드는 단순히 읽기만 쉬운 코드가 아니며 코드의 안정성 또한 잡아야 깨끗한 코드가 된다는 것을 알았습니다. 

### 궁금한 내용이 있거나, 잘 이해되지 않는 내용이 있다면 적어보세요
> * -

### 세줄 요약
> * 예외처리로 인하여 논리를 흐리지 말아라
> * null 반환 금지, null전달은 더 금지
> * 깨끗한 코드는 안정성과 독해력을 둘 다 고려해야 한다.

## Links
* [노개북 README](https://nomadcoders.oopy.io/readme?utm_source=Nomad_Book_Club%231&utm_campaign=853979327e-EMAIL_CAMPAIGN_2022_01_20_09_04&utm_medium=email&utm_term=0_26f5b50d66-853979327e-357549064)
* [TIL 출석표](https://docs.google.com/spreadsheets/d/1Cy2NOnfFDP6Y1snkd3nL5VidLDmBq8C9696iTwbc_K0/edit#gid=0)

## 주석 
[^SPECIAL_CASE_PATTERN-1]: p138의 예제코드 참조할 것