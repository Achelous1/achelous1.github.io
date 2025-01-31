---
layout  : wiki
title   :  CI/CD
summary : DevOps 엔지니어의 핵심 업무
date    : 2022-03-17 14:18:59 +0900
updated : 2022-03-17 14:18:59 +0900
tag     : devops cicd
toc     : true
public  : true
parent  : [[tech]]
latex   : false
---
* TOC
{:toc}

## CI/CD에 대하여 알아보자

### CI*Continuous Integration*란
* 정의: 지속적인 통합(*Continuous Integration*)
* 개발자들을 위한 자동화 프로세스이며, 성공적인 CI란 새로운 코드 변경사항이 정기적으로 빌드*built*되고, 테스트*tested* 되어 공용 리포지토리에 병합*merged* 되는 것을 의미한다.
* 한 앱에 대하여 너무 많은 브랜치*branch*가 생성되어 공용 리포지토리에 병합될 때 자주 충돌이 나는 것을 방지하기 위해 사용한다.

### CD*Continuous Delivery/Deployment*란
* 정의: 지속적인 서비스 제공(*Delivery*) 또는 배포(*Deployment*)

#### Continuous Delivery
* 일반적으로 어플리케이션에 대한 개발자의 변경사항들이 자동적으로 버그테스트 되어 리포지토리에(깃헙 또는 컨테이너 레지스트리에) 운영서버로 배포할 수 있는 상태로 업로드 된다는 의미이다.

#### Continuous Deployment
* 지속적인 배포는 고객이 사용할 수 있는 운영서버로의 배포에 대한 자동화를 의미한다. 너무 많은 수동적인 배포 작업에 대한 솔루션이다.

# Links
* [Red Hat - What is CI/CD?](https://www.redhat.com/en/topics/devops/what-is-ci-cd)
# 주석