---
layout  : wiki
title   : 자바 코딩가이드
summary : 구글의 자바 코딩가이드
date    : 2021-01-22 10:26:09 +0900
updated : 2021-03-17 17:19:18 +0900
tag     : guideline java style 
toc     : true
public  : true
parent  : [[programming]]
latex   : false
updated: 2022-08-09 21:52:33 +0900
---
* TOC
{:toc}

# 구글의 자바 코딩스타일 가이드
## 구글에서 사용하는 자바코딩의 가이드라인을 알아보자

## 1 기본

### 1.1 용어정리
1. 클래스*class*라 함은 이타적*inclusive*인 의미의 "통상적"인 클래스, 열거형 클래스, 인터페이스 또는 애너테이션유형(@interface)를 지칭한다.
2. 멤버*member- of a class*라 함은 이타적으로 중첩클래스*nested class*, 필드, 메서드 또는 생성자*constructor- initializer*와 주석*comment*을 뺀 모든 최상위 컨텐츠*all top-level contents*를 지칭한다.
3. 주석*comment*라 함은 언제나 구현주석*implementation comment*를 지칭한다. 문서주석*documentation comment*란 단어는 사용하지 않으며 통상적인 자바독*Javadoc*이란 용어를 사용한다.

## 2 소스파일 기본
### 2.1 파일명명규칙
* 파일명은 해당 자바파일에 정의된 최상위 클래스의 대소문자 구분 된 클래스명을 따르며 .java의 확장자를 사용한다.

### 2.2 소스파일 인코딩
* 소스파일은 UTF-8형식의 인코딩을 사용한다.

### 2.3특수문자
#### 2.3.1 공백문자
* 끝자리 문자 이외에는 **ASCII 가로공백문자** *ASCII horizontal space character `0x20`*만이 소스파일 내에서 사용되며, 이는,
    1. 다른 모든 공백문자나 문자리터럴은 이스케이프 되어야 한다.
    2. 탭*Tab*문자는 인덴트로 사용되지 **않는다**.
        
