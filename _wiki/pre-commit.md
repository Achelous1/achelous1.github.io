---
layout: wiki
title: 
summary: 
date: 2025-01-31 10:00:17 +0900
updated: 2025-01-31 10:01:03 +0900
tags: 
toc: true
public: true
parent: programming
latex: false
mermaid: false
updated : 2025-01-31 10:06:02 +0900
---
* TOC
{:toc}

# 1. 개요

[pre-commit](https://pre-commit.com/index.html "https://pre-commit.com/index.html")은 `multi-language pre-commit hook 관리 프레임워크`입니다. Git에 커밋을 하기 전, 필요한 행위들을 워크플로우로 정의해두고 커밋을 하기 전 단계인 pre-commit 단계에서 해당 워크플로우를 실행해주어, 개발자가 놓치기 쉬운 부분들(linting, formatting, import optimization)을 자동화하여 해결해줍니다.

## 특징

- 많고 많은 hooks 플러그인
    
- 활발한 써드파티
    
- 스크립트를 따로 작성할 필요 없이 제공되는 플러그인들을 설정파일에 정의하고 바로 실행 가능
    
    - 명령에 사용할 인수 설정 가능
        
    - 제외할 폴더들 명시 가능
        
- hook을 제공하지 않더라도 command line을 실행 할 수 있게 설정 가능 함
    
- multi-language support
    
    Open 스크린샷 2023-03-27 오후 2.11.04.png
    
    ![](blob:https://neubility.atlassian.net/29aef855-4823-4856-b793-8fe58b718adc#media-blob-url=true&id=3bab2150-e47b-4d36-9b90-b4fbab6a9ba1&collection=contentId-359039716&contextId=359039716&width=328&height=543&alt=)
    
- 10k가 넘는 ![star](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/32x32/2b50.png) (WOW)
    

# 2. 설치

**pip을 사용**

`$ pip install pre-commit`

**brew 사용**

`$ brew install pre-commit`

**pre-commit 설정파일 추가**

- [pre-commit 제공 hooks 리스트](https://pre-commit.com/hooks.html "https://pre-commit.com/hooks.html")
    
- [hook 설정 방법](https://pre-commit.com/index.html#pre-commit-configyaml---repos "https://pre-commit.com/index.html#pre-commit-configyaml---repos")
    

`$ pre-commit sample-config > .pre-commit-config.yaml`

- _기본적으로 생성해둔 .pre-commit-config.yaml 파일이 있기에 위 명령어는 참고만 해주시면 될 것 같습니다._
    

**pre-commit 설치**

`$ pre-commit install`

**pre-commit이 아닌 다른 git훅에서 실행을 원할 시,**

`$ pre-commit install --hook-type post-commit`

**pre-commit 삭제**

`$ pre-commit uninstall`

# 3. 실행

기본적으로 `pre-commit` 단계에서 `.pre-commit-config.yaml`에서 설정한 hook들을 스테이징에 올라간 파일들을 대상으로 순차적으로 실행하게 되어있습니다.

또한, 전체 파일에 대하여 pre-commit 워크플로우를 cli로 실행하는 것 또한 가능합니다.

**전체 실행**

`$ pre-commit run --all-files`

**특정 hook만 실행**

`$ pre-commit run <hook_id>`

**커밋 시 특정 hook을 제외하고 실행**

`$ SKIP=<hook_id> git commit -m "foo"`

**커밋 시 pre-commit을 무시하고 실행(not recommended)**

`$ PRE_COMMIT_ALLOW_NO_CONFIG=1 git commit -m "foo"`

**수동으로 실행할 (stage가 manual인) hook 실행(staging에 추가된 파일에 대해서 실행)**

`$ pre-commit run --hook-stage manual [hookid]`

# 4. IntelliJ File Watchers 플러그인 기능을 통한 저장 시 실행 환경 구축

1. Settings → Plugins → MarketPlace → `File Watchers` 검색 및 설치
    
    1. 재시작 요망
        
![[Pre-commit Workflow Management.png]]

File Watcher 플러그인 설치

2. Settings → Tools → File Watchers → **+** 버튼 클릭 → <custom> 선택

![[Pre-commit Workflow Management (1).png]]

3. 다음과 같이 셋팅한다.

- 다른 훅 실행시, Arguments 항목에 `run <hook_id> --files $FilePath$`
    
![[Pre-commit Workflow Management (2).png]]


# Links

- [pre-commit](https://pre-commit.com/)

- [pre-commit 활용하기](https://litaro.tistory.com/entry/pre-commit-%ED%99%9C%EC%9A%A9%ED%95%98%EA%B8%B0)
