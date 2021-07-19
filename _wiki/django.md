---
layout  : wiki
title   : Django
summary : Django에 관하여
date    : 2021-07-18 21:25:00 +0900
updated : 2021-07-19 15:17:31 +0900
tag     : python django
toc     : true
public  : true
parent  : [[python]]
latex   : false
---
* TOC
{:toc}

# Django
## 개요
* Django는 파이썬이 베이스인 웹어플리케이션 프레임워크이다

## 아키텍처
* Django는 기본적으로 MVC와 비슷한 MTV라는 형태의 아키텍처를 사용하는데, MTV는 Model-Template-View의 약자이다.
* Model은 기본적으로 MVC의 모델과 비슷하다.
* Template은 기본적으로 MVC의 View와 비슷하다.
* View는 기본적으로 MVC의 Controller와 비슷하다.
* Django는Controller에서 URL을 resolve하지 않고, url.py라는 파일을 따로 만들어 그곳에서URL resolve를 관리한다.

## PIP vs Pipenv
* PIP : Global 설치
    * 파이썬을 사용하는 모든 프로젝트에서 로드가 가능 
* Pipenv : bubble 프로바이더
    * 각 프로젝트별로 패키지를 관리
    * PIP으로 Pipenv를 global하게 설치한 뒤 사용
  
```
# Terminal
$ pip install --user pipenv

# Homebrew
$ brew install pipenv

```

## Links
* [Mozilla-Django소개](https://developer.mozilla.org/ko/docs/Learn/Server-side/Django/Introduction#%EC%9A%94%EC%B2%AD%EC%9D%84_%EC%95%8C%EB%A7%9E%EC%9D%80_%EB%B7%B0%EB%A1%9C_%EC%A0%84%EB%8B%AC_urls.py)
