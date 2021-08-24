---
layout  : wiki
title   : Django ORM
summary : Django Object Relational Mapping
date    : 2021-08-24 16:39:46 +0900
updated : 2021-08-24 16:57:43 +0900
tag     : django orm django-orm python
toc     : true
public  : true
parent  : [[python]]
latex   : false
---
* TOC
{:toc}

# Django의 객체관계매핑
## 개요 
* Django의 모델**Model**과 데이터베이스를 자동으로 매핑해주는 기능
* 자바의 JPA나 Hibernate와 같이 객체기반으로 데이터베이스의 자동생성, CRUD(Create, Read, Update, Delete)를 SQL을 따로 작성할 필요 없이 개발자가 코드 내에서 함수로 호출해 줄 수있는 수있는 Persistent Framework이다.

## 사용방법
### 객체/인스턴스를 생성하는 방법
#### [save()](https://docs.djangoproject.com/en/3.2/ref/models/instances/#saving-objects)

| Model.save(force_insert=False, force_update=False, using=DEFAULT_DB_ALIAS, update_fields=None)
| force_insert/force_update : 강제 INSERT 또는UPDATE
| using : 사용할 데이터베이스
| update_fields : [참조](https://docs.djangoproject.com/en/3.2/ref/models/instances/#ref-models-update-fields)

* 사용방법:
```python
>>> from app.models import {ModelName}
>>> model = ModelName(foo='bar', key='val')
>>> model.save()
```
#### [create()](https://docs.djangoproject.com/en/3.2/ref/models/querysets/#django.db.models.query.QuerySet.create)


### 조회하는 방법

### 수정하는 방법

### 삭제하는 방법

## 링크
 
