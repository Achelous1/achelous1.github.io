---
layout  : wiki
title   : ExtJS를 사용하며 디버깅 한 경험
summary : 
date    : 2021-02-24 16:31:38 +0900
updated : 2021-05-25 09:13:06 +0900
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

### SenchaCMD에서 `sencha app build classic`을 했을 때 빌드가 되지 않았던 문제
* 문제 : 기존 `sencha app build modern`으로 빌드 된 어플리케이션을 `sencha app build classic`으로 재빌드 할 경우 생긴 문제.
    * 로그 :
    ```log
   C:\Users\{user}\bin\Sencha\Cmd\6.5.2.15\ant\build\app\js-impl.xml:186: com.sencha.exceptions.BasicException: Java heap space
     at com.sencha.ant.AntScript.execute(AntScript.java:121)
     at com.sencha.command.plugin.PluginManager.execute(PluginManager.java:104)
     at com.sencha.command.plugin.PluginManager.executeReverseFirst(PluginManager.java:145)
     at com.sencha.command.environment.BuildEnvironment.execute(BuildEnvironment.java:308)
     at com.sencha.command.environment.AppOrPackageEnvironment.execute(AppOrPackageEnvironment.java:729)
     at com.sencha.command.BasePluginCommands$BasePluginCommand.doExecute(BasePluginCommands.java:125)
     at com.sencha.command.app.AppCommands$BuildCommand.execute(AppCommands.java:470)
     at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
     at sun.reflect.NativeMethodAccessorImpl.invoke(Unknown Source)
     at sun.reflect.DelegatingMethodAccessorImpl.invoke(Unknown Source)
     at java.lang.reflect.Method.invoke(Unknown Source)
     at com.sencha.util.MethodInvoker$Arguments.invoke(MethodInvoker.java:175)
     at com.sencha.cli.Command.dispatch(Command.java:43)
     at com.sencha.command.BasePluginCommands$BasePluginCommand.dispatch(BasePluginCommands.java:289)
     at com.sencha.cli.Commands.dispatch(Commands.java:64)
     at com.sencha.cli.Commands.dispatch(Commands.java:64)
     at com.sencha.command.Sencha.dispatch(Sencha.java:80)
     at com.sencha.command.Sencha.main(Sencha.java:147)
     at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
     at sun.reflect.NativeMethodAccessorImpl.invoke(Unknown Source)
     at sun.reflect.DelegatingMethodAccessorImpl.invoke(Unknown Source)
     at java.lang.reflect.Method.invoke(Unknown Source)
     at com.exe4j.runtime.LauncherEngine.launch(LauncherEngine.java:65)
     at com.exe4j.runtime.WinLauncher.main(WinLauncher.java:101)
     at com.install4j.runtime.launcher.WinLauncher.main(WinLauncher.java:26) 
    ```
  
* 해결방안 :
    1. Ext.Toast 클래스를 -> Ext.Window.Toast로 변경하여 빌드 -실패하였지만 필요하다. Ext.Toast 클래스는 modern 또는 mobile web 환경을 위한 클래스이며 Ext.Window.Toast는 일반 데스크톱 웹환경에 필요하다)
    2. sencha.cfg 파일의 jvm 힙스페이스를 확장(다음 세팅 추가 또는 변경) - 실패
       ```
       cmd.jvm.args=-Xms128m -Xmx2048m -Dapple.awt.UIElement=true
       ```
    3. 빌드환경을 production이 아닌 development 환경으로 빌드함 - 성공하였음. production과 development환경의 변수세팅이 달라 오류가 생긴것으로 보임.

### `c is not a constructor`에러
* 문제 : 해당 에러는 ExtJS에서 사용 한 특정 클래스가 `requires`필드에 없어서 생기는 이슈이다
* 해결방안 : 
  1. `requires` 필드에 필요한 클래스를 load해주자
