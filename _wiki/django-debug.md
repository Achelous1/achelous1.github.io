---
layout  : wiki
title   : 장고를 하며 디버그 한 경험
summary : 
date    : 2022-02-11 21:16:15 +0900
updated : 2022-08-10 16:05:19 +0900
tag     : django aws s3
toc     : true
public  : true
parent  : [[django]]
latex   : false
---
* TOC
{:toc}

### AWS S3로 CDN을 사용하며 계속 https가 아닌 http로 요청

#### 문제
* AWS S3 및, CloudFront, 그리고 CDN 서버로 계속해서 https가 아닌 http를 통하여 요청

```
Mixed Content: The page at 'https://{webpage}' was loaded over HTTPS, but requested an insecure stylesheet 'http://{cdnpage}'. This request has been blocked; the content must be served over HTTPS
```

#### 해결
* `AWS_S3_SECURE_URLS = False`가 문제였다. 해당 세팅은 http를 강제적으로 사용하게 만든다. `AWS_S3_SECURE_URLS = True`로 변경해주자