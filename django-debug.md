---
layout  : wiki
title   : 장고를 하며 디버그 한 경험
summary : 
date    : 2022-02-11 21:16:15 +0900
updated : 2022-08-12 17:47:19 +0900
tag     : django aws s3
toc     : true
public  : true
parent  : [[django]]
latex   : false
---
* TOC
{:toc}

# AWS S3로 CDN을 사용하며 계속 https가 아닌 http로 요청

* AWS S3 및, CloudFront, 그리고 CDN 서버로 계속해서 https가 아닌 http를 통하여 요청

```
Mixed Content: The page at 'https://{webpage}' was loaded over HTTPS, but requested an insecure stylesheet 'http://{cdnpage}'. This request has been blocked; the content must be served over HTTPS
```

* 해결방법
	* `AWS_S3_SECURE_URLS = False`가 문제였다. 해당 세팅은 http를 강제적으로 사용하게 만든다. `AWS_S3_SECURE_URLS = True`로 변경해주자

# Intellij IDEA에서 blackd 사용 시 ImportError: cannot import name '_unicodefun' from 'click'  에러

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
	* 해당 이슈는 현재 black의 최신 배포를 통하여 fix가 된 상태이며, `pip install --upgrade black`을 터미널에서 입력하여 최신버전으로 업데이트를 하면 해결된다.


# Links
* [stackoverflow-ImportError: cannot import name '_unicodefun' from 'click'](https://stackoverflow.com/questions/71673404/importerror-cannot-import-name-unicodefun-from-click)

# 주석