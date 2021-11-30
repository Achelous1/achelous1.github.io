---
layout  : wiki
title   : Django Rest Framework를 사용하며 디버깅한 경험 
summary : 
date    : 2021-09-21 14:45:17 +0900
updated : 2021-09-22 17:37:43 +0900
tag     : debug drf django-rest-framework django python
toc     : true
public  : true
parent  : [[django]] 
latex   : false
---
* TOC
{:toc}

#### Swagger와 연동 시`Failed to load API definition`
 
![drf-swagger-error-screenshot](https://user-images.githubusercontent.com/24582045/134118499-2d9422d7-557b-4e12-810b-e7abbf76c236.png)

* 케이스 1 : 시리얼라이저**serializer**에서 정확하지 않은 필드명을 입력 시 발생
    * 해결방안 :
        * 시리얼라이저 내부의 이름이 변경된 필드나 사용되지 않는 필드 변경/제거

#### serializer에서 업데이트 요청 시 id값이 들어오지 않는 현상

* 현상 설명: `PUT` 또는 `PATCH` 를 하여 모델정보를 가지고 올 때 `id`데이터가 들어있지 않다
* 해결 방안 : `id`항목은 기본적으로 `read_only` 항목이기에 `id` 항목을 시리얼라이저 내부에 한번 더 `serializers.IntegerField()`로 재정의 해주어야 정상적으로 동작한다

#### 저장 시 'Manager isn't accessible via * instances' 에러가 발생하는 현상

* 현상 설명: `instance.objects.create(...)` 시 상위 에러가 발생한다
* 해결 방안: `create` 할 시 모델딴이 아닌 인스턴스 딴에서 `create`를 실행시켜 발생하는 에러. `instance.objects.create(...)` 가 아닌 `Model.objects.create(...)` 로 호출할 것