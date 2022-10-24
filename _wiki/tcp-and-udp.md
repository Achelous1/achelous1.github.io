---
layout  : wiki
title   :  TCP와 UDP
summary : TCP와 UDP에 대하여 알아보자
date    : 2022-03-08 22:43:19 +0900
updated : 2022-10-24 11:27:00 +0900
tag     : 
toc     : true
public  : true
parent  : [[programming]]
latex   : false
---
* TOC
{:toc}

# TCP와 UDP

### 정의
* TCP와 UDP는 둘 다 OSI 7계층 중 전송계층(Transport Layer - Layer 4)에 속한다.
* 송신자와 수신자 간의 패킷 전송을 위한 프로토콜이다.

## TCP *Transport Control Protocol*
* 연결형 서비스
* 3 way handshake로 연결 수립 4 way handshake로 연결 종료로 정보를 보내거나 받는다는 신호절차를 거친다
* 높은 신뢰성을 가지고 데이터를 전송한다
* 데이터의 전송 순서를 보장한다
* 상대적으로 느린 전송속도

#### 사용처
* 채팅
* 이메일
* http 통신
* 파일전송

### UDP *User Datagram Protocol*
* 비연결형 서비스
* 정보를 주고 받을때 정보를 보내거나 받는다는 신호절차를 거치지 않는다
* 신뢰성 없는 데이터를 전송한다
* 데이터의 전송 순서가 보장되지 않는다
* 상대적으로 빠른 전송속도

#### 사용처
* 스트리밍 서비스
* 실시간 서비스
* 게임 서버

# Links
* [TROLL](https://choseongho93.tistory.com/3)

# 주석