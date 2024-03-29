---
layout  : wiki
title   : Django Rest Framework
summary : Django에서 Rest API를 쉽게
date    : 2021-08-30 21:31:53 +0900
updated : 2021-09-03 11:12:39 +0900
tag     : django rest-api rest api django-rest-framework
toc     : true
public  : true
parent  : [[django]]
latex   : false
---
* TOC
{:toc}

# 개요

> Django REST Framework는 Web API를 개발하는 데 있어 막강하고 유연한 툴킷이다 [^rest-framework-intro]

# Django REST Framework 개념

## [Requests](https://www.django-rest-framework.org/api-guide/requests/)

## [Responses](https://www.django-rest-framework.org/api-guide/responses/)

## [Serializers](https://www.django-rest-framework.org/api-guide/serializers/)
* 장고모델 기반의 QuerySet의 데이터를 JSON 또는 http통신으로 주고 받을 수 있는 다른형식으로 변환해주는 틀

## [Views](https://www.django-rest-framework.org/tutorial/quickstart/#views)
* 특정 url로 요청을 받아 해당 요청을 처리하여 response를 반환해주는 함수기반 뷰(Function Based View)

### ViewSets
* 다중의 view를 작성하는 대신 공통된 행위들을 같은 View 내부의 ViewSet으로 묶는다.
* 이렇게 함으로써 로직을 정돈되고 간결하게 유지할 수 있으며 각각의 view로도 쉽게 다시 정리할 수 있다.

## [URLs](https://www.django-rest-framework.org/tutorial/quickstart/#urls)
* 요청 받은 url을 어떤 api로 처리할 것인지 할당하는 파일(urls.py)

# Link
* [Django Rest Framework](https://www.django-rest-framework.org/)
* [\<DevKor/\> - 02. Django Rest Framework, Serializer, View 개념 익히기](https://devkor.tistory.com/entry/03-Django-Rest-Framework-Serializer-View-%EA%B0%9C%EB%85%90-%EC%9D%B5%ED%9E%88%EA%B8%B0)

# 주석
[^rest-framework-intro]: Django REST Framework 웹에서 발췌
