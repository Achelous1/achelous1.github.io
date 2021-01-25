---
layout  : wiki
title   : 
summary : 두 날짜 사이의 시간만 가지고 교대시간을 구하는 알고리즘
date    : 2021-01-20 16:44:03 +0900
updated : 2021-01-25 11:57:31 +0900
tag     : algorithm
toc     : true
public  : true
parent  : [[program-algorithms]]
latex   : false
---
* TOC
{:toc}

# 두 날짜에 걸쳐진 시간의 교대 계산


> 개발을 하다보면 **두 날짜간 걸쳐진 시간을 계산 해야하는 일**이 생긴다 <br>
> 이 부분은 그냥 생각만 해보면 어렵지 않지만 막상 구현을 시작하면 어떻게 해야하는 지 막막하기만 하다.

```
2020/01/01 07:00                  2020/01/01 14:59                  2020/01/01 22:59                  2020/01/02 06:59
    l---------------------------------l---------------------------------l---------------------------------l
                    1st                                 2nd                                3rd
```
```
교대1 시간 : 0700 ~ 1459
교대2 시간 : 1500 ~ 2259
교대3 시간 : 2300 ~ 0659

현재시간   : 2020/01/02 01:00
```

> 이럴 때 어떻게 시간만으로 현재시간의 교대번호를 계산할 것인가?<br>
> 또한 `datetimepicker` 등과 같은 컴퍼넌트에서 받아온 시간을 <br>
> 해당 교대순서로 변경해줘야 한다면 어떻게 해야할것인가?<br>
> 또한 동적으로 시간을 변경할 때 해당 시간이 3교대째 시간이라면 어떻게 구현할 것인가?<br>
><br>


## 해결방법

* `UNIX Time` 을 활용 한 해결방안
  * 모든 언어에서 공통적으로 활용하고 있는 [UNIX Time][unix_wiki_link]을 활용하여 간단하게 다음 자바스크립트 코드를 구현해 보았다
```javascript
// 교대 데이터
var shifts= [
    {shiftId : '1', shiftNm: '1교대', shiftStTm: '0700', shiftEndTm: '1459'},
    {shiftId : '2', shiftNm: '2교대', shiftStTm: '1500', shiftEndTm: '2259'},
    {shiftId : '3', shiftNm: '3교대', shiftStTm: '2300', shiftEndTm: '0659'}
];

function calculateForCurrentShift(dateTime){

    var shift = null;

    for(var i = 0; i < shifts.length; i++){
        var targetDt = this.generateTimeSpecifiedUnixDate(dateTime);
        var shiftStDt = this.generateTimeSpecifiedUnixDate(shifts[i].shiftStTm);
        var shiftEndDt = this.generateTimeSpecifiedUnixDate(shifts[i].shiftEndTm);

        if(shiftEndDt < shiftStDt){      // 다른 날짜의 교대 일 경우
            shiftEndDt = shiftEndDt.setDate(shiftEndDt.getDate()+1);
            if(targetDt < shiftStDt){    // 선택한 날짜가 교대시작 날짜보다 작을경우
                targetDt = targetDt.setDate(targetDt.getDate()+1);
            }
        }

        if(shiftStDt < targetDt < shiftEndDt){  // 선택한 날짜가 교대시간 안에 들어있는지 확인한다
            shift = shifts[i];
        }
    }

    return shift;
}


function generateCompareTimeValue(dateTime){
    var dummyDt = this.getUnixFirstDate();
    dummyDt.setHours(dateTime.getHours());
    dummyDt.setMinutes(dateTime.getMinutes());
    return dummyDt;
}

// 유닉스 시간을 가지고 오는 함수
function getUnixTimestamp(){
    var unixTs = new Date(0000000001);
    return unixTs;
}

function generateTimeSpecifiedUnixDate(time){
    var dateTime = this.getUnixTimestamp();
    var hour = time.slice(0, 2);
    var minute = time.slice(2, 4);

    dateTime.setHours(hour);
    dateTime.setMinutes(minute);

    return dateTime;
}

console.log(calculateForCurrentShift('0630').shiftNm); // 3교대 출력

```




[unix_wiki_link]: https://ko.wikipedia.org/wiki/%EC%9C%A0%EB%8B%89%EC%8A%A4_%EC%8B%9C%EA%B0%84
