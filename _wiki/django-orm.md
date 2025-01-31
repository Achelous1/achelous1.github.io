---
layout  : wiki
title   : Django ORM
summary : Django Object Relational Mapping
date    : 2021-08-24 16:39:46 +0900
updated : 2021-09-06 10:28:50 +0900
tag     : django orm django-orm python
toc     : true
public  : true
parent  : [[django]]
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
Model.save(force_insert=False, force_update=False, using=DEFAULT_DB_ALIAS, update_fields=None)
> 
-- force_insert/force_update : 강제 INSERT 또는UPDATE
> 
-- using : 사용할 데이터베이스
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
-- 기본적으로 필터들은 **AND** 연산자로 묶여지며 더 복잡한 쿼리를 작성하려면(**OR** 연산자 등) [Q object
](https://docs.djangoproject.com/ko/3.2/ref/models/querysets/#django.db.models.Q)를 사용해야 한다

* 사용방법:
```python
Entry.objects.filter(pub_date__year=2006)
``` 


#### [exclude()](https://docs.djangoproject.com/ko/3.2/ref/models/querysets/#exclude)

>
exclude(**kwargs)
>
-- **kwargs : 찾아올 데이터 중 제외하고 싶은 object들의 조건
>
-- SQL의 NOT 키워드와 같다
>
-- 기본적으로 필터들은 **AND** 연산자로 묶여지며 더 복잡한 쿼리를 작성하려면(**OR** 연산자 등) [Q object
](https://docs.djangoproject.com/ko/3.2/ref/models/querysets/#django.db.models.Q)를 사용해야 한다

* 사용방법: 
  
```python
# 예제 1
Entry.objects.exclude(pub_date__gt=datetime.date(2005, 1, 3), headline='Hello')

# 예제 2
Entry.objects.exclude(pub_date__gt=datetime.date(2005, 1, 3)).exclude(headline='Hello')
```

### 수정하는 방법
#### save()
* 기본적으로 생성할 때의 save()와 비슷하며 다른점은 생성할 때엔 해당 object에 id가 미존재.
* 변경하고 싶은 필드의 값을 먼저 변경한 뒤 save()를 호출한다

* 사용방법: 
  
```python
model.foo = bar
model.save()

# 또는
model = Class(id=1, foo=bar)
model.save()
```

#### 읽어 볼 만한 주제
* save() 함수를 호출하면 어떻게 되는가?
>
**What happens when you save?**
>
-- When you save an object, Django performs the following steps:
>
1. Emit a pre-save signal. The pre_save signal is sent, allowing any functions listening for that signal to do something.
>
2. Preprocess the data. Each field’s pre_save() method is called to perform any automated data modification that’s needed. For example, the date/time fields override pre_save() to implement auto_now_add and auto_now.
>
3. Prepare the data for the database. Each field’s get_db_prep_save() method is asked to provide its current value in a data type that can be written to the database.
>
-- Most fields don’t require data preparation. Simple data types, such as integers and strings, are ‘ready to write’ as a Python object. However, more complex data types often require some modification.
>
-- For example, DateField fields use a Python datetime object to store data. Databases don’t store datetime objects, so the field value must be converted into an ISO-compliant date string for insertion into the database.
>
4. Insert the data into the database. The preprocessed, prepared data is composed into an SQL statement for insertion into the database.
>
5. Emit a post-save signal. The post_save signal is sent, allowing any functions listening for that signal to do something.



### 삭제하는 방법
#### [delete()](https://docs.djangoproject.com/en/3.2/ref/models/instances/#django.db.models.Model.delete)

>
Model.delete(using=DEFAULT_DB_ALIAS, keep_parents=False)
>
-- keep_parents : (boolean) multi-table 상속[^MULTI-TABLE] 상에서 (OneToOneField) 자식데이터만 삭제하고자 할 때 True를 넘겨주면 부모의 데이터는 삭제하지 않는다

### 고급쿼리
#### [체이닝*Chaining*](https://docs.djangoproject.com/en/3.2/topics/db/queries/#chaining-filters)

#### [Field lookups](https://docs.djangoproject.com/en/3.2/ref/models/querysets/#field-lookups)

#### [Aggregation](https://docs.djangoproject.com/en/3.2/ref/models/querysets/#aggregation-functions)

## 링크
* [Django Documentation - Making queries](https://docs.djangoproject.com/en/3.2/topics/db/queries/#making-queries) 
* [QuerySet API reference](https://docs.djangoproject.com/ko/3.2/ref/models/querysets/)

## 주석
[^MULTI-TABLE]: Multi-table inheritance <https://docs.djangoproject.com/en/3.2/topics/db/models/#multi-table-inheritance>
