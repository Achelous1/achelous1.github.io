---
layout  : wiki
title   : Django Introduction
summary : 
date    : 2021-08-30 21:30:37 +0900
updated : 2021-08-30 21:31:21 +0900
tag     : django django-orm orm
toc     : true
public  : true
parent  : [[django]]
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
* Django는Controller에서 URL을 resolve하지 않고, url.py라는 파일을 따로 만들어 그곳에서 URL resolve를 관리한다.

## PIP vs Pipenv
* PIP : Global 설치
    * 파이썬을 사용하는 모든 프로젝트에서 로드가 가능 
* Pipenv : bubble 프로바이더
    * 각 프로젝트별로 패키지를 관리
    * PIP으로 Pipenv를 global하게 설치한 뒤 사용

### Pipenv 설치방법

```shell
# Terminal
$ pip install --user pipenv

# Homebrew
$ brew install pipenv

```

* Pipenv 설치 확인
 
```shell
# Terminal
$ pipenv
```

### Pipenv 버블 설정 방법
* Django는 Python3.x 버전에서 가장 잘 작동한다. 그러니 pipenv를 설정할 때 python3.x버전을 사용하게 option을 줘야한다

```shell
# Terminal
$ pipenv --three
```

* `pipenv shell` 명령어를 통해 pipenv의 버블 안으로 위치한다
* 이후 이 shell 내부에서 패키지를 설치하면 해당 프로젝트 내에서만 사용 가능한 패키지로 설치
    * 설치한 패키지의 의존성*dependency*는 `Pipfile`내부에 추가된다 (향후 해당 소스코드를 사용하는 다른 프로젝트에서도 사용가능)

## Django
* Django는 `pipenv install django=={version}`으로 설치한다
* 프로젝트를 생성할 때에는 `django-admin startproject {projectName}`명령어를 사용하여 설치한다

## Django vs Spring
### 용어 정리

| Django    | Spring     |
|-----------|------------|
| Decorator | Annotation |
| View      | Controller |
| Template  | View       |

## Links
* [Mozilla-Django소개](https://developer.mozilla.org/ko/docs/Learn/Server-side/Django/Introduction#%EC%9A%94%EC%B2%AD%EC%9D%84_%EC%95%8C%EB%A7%9E%EC%9D%80_%EB%B7%B0%EB%A1%9C_%EC%A0%84%EB%8B%AC_urls.py)
