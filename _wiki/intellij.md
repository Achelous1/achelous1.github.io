---
layout  : wiki
title   : IntelliJ를 사용하며 
summary : 
date    : 2023-04-28 09:15:46 +0900
updated : 2023-04-28 09:23:33 +0900
tag     : ide intellij
toc     : true
public  : true
parent  : [[programming]]
latex   : false
mermaid : false
---
* TOC
{:toc}

# IntelliJ에서 Python Django 설정할 때 장고 모듈을 못찾는 경우
* 파이썬을 IntelliJ에서 사용하려면 해당 프로젝트가 파이썬 모듈임을 프로젝트 idea 파일에 설정해주어야 한다.
* **방법**:
	1. .idea/{project_name}.iml 파일을 연다
	2. 최상위 `<module>`태그의 type을 `type="PYTHON_MODULE"`로 변경해준다
	3. `파일` -> `프로젝트 구조`를 클릭하여 연다 (이 과정에서 IntelliJ가 크래시 날 수 있음)
		1. 만약 크래시되었다면 IntelliJ를 재시작 한다.
	4. `모듈`탭에 들어가 프로젝트에 장고 모듈을 추가한다
	5. 완료

# Links

# 주석