---
layout  : wiki
title   : Django ORM
summary : Django Object Relational Mapping
date    : 2021-08-24 16:39:46 +0900
updated : 2021-08-25 15:05:54 +0900
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
* Django의 모델*Model*과 데이터베이스를 자동으로 매핑해주는 기능
* 자바의 JPA나 Hibernate와 같이 객체기반으로 데이터베이스의 자동생성, CRUD*(Create, Read, Update, Delete)*를 SQL을 따로 작성할 필요 없이 개발자가 코드 내에서 함수로 호출해 줄 수있는 수있는 Persistent Framework이다.

## 사용방법
### 객체/인스턴스를 생성하는 방법
#### [save()](https://docs.djangoproject.com/en/3.2/ref/models/instances/#saving-objects)

> 
Model.save(force_insert=False, force_update=False, using=DEFAULT_DB_ALIAS, update_fields=None)<br/>
> 
-- force_insert/force_update : 강제 INSERT 또는UPDATE<br/>
> 
-- using : 사용할 데이터베이스<br/>
> 
-- update_fields : [참조](https://docs.djangoproject.com/en/3.2/ref/models/instances/#ref-models-update-fields)

* 사용방법:
```python
from app.models import {ModelName}
model = ModelName(foo='bar', key='val')
model.save()
```

#### [create()](https://docs.djangoproject.com/en/3.2/ref/models/querysets/#django.db.models.query.QuerySet.create)

> 
create(**kwargs)
>
-- **kwargs : 생성할 object의 필드 key=value

* 사용방법:
```python
p = Person.objects.create(first_name="Bruce", last_name="Springsteen")
```

### 조회하는 방법
#### [all()](https://docs.djangoproject.com/ko/3.2/ref/models/querysets/#all)

> 
all()
>
-- 현재 QuerySet의 모든 데이터의 *복사본*을 반환한다

* 사용방법:
```python
model.objects.all()
```

#### [get()](https://docs.djangoproject.com/ko/3.2/ref/models/querysets/#get)

>
get(**kwargs)
>
-- **kwargs : 찾고자 하는 object의 필터
>
-- get() 함수는 해당 조건에 부합하는 *하나의* object만 반환한다
>
-- DoesNotExist exception : 조건에 부합하는 object를 찾지 못했을 경우 던지는 예외
>
-- MultipleObjectsReturned : 조건에 부합하는 하나 이상의 objects를 찾았을 경우 던지는 예외

* 사용방법:
```python
Entry.objects.get(id=1)
Entry.objects.get(blog=blog, entry_number=1)
```

#### [filter()](https://docs.djangoproject.com/ko/3.2/ref/models/querysets/#filter)

>
filter(**kwargs)
>
-- **kwargs : 찾고자하는 object들의 필터
>
-- 위 조건에 부합하는 object들의 *QuerySet*을 반환한다
>
-- 기본적으로 필터들은 **AND** 연산자로 쿼리하며 더 복잡한 쿼리를 작성하려면(**OR** 연산자 등) [Q object
](https://docs.djangoproject.com/ko/3.2/ref/models/querysets/#django.db.models.Q)를 사용해야 한다

* 사용방법:
```python
Entry.objects.filter(pub_date__year=2006)
``` 


#### exclude()

#### 체이닝*Chaining*

#### Field lookups


### 수정하는 방법
#### save()

### 삭제하는 방법
#### delete()

## 링크
* [Django Documentation - Making queries](https://docs.djangoproject.com/en/3.2/topics/db/queries/#making-queries) 
