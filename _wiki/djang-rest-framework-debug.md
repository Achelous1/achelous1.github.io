---
layout  : wiki
title   : Django Rest Framework를 사용하며 디버깅한 경험 
summary : 
date    : 2021-09-21 14:45:17 +0900
updated : 2021-09-21 14:58:08 +0900
tag     : debug drf django-rest-framework django python
toc     : true
public  : true
parent  : [[django-rest-framework]] 
latex   : false
---
* TOC
{:toc}

### Swagger와 연동 시`Failed to load API definition`
 
![drf-swagger-error-screenshot](https://user-images.githubusercontent.com/24582045/134118499-2d9422d7-557b-4e12-810b-e7abbf76c236.png)

* 케이스 1 : 시리얼라이저**serializer**에서 정확하지 않은 필드명을 입력 시 발생
    * 해결방안 :
        * 시리얼라이저 내부의 이름이 변경된 필드나 사용되지 않는 필드 변경/제거
