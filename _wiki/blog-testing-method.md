---
layout  : wiki
title   : Johngrib 위키 로컬테스트 
summary : 
date    : 2021-02-18 12:01:08 +0900
updated : 2021-02-18 12:13:10 +0900
tag     : wiki blog local-test
toc     : true
public  : true
parent  : [[programming]] 
latex   : false
---
* TOC
{:toc}

# 종립님의 블로그 테스트 방법
* 이 블로그는 종립님의 [블로그](https://github.com/johngrib/johngrib.github.io)를 사용하고 수정하여 만들었음.
* 해당 방법은 ubuntu기반 환경에서 작성되었음을 첫째로 명시한다. 자세한 방법은 [Github Docs](https://docs.github.com/en/github/working-with-github-pages/testing-your-github-pages-site-locally-with-jekyll)에 명시된 설명을 참조할 것.

## Ruby 설치
* 첫째로 OS에 루비가 설치 돼있는지 확인 후 설치 돼있지 않다면 루비를 설치해야한다.

```terminal
sudo apt-get install ruby-full build-essential zlib1g-dev
```

```terminal
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## Jekyll과 Bundler 설치

```terminal
gem install jekyll bundler
```

## Server 실행
* 해당 위키가 들어있는 디렉터리로 이동한 뒤

```terminal
$ bundle exec jekyll serve
```
