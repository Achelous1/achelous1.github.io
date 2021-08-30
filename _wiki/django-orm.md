---
layout  : wiki
title   : Django ORM
summary : Django Object Relational Mapping
date    : 2021-08-24 16:39:46 +0900
updated : 2021-08-30 21:40:00 +0900
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
- When you save an object, Django performs the following steps:
>
Emit a pre-save signal. The pre_save signal is sent, allowing any functions listening for that signal to do something.
>
Preprocess the data. Each field’s pre_save() method is called to perform any automated data modification that’s needed. For example, the date/time fields override pre_save() to implement auto_now_add and auto_now.
>
Prepare the data for the database. Each field’s get_db_prep_save() method is asked to provide its current value in a data type that can be written to the database.
>
Most fields don’t require data preparation. Simple data types, such as integers and strings, are ‘ready to write’ as a Python object. However, more complex data types often require some modification.
>
For example, DateField fields use a Python datetime object to store data. Databases don’t store datetime objects, so the field value must be converted into an ISO-compliant date string for insertion into the database.
>
Insert the data into the database. The preprocessed, prepared data is composed into an SQL statement for insertion into the database.
>
Emit a post-save signal. The post_save signal is sent, allowing any functions listening for that signal to do something.



### 삭제하는 방법
#### [delete()](https://docs.djangoproject.com/en/3.2/ref/models/instances/#django.db.models.Model.delete)

>
Model.delete(using=DEFAULT_DB_ALIAS, keep_parents=False)
>
-- keep_parents : (boolean) multi-table 상속[^MULTI-TABLE] 상에서 (OneToOneField) 자식데이터만 삭제하고자 할 때 True를 넘겨주면 부모의 데이터는 삭제하지 않는다

### 고급쿼리
#### 체이닝*Chaining*

#### Field lookups

#### Aggregation

## 주석
[^MULTI-TABLE]: [참조]()" Press ? for help             |  1 ---
                               |  2 layout  : wikiindex
>----------Bookmarks---------- |  3 title   : Wiki
                               |  4 toc     : true
.. (up a dir)                  |  5 public  : true
</achelous1.github.io/_wiki/   |  6 comment : false
  1000.md                      |  7 regenerate: true
  1001.md                      |  8 ---
  10171.md                     |  9
  10172.md                     | 10 ## </dev>
  10718.md                     | 11 * [[programming]]
  2557.md                      | 12 * [[tech]]
/3.2/ref/models/querysets/#exclude)
  github-action.md             |105
  github.md                    |106 >
  google-java-style-guide.md   |107 exclude(**kwargs)
  importance-in-studying.md    |108 >
  index.md                     |109 -- **kwargs : 찾아올 데이터 중 제외하고 싶은 object들의 조건
  janssen-vaccine-review.md    |110 >
  Javascript.md                |111 -- SQL의 NOT 키워드와 같다
  law-of-jante.md              |112 >
  life-cheatsheet.md           |113 -- 기본적으로 필터들은 **AND** 연산자로 묶인다
  life-guide.md                |114
  life-log.md                  |115 * 사용방법:
  mathematics.md               |116     *
  news-2021.md                 |117
  nomad-coders-translation.md  |118 #### 체이닝*Chaining*
  programming.md               |119
  python.md                    |120 #### Field lookups
  solid-principle.md           |121
  sql-7-do-nots.md             |122
  stack-heap-memory.md         |123 ### 수정하는 방법
  tech.md                      |124 #### save()
  typeof-instanceof.md         |125
  United-Resume.md             |126 ### 삭제하는 방법
  useful-cmd-commands.md       |127 #### delete()