#### 2.3.2 특수문자 이스케이프 순서
* 특수 이스케이프 시퀀스 (\b, \t, \n, \f, \r, \", \'및 \\)가있는 문자의 경우 해당하는 8진수(\012)나 유니코드(\u000a) 대신 해당 시퀀스가 사용된다.
        
#### 2.3.3 ASCII 이외의 문자
* 다른 모든 ASCII 이외의 문자에 대해서는 실제의 유니코드문자 `(e.g. ∞)` 또는 그에 해당하는 이스케이프 된 유티코드 문자 `(e.g. \u221e)`를 사용한다. 어떤 유형을 사용할 것인지에 대한 선택은 코드를 **더 쉽게 이해할 수 있음**에 기반하며, 문자리터럴 외에 또는 주석에 이스케이프 된 유니코드 문자는 지양한다.
	> **Tip**: 이스케이프 된 유니코드문자를 사용 시, 그리고 해당 유니코드문자를 사용 시에도, 이를 설명하는 주석은 매우 도움이 된다.

예제:
	
| Example                                                | Discussion                                                                   |
|--------------------------------------------------------|------------------------------------------------------------------------------|
| String unitAbbrev = "μs";                              | 가장 좋은 형태: 주석없이도 이해가 가능                                       |
| String unitAbbrev = "\u03bcs"; // "μs"                 | 허용되지만 이렇게 할 이유가 없음                                             |
| String unitAbbrev = "\u03bcs"; // Greek letter mu, "s" | 허용되지만 어색하고 실수 할 여지가 많음                                      |
| String unitAbbrev = "\u03bcs";                         | 좋지 않음: 어떤 의도인지 파악하기 어려움                                     |
| return '\ufeff' + content; // byte order mark          | 좋음: 출력되지 않는 문자에 대해서 이스케이프를 사용하고 필요하면 주석을 사용 |


> **Tip**: 특정 프로그램들이 ASCII 문자를 지원하지 않을까봐 걱정되어 여러분이 작성하는 코드의 가독성을 줄이지 말자. 만약 그런 프로그램이 있다면, 그 프로그램은 **고장난** 것이며 **고쳐야** 한다.
    
## 3 소스파일구조

* 소스파일의 구조는 다음을 순차적으로 포함한다:
    1. 라이선스 또는 저작권정보 (기존재 시)
    2. 패키지 선언문
    3. 임포트*import* 선언문들
    4. 정확히 하나의*Exactly one* 최상위 클래스

* 그리고 **정확히 하나의** *Exactly one* **빈 줄**로 각 요소를 나눈다.

### 3.1 라이선스 또는 저작권정보 (기존재 시)
* 만약 특정 파일에 라이선스 또는 저작권 정보가 존재 한다면 이곳에 포함한다.

### 3.2 패키지 선언문
* 패키지선언문은 **줄바꿈 하지 않는다** *not line-wrapped*. 컬럼제한(4.4섹션, [컬럼제한: 100](#44-컬럼제한-100))은 패키지 선언문에 적용되지 않는다.

### 3.3 임포트 선언문
#### 3.3.1 와일드카드 임포트 사용금지
* **와일드카드 임포트[^WILDCARD-1]는**, 스태틱이든 간에, **사용되지 않는다**

#### 3.3.2 줄바꿈 하지 않음
* 임포트 선언문은 **줄바꿈 하지 않는다**. 컬럼제한(4.4섹션, [컬럼제한: 100](#44-컬럼제한-100))은 패키지 선언문에 적용되지 않는다.

#### 3.3.3 정렬과 간격
* 임포트 선언문은 다음과 같이 정렬한다:
    1. 모든 스태틱 임포트를 같은 블럭에 정렬
    2. 모든 스태틱이 아닌 임포트를 같은 블럭에 정렬

* 만약 스태틱과 스태틱이 아닌 임포트가 동시에 존재 할 경우, 하나의 빈 줄로 두 블럭을 나눈다. 그 외에 경우엔 빈 줄로 나누는 경우는 없다.
* 각 블럭 안의 임포트문들은 이름을 ASCII 정렬순서로 정렬한다. (**참고**: '.'는 ';' 앞에 정렬되므로 임포트 *선언문들*이 ASCII 정렬 순서와 다름)

#### 3.3.4 클래스는 스태틱 임포트 하지 않음
* 스태틱 중첩클래스들은 스태틱 임포트를 하지 않고 일반적인 임포트를 사용한다.

### 3.4 클래스 선언
#### 3.4.1 정확히 하나의 최상위 클래스 선언
* 각 최상위 클래스는 자신에게 할당된 하나의 소스파일에 존재한다.

#### 3.4.2 클래스 내용의 정렬
* 당신이 선택한 클래스 멤버와 이니셜라이저들의 정렬방법은 학습가능성*learnability*에 막대한 영향을 미칠 수 있다. 하지만, 앞서 말한 것에 대한 정확한 방법*recipe*는 없다; 각자 다른 클래스는 다른 방법으로 내용을 정렬할 수 있다.

* 중요한 것은, 각 클래스들이, 유지보수자가 물어봤을 때 대답해 줄 수 있는, **논리적인 정렬**을 사용한다는 것이다. 예를 들어, 새로운 메서드들이 습관적으로 클래스의 마지막에 추가되지 않게 하는 것인데, 이것은 그저 "날짜순으로 추가"로 정렬된 것이며, 이것은 논리적인 정렬이 아니다.

##### 3.4.2.1 오버로딩*Overloads*: 절대 나누지 않는다
* 하나의 클래스가 여러개의 생성자*constructor*를 지닌다거나, 같은 이름의 메서드들이 여러개 존재한다면, 다른 코드들이 중간에 끼어들지 않고(private 멤버 포함), 순차적으로 표시한다.

## 4 포맷
* **용어참고**: *블록형 구조*란 클래스, 메서드 또는 생성자의 몸통*body*영역을 의미하한다. 섹션 4.8.3.1 배열이니셜라이저 [*array initializers*](#4831-배열이니셜라이저)에 따라, 모든 배열이니셜라이저는 *선택적으로 블록형구조로 취급*될 수 있다.

### 4.1 중괄호*Braces*

#### 4.1.1 조건부*optional*일 경우 중괄호사용
* 중괄호는 `if`, `else`, `for`, `do` 그리고 `while`문에서 사용되며, 내용이 비거나 한줄*single statement*만 쓰더라도 중괄호를 쓴다.

#### 4.1.2 비어 있지 않은 블록 Nonempty block : K & R 스타일
* 중괄호는 커니간*Kernighan*과 릿치*Ritchie*스타일("[Egyptian Brackets](https://blog.codinghorror.com/new-programming-jargon/)")의 *nonempty* 블럭과 블럭형 구조스타일을 따른다.
    * 중괄호를 연 다음 줄바꿈한다.
    * 중괄호를 닫기 전 줄바꿈한다.
    * 중괄호를 닫은 후엔, 해당 중괄호가 메서드, 생성자 또는 명명된*named* 클래스를 종료할 때만 줄바꿈을 한다. 예를들어, 중괄호 뒤에 `else` 또는 쉼표*comma*가 따라올 땐 줄바꿈하지 않는다.

    예제: 
    ```java
    return () -> {
      while (condition()) {
        method();
      }
    };

    return new MyClass() {
      @Override public void method() {
        if (condition()) {
          try {
            something(); } catch (ProblemException e) {
            recover();
          }
        } else if (otherCondition()) {
          somethingElse();
        } else {
          lastThing();
        }
      }
    };

    ```

4.8.1섹션 [열거형 클래스](#481-열거형-클래스)에서 열거형 클래스에 대한 몇가지 예외를 설명한다.

#### 4.1.3 빈 블록: 간결할 수도 있음
* 빈 블록, 또는 블록형구조는 K & R 스타일을 따를 수 있다( [Section 4.1.2](#412-비어-있지-않은-블록-nonempty-block--k--r-스타일)에서 설명한 것처럼). 다른형태로는 빈 블록은 다중블럭선언문*multi-block statement*의 한 부분이지 **않을 경우**(직접적으로 다중블록을 가지고 있는 경우: `if/else` 또는 `try/catch/finally`) 중괄호 사이에 다른 문자열이나 줄바꿈 없이 바로 열고 닫을 수 있다(`{}`).
<br/>
예제:
```java
  // 허용
  void doNothing() {}

  // 허용 
  void doNothingElse() {
  }
```
<br/>
```java
  // 허용되지 않음: 다중블록선언문에선 간결한 빈블록을 사용할 수 없다
  try {
    doSomething();
  } catch (Exception e) {}
```

### 4.2 블록 들여쓰기: +2 띄어쓰기
* 새로운 블럭이나 블럭형 구조가 열릴 경우, 들여쓰기는 두번 띄어쓰기*two spaces* 한다. 만약 블럭이 닫힌다면, 들여쓰기는 기존 들여쓰기레벨로 돌아간다. 들여쓰기레벨은 코드와 주석 모두에 블럭 안에서 적용된다. (Section 4.1.2 [비어있지 않은 블록: K & R스타일](#412-비어-있지-않은-블록-nonempty-block--k--r-스타일)의 예제 참조)

### 4.3 라인*line* 당 하나의 선언문
* 한줄에는 하나의 선언문만으로 이루어진다.

### 4.4 컬럼제한: 100
* 자바코드는 100자*characters*의 컬럼제한을 가진다. 하나의 "문자"라는 의미는 아무 유니코드의 코드포인트*code point*를[^UTFCDPNT-2] 의미한다. 아래의 예외경우를 제외하고 컬럼제한을 초과한 경우엔 Section 4.5[줄바꿈](#45-줄바꿈)에서 설명하듯이 줄바꿈*line-wrapping*을 해야한다.
> 각각의 유니코드 코드포인트는[^UTFCDPNT-2], 화면의 가로값이 길거나 짧아도, 하나의 문자로 계산한다. 예를 들어, 전각문자*[fullwidth characters](ref-fullwidth-characters)*를 사용하는 경우, 해당 줄을 이 규칙이 엄격하게 적용되는 범위 전에 줄바꿈 할 수 있다.

    예외:
    1. 컬럼제한을 따르는 것이 불가능한 줄의 경우(자바독의 URL 또는 긴 JSNI 메서드 참조).
    2. 패키지*package* 그리고 임포트*import* 선언문([Section 3.2 패키지선언문](#32-패키지-선언문)과 [Section 3.3 임포트선언문](#33-임포트-선언문) 참조)
    3. 주석 내에 작성 된 쉘에 잘라내기 후 붙혀넣기*cut-and-pasted* 할 수 있는 명령문들*command lines*.

### 4.5 줄바꿈
* **용어참고**: 규칙에 위반되지 않는 선에서 한 줄*single-line*의 코드를 여러줄로 나눌 경우, 이 작업을 줄바꿈*line-wrapping*이라고 한다.
* 줄바꿈을 하는데 있어 모든 상황에 대하여 포괄적이고 결정적인 줄바꿈을 하는 공식은 없다. 하지만 동일한 코드에 대하여 줄바꿈을 하는데 유효한 여러가지 방법이 있다.

> **참고**: 줄바꿈을 하는데 전형적인 이유는 컬럼제한을 넘기지 않기 위해 해당 행위를 하는 것이지만, 컬럼제한의 범주에 들어가지 않지만 코드저자의 재량으로 줄바꿈을 할 수 있다.

> **팁**: 줄바꿈을 하는 대신 메서드 또는 지역변수를 적출*extract* 함으로써 문제를 해결할 수도 있다.

#### 4.5.1 줄바꿈 할 위치
* 줄바꿈의 주요 지침은 : *더 높은 구문레벨에서* 줄바꿈 하는것을 선호한다. 그리고:
1. 
The prime directive of line-wrapping is: prefer to break at a higher syntactic level. Also:

When a line is broken at a non-assignment operator the break comes before the symbol. (Note that this is not the same practice used in Google style for other languages, such as C++ and JavaScript.)
This also applies to the following "operator-like" symbols:
the dot separator (.)
the two colons of a method reference (::)
an ampersand in a type bound (<T extends Foo & Bar>)
a pipe in a catch block (catch (FooException | BarException e)).
When a line is broken at an assignment operator the break typically comes after the symbol, but either way is acceptable.
This also applies to the "assignment-operator-like" colon in an enhanced for ("foreach") statement.
A method or constructor name stays attached to the open parenthesis (() that follows it.
A comma (,) stays attached to the token that precedes it.
A line is never broken adjacent to the arrow in a lambda, except that a break may come immediately after the arrow if the body of the lambda consists of a single unbraced expression. Examples:


####

### 4.6

### 4.7

### 4.8
#### 4.8.1 열거형 클래스
    
## 5 명명규칙

## 6 프로그래밍 관행

## 7 자바독
    
---
## Links
* [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html)
* [Jenkov tutorials](http://tutorials.jenkov.com/unicode/index.html)

---
## 주석
[^WILDCARD-1]: [와일드카드 임포트]특정 패키지 내에 존재하는 모든 클래스를 임포트하는 임포트 선언문 `예: java.util.*`
[^UTFCDPNT-2]: [유니코드 코드포인트] 유니코드를 정의하는 'U+' 0 부터 10FFFF값 사이의 16진수 값

[ref-egyptian-brackets]:https://blog.codinghorror.com/new-programming-jargon/
[ref-fullwidth-characters]:https://en.wikipedia.org/wiki/Halfwidth_and_fullwidth_forms
