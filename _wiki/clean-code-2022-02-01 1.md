---
layout  : wiki
title   : 클린코드 2022-02-01의 기록
summary : 
date    : 2022-02-01 11:21:41 +0900
updated : 2022-02-01 11:21:41 +0900
tag     : clean-code nomad-coders
toc     : true
public  : true
parent  : [[nomad-book-club]]
latex   : false
---
* TOC
{:toc}

# DAY12
* 오늘 읽은 범위 : 객체와 자료 구조 ~p128

### 책에서 기억하고 싶은 내용을 써보세요
> * 변수와 프로그래머 사이에 함수라는 계층(`getter`, `setter`)를 넣는다고 구현이 저절로 감춰지지는 않는다. 구현을 감추려면 **추상화**가 필요하다.
>     * 추상 인터페이스를 제공해 사용자가 구현을 모른 채 자료의 핵심을 조작할 수 있어야 진정한 의미의 클래스다
>     
>     ```java
>     // 구체적인 Point 클래스 -구현을 완전히 노출한다
>     public class Point {
>         public double x;
>         public double y;
>     }
>     
>     // 추상적인 Point 인터페이스 -구현을 완전히 숨긴다
>     public interface Point {
>         double getX();
>         double getY();
>         void setCartesian(double x, double y);
>         double getR();
>         double getTheta();
>         void setPolar(double r, double theta);
>     }
>     ```
>     * 자료를 세세히 공개하기 보다는 추상적인 개념으로 표현하는 편이 좋다. 인터페이스나 조회/설정 함수로는 추상화가 이뤄지지 않는다.
>     
>     ```java
>     // 정보가 어떤 정보인지 노출
>     public interface Vehicle {
>         double getFuelTankCapacityInGallons();
>         double getGallonsOfGasoline();
>     }
>     
>     // 정보가 어디서 오는지 드러나지 않음
>     public interface Vehicle {
>         double getPercentFuelRemaining();
>     }
>     ```
> * **자료/객체 비대칭**
>     * (자료구조를 사용하는) 절차적인 코드는 기존자료구조를 변경하지 않으면서 새 함수를 추가하기 쉽다[^PROCEDURAL_PROGRAM-1]-**새로운 함수가 필요한 경우 적합**
>     * 객체지향 코드는 기존함수를 변경하지 않으면서 새 클래스를  추가하기 쉽다.[^OBJECT_ORIENTED-2]-**새로운 자료타입이 필요한 경우 적합**
> * **디미터 법칙**-*모듈은 자신이 조작하는 객체의 속사정을 몰라야 한다는 법칙*[^LAW_OF_DEMETER-3]
>     * 객체는 조회함수로 내부구조를 공개하면 안된다!-내부구조를 숨기지 않고 노출하는 셈이니까
>     * 기차충돌은 피하라-여러 객차가 한줄로 이어진 기차처럼 보이는 코드
>     * ex)
>     ```java
>     final string outputDir = ctxt.getOptions(). getScratchDir().getAbsolutePath();
>     ```
>     * **잡종구조**-절반은 객체, 절반은 자료구조-는 새로운 함수는 물론이고 새로운 자료구조를 추가하기도 어렵기 때문에-양쪽구조의 단점만 모아놓은 구조다- 되도록 피하는 편이 좋다.
>     * 구조체를 감추기 위해서는 객체에게 속을 드러내라고 말하는 대신 뭔가를 하라고 말해야한다.-해당 코드를 분석 후에 객체가 행해야하는 알맞은 방향으로 함수를 변경하는 방법이 옳다.-[^HIDE_STRUCTURE-4]
> * 활성레코드와 같은 특수 DTO*Data Transfer Object*를 객체취급을 하지 않으며 하나의 자료구조로 취급해야 옳다. 비즈니스 규칙을 담고 내부자료를 숨기는 객체는 따로 생성해라!
> * 

### 오늘 읽은 소감은? 떠오르는 생각을 가볍게 적어보세요
> 1. 이번 장에서는 기본적으로 OOP의 개념과 절차지향형 개념을 적절한 때에 사용해야 유연성이 높은 코딩을 할 수 있다라는 개념과 비즈니스로직(객체)을 구현할 때에 무엇을 숨겨야 하며, 객체에게 어울리는 작업은 무엇인지 잘 설명해준 장이었던 것 같습니다. 조금 헷갈리는 부분이 없지않아 있었지만 원래 자바/스프링 개발자였던 저에게는 익숙한 단어들이 많이 나와 반가웠던 시간인 것 같습니다. 많이 헷갈리는 장이었던 것 만큼 한번 더 읽어서 흡수하는 시간을 가져야할 것 같습니다

### 궁금한 내용이 있거나, 잘 이해되지 않는 내용이 있다면 적어보세요
> * 

### 세줄 요약
> * `getter` `setter`라는 계층을 변수와 프로그래머 사이에 넣는다고 구현이 감춰지지는 않는다!
> * 객체지향적인 언어를 사용한다고 절차지향형 구조를 아예 사용하지 않을 이유가 없다. 각각의 장단점을 최대한 활용해 설계하자-모든 것이 객체라는 생각은 미신이다!
> * 모듈은 자기 자신이 조작하는 객체의 속사정을 몰라야 한다! 내부의 자료구조는 노출하지 않고 겉으로 드러난 비즈니스 함수만을 통하여 객체에게 무엇을 할지 명령만 하는것이 중요하다!

## Links
* [노개북 README](https://nomadcoders.oopy.io/readme?utm_source=Nomad_Book_Club%231&utm_campaign=853979327e-EMAIL_CAMPAIGN_2022_01_20_09_04&utm_medium=email&utm_term=0_26f5b50d66-853979327e-357549064)
* [TIL 출석표](https://docs.google.com/spreadsheets/d/1Cy2NOnfFDP6Y1snkd3nL5VidLDmBq8C9696iTwbc_K0/edit#gid=0)

## 주석
[^PROCEDURAL_PROGRAM-1]: p120 목록6-5 *절차적인 도형*코드 참조
[^OBJECT_ORIENTED-2]: p121 목록6-6 *다형적인 도형*코드참조
[^LAW_OF_DEMETER-3]: 위키피디아 [참조](https://en.wikipedia.org/wiki/Law_of_Demeter)
[^HIDE_STRUCTURE-4]: p125의 구조체 감추기 참조