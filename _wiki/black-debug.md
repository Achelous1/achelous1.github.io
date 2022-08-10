---
layout  : wiki
title   : Black Linter 에러를 해결한 경험
summary : 
date    : 2022-08-10 15:41:25 +0900
updated : 2022-08-10 15:58:08 +0900
tag     : black linter
toc     : true
public  : true
parent  : [[python]]
latex   : false
---
* TOC
{:toc}

# ImportError: cannot import name '_unicodefun' from 'click'  에러

* 에러로그

```python
Traceback (most recent call last):
  File "/Users/{user}/.virtualenvs/{venv}/bin/blackd", line 8, in <module>
    sys.exit(patched_main())
  File "/Users/{user}/.virtualenvs/{venv}/lib/python3.9/site-packages/blackd/__init__.py", line 205, in patched_main
    black.patch_click()
  File "/Users/{user}/.virtualenvs/{venv}/lib/python3.9/site-packages/black/__init__.py", line 1268, in patch_click
    from click import _unicodefun  # type: ignore
ImportError: cannot import name '_unicodefun' from 'click' (/Users/{user}/.virtualenvs/{venv}/lib/python3.9/site-packages/click/__init__.py)

```

* 원인
	* [깃허브 이슈 링크](https://github.com/psf/black/issues/2964)
	* click 모듈의 8.1.0 release에 의하여 발생.

* 해결방법
	* 해당 이슈는 현재 black의 최신 배포를 통하여 fix가 된 상태이며, `pip install --upgrade blackd`을 터미널에서 입력하여 최신버전으로 업데이트를 하면 해결된다.


# Links
* [stackoverflow-ImportError: cannot import name '_unicodefun' from 'click'](https://stackoverflow.com/questions/71673404/importerror-cannot-import-name-unicodefun-from-click)

# 주석