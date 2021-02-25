---
layout  : wiki
title   : ExtJS를 사용하며 디버깅 한 경험
summary : 
date    : 2021-02-24 16:31:38 +0900
updated : 2021-02-25 16:39:56 +0900
tag     : extjs debugging javascript 
toc     : true
public  : true
parent  : [[Javascript]] 
latex   : false
---
* TOC
{:toc}

### `store.sync()`를 했을 때 request 방식이 POST나 PUT이 아닌  DELETE로 넘어간 문제
* 해당 문제는 store를 add할 때 model 데이터가 순수하지 않을 때 발생 했다.

문제:
```javascript
// Controller
let model = Ext.create('COM.test.model'); //모델 생성
let store = this.getStore('testStore');   // 스토어로딩

model.set({foo : bar});                   // 모델 데이터 세팅
store.add(model.data);                    // 스토어에 model.data 추가

store.sync(); // --> bug : 리퀘스트가 POST가 아닌 DELETE로 넘어간다
```

해결방법:
```javascript
// Controller
let model = Ext.create('COM.test.model'); //모델 생성
let store = this.getStore('testStore');   // 스토어로딩

model.set({foo : bar});                   // 모델 데이터 세팅
store.add(model);                         // 스토어에 model 추가*

store.sync(); // --> fix : 리퀘스트가 POST로 올바르게 넘어갔다.
```

* 해당 문제는 ExtJS에서 사용되는 `store`의 자식으로 존재되는 `model`의 `crud`, `crudwas` 등의 필드가 `model.data`에는 존재 하지 않기에 `store`를 `sync` 했을 때 올바르게 동작하지 않은것으로 보인다.