<pbox/achelous1.github.io/_wiki django-orm.md [+]                                                                                                                        <lang>
.. (up a dir)                  | 81 Entry.objects.get(id=1)
</achelous1.github.io/_wiki/   | 82 Entry.objects.get(blog=blog, entry_number=1)
  1000.md                      | 83 ```
  1001.md                      | 84
  10171.md                     | 85 #### [filter()](https://docs.djangoproject.com/ko/
  10172.md                     |    3.2/ref/models/querysets/#filter)
  10718.md                     | 86
  2557.md                      | 87 >
  42-rules-of-life.md          | 88 filter(**kwargs)
  abstract-factory-pattern.md  | 89 >
  AWS.md                       | 90 -- **kwargs : 찾고자하는 object들의 필터
  baekjun-level-1.md           | 91 >
  baekjun.md                   | 92 -- 위 조건에 부합하는 object들의 *QuerySet*을 반환
  Big-O-Notation.md            |    한다
  blog-testing-method.md       | 93 >
  books-2021.md                | 94 -- 기본적으로 필터들은 **AND** 연산자로 묶여지며 >
  calculate-datetime-bw-2-days.|    더 복잡한 쿼리를 작성하려면(**OR** 연산자 등) [Q o
  clean-code.md                |    bject
  diary-2020.md                | 95 ](https://docs.djangoproject.com/ko/3.2/ref/models
  diary-2021.md                |    /querysets/#django.db.models.Q)를 사용해야 한다
  django-orm.md                | 96
  django.md                    | 97 * 사용방법:
  exponentiation.md            | 98 ```python
  Extjs-issues.md              | 99 A
  github-action.md             |100 Entry.objects.filter(pub_date__year=2006)
  github.md                    |101 ```
  google-java-style-guide.md   |102
  importance-in-studying.md    |103
  index.md                     |104 #### [exclude()](https://docs.djangoproject.com/ko
  janssen-vaccine-review.md    |    /3.2/ref/models/querysets/#exclude)
  Javascript.md                |105
  law-of-jante.md              |106 >
  life-cheatsheet.md           |107 exclude(**kwargs)
  life-guide.md                |108 >
  life-log.md                  |109 -- **kwargs : 찾아올 데이터 중 제외하고 싶은 objec
  mathematics.md               |    t들의 조건
  news-2021.md                 |110 >
  nomad-coders-translation.md  |111 -- SQL의 NOT 키워드와 같다
  programming.md               |112 >
  python.md                    |113 -- 기본적으로 필터들은 **AND** 연산자로 묶인다
  solid-principle.md           |114
  sql-7-do-nots.md             |115 * 사용방법:
  stack-heap-memory.md         |116     *
  tech.md                      |117
  typeof-instanceof.md         |118 #### 체이닝*Chaining*
  United-Resume.md             |119
  useful-cmd-commands.md       |120 #### Field lookups
<pbox/achelous1.github.io/_wiki django-orm.md [+]                              <lang>
</achelous1.github.io/_wiki/   | 82 Entry.objects.get(blog=blog, entry_number=1)
  1000.md                      | 83 ```
  1001.md                      | 84
  10171.md                     | 85 #### [filter()](https://docs.djangoproject.com/ko/
  10172.md                     |    3.2/ref/models/querysets/#filter)
  10718.md                     | 86
  2557.md                      | 87 >
  42-rules-of-life.md          | 88 filter(**kwargs)
  abstract-factory-pattern.md  | 89 >
  AWS.md                       | 90 -- **kwargs : 찾고자하는 object들의 필터
  baekjun-level-1.md           | 91 >
  baekjun.md                   | 92 -- 위 조건에 부합하는 object들의 *QuerySet*을 반환
  Big-O-Notation.md            |    한다
  blog-testing-method.md       | 93 >
  books-2021.md                | 94 -- 기본적으로 필터들은 **AND** 연산자로 묶여지며 >
  calculate-datetime-bw-2-days.|    더 복잡한 쿼리를 작성하려면(**OR** 연산자 등) [Q o
  clean-code.md                |    bject
  diary-2020.md                | 95 ](https://docs.djangoproject.com/ko/3.2/ref/models
  diary-2021.md                |    /querysets/#django.db.models.Q)를 사용해야 한다
  django-orm.md                | 96
  django.md                    | 97 * 사용방법:
  exponentiation.md            | 98 ```python
  Extjs-issues.md              | 99 A
  github-action.md             |100 Entry.objects.filter(pub_date__year=2006)
  github.md                    |101 ```
  google-java-style-guide.md   |102
  importance-in-studying.md    |103
  index.md                     |104 #### [exclude()](https://docs.djangoproject.com/ko
  janssen-vaccine-review.md    |    /3.2/ref/models/querysets/#exclude)
  Javascript.md                |105
  law-of-jante.md              |106 >
  life-cheatsheet.md           |107 exclude(**kwargs)
  life-guide.md                |108 >
  life-log.md                  |109 -- **kwargs : 찾아올 데이터 중 제외하고 싶은 objec
  mathematics.md               |    t들의 조건
  news-2021.md                 |110 >
  nomad-coders-translation.md  |111 -- SQL의 NOT 키워드와 같다
  programming.md               |112 >
  python.md                    |113 -- 기본적으로 필터들은 **AND** 연산자로 묶인다
  solid-principle.md           |114
  sql-7-do-nots.md             |115 * 사용방법:
  stack-heap-memory.md         |116     *
  tech.md                      |117
  typeof-instanceof.md         |118 #### 체이닝*Chaining*
  United-Resume.md             |119
  useful-cmd-commands.md       |120 #### Field lookups
<pbox/achelous1.github.io/_wiki django-orm.md [+]                              <lang>
.. (up a dir)                  | 81 Entry.objects.get(id=1)
</achelous1.github.io/_wiki/   | 82 Entry.objects.get(blog=blog, entry_number=1)
  1000.md                      | 83 ```
  1001.md                      | 84
  10171.md                     | 85 #### [filter()](https://docs.djangoproject.com/ko/
  10172.md                     |    3.2/ref/models/querysets/#filter)
  10718.md                     | 86
  2557.md                      | 87 >
  42-rules-of-life.md          | 88 filter(**kwargs)
  abstract-factory-pattern.md  | 89 >
  AWS.md                       | 90 -- **kwargs : 찾고자하는 object들의 필터
  baekjun-level-1.md           | 91 >
  baekjun.md                   | 92 -- 위 조건에 부합하는 object들의 *QuerySet*을 반환
  Big-O-Notation.md            |    한다
  blog-testing-method.md       | 93 >
  books-2021.md                | 94 -- 기본적으로 필터들은 **AND** 연산자로 묶여지며 >
  calculate-datetime-bw-2-days.|    더 복잡한 쿼리를 작성하려면(**OR** 연산자 등) [Q o
  clean-code.md                |    bject
  diary-2020.md                | 95 ](https://docs.djangoproject.com/ko/3.2/ref/models
  diary-2021.md                |    /querysets/#django.db.models.Q)를 사용해야 한다
  django-orm.md                | 96
  django.md                    | 97 * 사용방법:
  exponentiation.md            | 98 ```python
  Extjs-issues.md              | 99 A
  github-action.md             |100 Entry.objects.filter(pub_date__year=2006)
  github.md                    |101 ```
  google-java-style-guide.md   |102
  importance-in-studying.md    |103
  index.md                     |104 #### [exclude()](https://docs.djangoproject.com/ko
  janssen-vaccine-review.md    |    /3.2/ref/models/querysets/#exclude)
  Javascript.md                |105
  law-of-jante.md              |106 >
  life-cheatsheet.md           |107 exclude(**kwargs)
  life-guide.md                |108 >
  life-log.md                  |109 -- **kwargs : 찾아올 데이터 중 제외하고 싶은 objec
  mathematics.md               |    t들의 조건
  news-2021.md                 |110 >
  nomad-coders-translation.md  |111 -- SQL의 NOT 키워드와 같다
  programming.md               |112 >
  python.md                    |113 -- 기본적으로 필터들은 **AND** 연산자로 묶인다
  solid-principle.md           |114
  sql-7-do-nots.md             |115 * 사용방법:
  stack-heap-memory.md         |116     *
  tech.md                      |117
  typeof-instanceof.md         |118 #### 체이닝*Chaining*
  United-Resume.md             |119
  useful-cmd-commands.md       |120 #### Field lookups
<pbox/achelous1.github.io/_wiki django-orm.md [+]                              <lang>
  42-rules-of-life.md          | 13 * [[Useful-sites]]
  books-2021.md                |125 ### 수정하는 방법
  calculate-datetime-bw-2-days.|126 #### save()
  clean-code.md                |127 * 기본적으로 생성할 때의 save()와 비슷하며 다른점은 생성할 때엔 해당 object에 id가 미존재.
  diary-2020.md                |128 * 변경하고 싶은 필드의 값을 먼저 변경한 뒤 save()를 호출한다
  diary-2021.md                |129
  django-orm.md                |130 * 사용방법:
  django.md                    |131     *
  exponentiation.md            |132
  Extjs-issues.md              |133 #### 읽어 볼 만한 주제
  github-action.md             |134 * save() 함수를 호출하면 어떻게 되는가?
  github.md                    |135 >
  google-java-style-guide.md   |136 What happens when you save?
  importance-in-studying.md    |137 When you save an object, Django performs the following steps:
  index.md                     |138
  janssen-vaccine-review.md    |139 Emit a pre-save signal. The pre_save signal is sent, allowing any functions listening for that signal to do something.
  Javascript.md                |140
  law-of-jante.md              |141 Preprocess the data. Each field’s pre_save() method is called to perform any automated data modification that’s needed. For example, the dat
  life-cheatsheet.md           |    e/time fields override pre_save() to implement auto_now_add and auto_now.
  life-guide.md                |142
  life-log.md                  |143 Prepare the data for the database. Each field’s get_db_prep_save() method is asked to provide its current value in a data type that can be w
  mathematics.md               |    ritten to the database.
  news-2021.md                 |144
  nomad-coders-translation.md  |145 Most fields don’t require data preparation. Simple data types, such as integers and strings, are ‘ready to write’ as a Python object. Howeve
  programming.md               |    r, more complex data types often require some modification.
  python.md                    |146
  solid-principle.md           |147 For example, DateField fields use a Python datetime object to store data. Databases don’t store datetime objects, so the field value must be
  sql-7-do-nots.md             |     converted into an ISO-compliant date string for insertion into the database.
  stack-heap-memory.md         |148
<pbox/achelous1.github.io/_wiki django-orm.md [+]                                                                                                                        <lang>
" Press ? for help             |106 >
                               |107 exclude(**kwargs)
>----------Bookmarks---------- |108 >
                               |109 -- **kwargs : 찾아올 데이터 중 제외하고 싶은 objec
.. (up a dir)                  |    t들의 조건
</achelous1.github.io/_wiki/   |110 >
  1000.md                      |111 -- SQL의 NOT 키워드와 같다
  1001.md                      |112 >
  10171.md                     |113 -- 기본적으로 필터들은 **AND** 연산자로 묶여지며 >
  10172.md                     |    더 복잡한 쿼리를 작성하려면(**OR** 연산자 등) [Q o
  10718.md                     |    bject
  2557.md                      |114 ](https://docs.djangoproject.com/ko/3.2/ref/models
  42-rules-of-life.md          |    /querysets/#django.db.models.Q)를 사용해야 한다
  abstract-factory-pattern.md  |115
  AWS.md                       |116 * 사용방법:
  baekjun-level-1.md           |117 ```python
  baekjun.md                   |118 # 예제 1
  Big-O-Notation.md            |119 Entry.objects.exclude(pub_date__gt=datetime.date(2
  blog-testing-method.md       |    005, 1, 3), headline='Hello')
  books-2021.md                |120
  calculate-datetime-bw-2-days.|121 # 예제 2
  clean-code.md                |122 Entry.objects.exclude(pub_date__gt=datetime.date(2
  diary-2020.md                |    005, 1, 3)).exclude(headline='Hello')
  diary-2021.md                |123 ```
  django-orm.md                |124
  django.md                    |125 ### 수정하는 방법
  exponentiation.md            |126 #### save()
  Extjs-issues.md              |127 * 기본적으로 생성할 때의 save()와 비슷하며 다른점>
  github-action.md             |    은 생성할 때엔 해당 object에 id가 미존재.
  github.md                    |128 * 변경하고 싶은 필드의 값을 먼저 변경한 뒤 save()>
  google-java-style-guide.md   |    를 호출한다
  importance-in-studying.md    |129
  index.md                     |130 * 사용방법:
  janssen-vaccine-review.md    |131     *
  Javascript.md                |132
  law-of-jante.md              |133 #### 읽어 볼 만한 주제
  life-cheatsheet.md           |134 * save() 함수를 호출하면 어떻게 되는가?
  life-guide.md                |135 >
  life-log.md                  |136 What happens when you save?
  mathematics.md               |137 When you save an object, Django performs the follo
  news-2021.md                 |    wing steps:
  nomad-coders-translation.md  |138
  programming.md               |139 Emit a pre-save signal. The pre_save signal is sen
  python.md                    |    t, allowing any functions listening for that signa
  solid-principle.md           |    l to do something.
  sql-7-do-nots.md             |140
  stack-heap-memory.md         |    @
<pbox/achelous1.github.io/_wiki django-orm.md [+]                              <lang>
</achelous1.github.io/_wiki/   |107 exclude(**kwargs)
  1000.md                      |108 >
  1001.md                      |109 -- **kwargs : 찾아올 데이터 중 제외하고 싶은 objec
  10171.md                     |    t들의 조건
  10172.md                     |110 >
  10718.md                     |111 -- SQL의 NOT 키워드와 같다
  2557.md                      |112 >
  42-rules-of-life.md          |113 -- 기본적으로 필터들은 **AND** 연산자로 묶여지며 >
  abstract-factory-pattern.md  |    더 복잡한 쿼리를 작성하려면(**OR** 연산자 등) [Q o
  AWS.md                       |    bject
  baekjun-level-1.md           |114 ](https://docs.djangoproject.com/ko/3.2/ref/models
  baekjun.md                   |    /querysets/#django.db.models.Q)를 사용해야 한다
  Big-O-Notation.md            |115
  blog-testing-method.md       |116 * 사용방법:
  books-2021.md                |117 ```python
  calculate-datetime-bw-2-days.|118 # 예제 1
  clean-code.md                |119 Entry.objects.exclude(pub_date__gt=datetime.date(2
  diary-2020.md                |    005, 1, 3), headline='Hello')
  diary-2021.md                |120
  django-orm.md                |121 # 예제 2
  django.md                    |122 Entry.objects.exclude(pub_date__gt=datetime.date(2
  exponentiation.md            |    005, 1, 3)).exclude(headline='Hello')
  Extjs-issues.md              |123 ```
  github-action.md             |124
  github.md                    |125 ### 수정하는 방법
  google-java-style-guide.md   |126 #### save()
  importance-in-studying.md    |127 * 기본적으로 생성할 때의 save()와 비슷하며 다른점>
  index.md                     |    은 생성할 때엔 해당 object에 id가 미존재.
  janssen-vaccine-review.md    |128 * 변경하고 싶은 필드의 값을 먼저 변경한 뒤 save()>
  Javascript.md                |    를 호출한다
  law-of-jante.md              |129
  life-cheatsheet.md           |130 * 사용방법:
  life-guide.md                |131     *
  life-log.md                  |132
  mathematics.md               |133 #### 읽어 볼 만한 주제
  news-2021.md                 |134 * save() 함수를 호출하면 어떻게 되는가?
  nomad-coders-translation.md  |135 >
  programming.md               |136 What happens when you save?
  python.md                    |137 When you save an object, Django performs the follo
  solid-principle.md           |    wing steps:
  sql-7-do-nots.md             |138
  stack-heap-memory.md         |139 Emit a pre-save signal. The pre_save signal is sen
  tech.md                      |    t, allowing any functions listening for that signa
  typeof-instanceof.md         |    l to do something.
  United-Resume.md             |140
  useful-cmd-commands.md       |    @
<pbox/achelous1.github.io/_wiki django-orm.md [+]                              <lang>
</achelous1.github.io/_wiki/   |106 >
  1000.md                      |107 exclude(**kwargs)
  1001.md                      |108 >
  10171.md                     |109 -- **kwargs : 찾아올 데이터 중 제외하고 싶은 objec
  10172.md                     |    t들의 조건
  10718.md                     |110 >
  2557.md                      |111 -- SQL의 NOT 키워드와 같다
  42-rules-of-life.md          |112 >
  abstract-factory-pattern.md  |113 -- 기본적으로 필터들은 **AND** 연산자로 묶여지며 >
  AWS.md                       |    더 복잡한 쿼리를 작성하려면(**OR** 연산자 등) [Q o
  baekjun-level-1.md           |    bject
  baekjun.md                   |114 ](https://docs.djangoproject.com/ko/3.2/ref/models
  Big-O-Notation.md            |    /querysets/#django.db.models.Q)를 사용해야 한다
  blog-testing-method.md       |115
  books-2021.md                |116 * 사용방법:
  calculate-datetime-bw-2-days.|117 ```python
  clean-code.md                |118 # 예제 1
  diary-2020.md                |119 Entry.objects.exclude(pub_date__gt=datetime.date(2
  diary-2021.md                |    005, 1, 3), headline='Hello')
  django-orm.md                |120
  django.md                    |121 # 예제 2
  exponentiation.md            |122 Entry.objects.exclude(pub_date__gt=datetime.date(2
  Extjs-issues.md              |    005, 1, 3)).exclude(headline='Hello')
  github-action.md             |123 ```
  github.md                    |124
  google-java-style-guide.md   |125 ### 수정하는 방법
  importance-in-studying.md    |126 #### save()
  index.md                     |127 * 기본적으로 생성할 때의 save()와 비슷하며 다른점>
  janssen-vaccine-review.md    |    은 생성할 때엔 해당 object에 id가 미존재.
  Javascript.md                |128 * 변경하고 싶은 필드의 값을 먼저 변경한 뒤 save()>
  law-of-jante.md              |    를 호출한다
  life-cheatsheet.md           |129
  life-guide.md                |130 * 사용방법:
  life-log.md                  |131     *
  mathematics.md               |132
  news-2021.md                 |133 #### 읽어 볼 만한 주제
  nomad-coders-translation.md  |134 * save() 함수를 호출하면 어떻게 되는가?
  programming.md               |135 >
  python.md                    |136 What happens when you save?
  solid-principle.md           |137 When you save an object, Django performs the follo
  sql-7-do-nots.md             |    wing steps:
  stack-heap-memory.md         |138
  tech.md                      |139 Emit a pre-save signal. The pre_save signal is sen
  typeof-instanceof.md         |    t, allowing any functions listening for that signa
  United-Resume.md             |    l to do something.
  useful-cmd-commands.md       |140
  Useful-sites.md              |    @
<pbox/achelous1.github.io/_wiki django-orm.md [+]                              <lang>
</achelous1.github.io/_wiki/   |  3 title   : Django ORM
  1000.md                      |  4 summary : Django Object Relational Mapping
</achelous1.github.io/_wiki/   |140
  1000.md                      |141 #### 읽어 볼 만한 주제
  1001.md                      |142 * save() 함수를 호출하면 어떻게 되는가?
  10171.md                     |143 >
  10172.md                     |144 **What happens when you save?**
  10718.md                     |145 - When you save an object, Django performs the following steps:
  2557.md                      |146 >
  42-rules-of-life.md          |147 Emit a pre-save signal. The pre_save signal is sent, allowing any functions listening for that signal to do something.
  abstract-factory-pattern.md  |148 >
  AWS.md                       |149 Preprocess the data. Each field’s pre_save() method is called to perform any automated data modification that’s needed. For example, the dat
  baekjun-level-1.md           |    e/time fields override pre_save() to implement auto_now_add and auto_now.
  baekjun.md                   |150 >
  Big-O-Notation.md            |151 Prepare the data for the database. Each field’s get_db_prep_save() method is asked to provide its current value in a data type that can be w
  blog-testing-method.md       |    ritten to the database.
  books-2021.md                |152 >
  calculate-datetime-bw-2-days.|153 Most fields don’t require data preparation. Simple data types, such as integers and strings, are ‘ready to write’ as a Python object. Howeve
  clean-code.md                |    r, more complex data types often require some modification.
  diary-2020.md                |154 >
  diary-2021.md                |155 For example, DateField fields use a Python datetime object to store data. Databases don’t store datetime objects, so the field value must be
  django-orm.md                |     converted into an ISO-compliant date string for insertion into the database.
  django.md                    |156 >
  exponentiation.md            |157 Insert the data into the database. The preprocessed, prepared data is composed into an SQL statement for insertion into the database.
  Extjs-issues.md              |158 >
  github-action.md             |159 Emit a post-save signal. The post_save signal is sent, allowing any functions listening for that signal to do something.
  github.md                    |160
  google-java-style-guide.md   |161
  importance-in-studying.md    |162
  index.md                     |163 ### 삭제하는 방법
  janssen-vaccine-review.md    |164 #### [delete()](https://docs.djangoproject.com/en/3.2/ref/models/instances/#django.db.models.Model.delete)
  Javascript.md                |165
  law-of-jante.md              |166 >
  life-cheatsheet.md           |167 Model.delete(using=DEFAULT_DB_ALIAS, keep_parents=False)
  life-guide.md                |168 >
  life-log.md                  |169 -- keep_parents : (boolean) multi-table 상속 상에서 (OneToOneField) 자식데이터만 삭제하고자 할 때 True를 넘겨주면 부모의 데이터는 삭제하지 >
  mathematics.md               |    않는다
  news-2021.md                 |170
  nomad-coders-translation.md  |171 ### 고급쿼리
  programming.md               |172 #### 체이닝*Chaining*
  python.md                    |173
  solid-principle.md           |174 #### Field lookups
  sql-7-do-nots.md             |175
  stack-heap-memory.md         |176 #### Aggregation
  tech.md                      |177
  typeof-instanceof.md         |178
  United-Resume.md             |179 ## 링크
  useful-cmd-commands.md       |180 * [Django Documentation - Making queries](https://docs.djangoproject.com/en/3.2/topics/db/queries/#making-queries)
  Useful-sites.md              |181 * [QuerySet API reference](https://docs.djangoproject.com/ko/3.2/ref/models/querysets/)
<pbox/achelous1.github.io/_wiki django-orm.md                                                                                                                            <lang>


## 링크
* [Django Documentation - Making queries](https://docs.djangoproject.com/en/3.2/topics/db/queries/#making-queries) 
* [QuerySet API reference](https://docs.djangoproject.com/ko/3.2/ref/models/querysets/)
