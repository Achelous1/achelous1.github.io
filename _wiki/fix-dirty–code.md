---
layout  : wiki
title   : 더러운 코드를 고쳐보자
summary : 
date    : 2022-01-31 12:34:58 +0900
updated : 2022-01-31 12:34:58 +0900
tag     : nomad-coders
toc     : true
public  : true
parent  : [[nomad-book-club]]
latex   : false
---
* TOC
{:toc}

# 더러운 코드를 고쳐보자
## 기존코드
```javascript
const merry = document.querySelector(".js-clock");  
  
function getClock() {  
	const christmas = new Date("2021, 12, 25");  
	const date = new Date();  
	const timeGap = christmas - date;  

	const xDay = Math.floor(timeGap / (1000 * 60 * 60 * 24));  
	const xHours = Math.floor(  
	(timeGap - xDay * 1000 * 60 * 60 * 24) / (1000 * 60 * 60)  
	);  
	const xMinutes = Math.floor((timeGap % (60 * 60 * 1000)) / (60 * 1000));  
	const xSeconds = Math.floor((timeGap % (60 * 1000)) / 1000);  

	const day = String(xDay).padStart(2, "0");  
	const hours = String(xHours).padStart(2, "0");  
	const minutes = String(xMinutes).padStart(2, "0");  
	const seconds = String(xSeconds).padStart(2, "0");  

	merry.innerText = `${day}d ${hours}h ${minutes}m ${seconds}s`;  
}  
  
getClock();  
setInterval(getClock, 1000);
```

## 클린코드에서 배운 내용을 토대로 고친 코드
* 구현 소스코드
```javascript
function runChristmasClockEverySecond(){
    setInterval(setChristmasRemainingClockTime, 1000);
}

function setChristmasRemainingClockTime() {
    const christmasClock = new ChristmasClock();
    setChristmasClockElementTimeRemains(christmasClock.getRemainingChristmasTimegap());
}

function setChristmasClockElementTimeRemains({day, hours, minutes, seconds}){
    getChristmasClockElement().innerText = `${day}d ${hours}h ${minutes}m ${seconds}s`;
}

function getChristmasClockElement(){
    return christmasClock = document.querySelector(".js-clock");
}

runChristmasClockEverySecond();
```
* ChristmasClock 클래스
```javascript
class ChristmasClock{

    constructor(){
    }

    getTodayChristmasTimegap(){
        return this.getThisYearChristmasDate() - new Date();
    }
    
    getThisYearChristmasDate(){
        let christmasYear = new Date().getFullYear();
        if (this.isThisYearChristmasHasPassed()) {
            christmasYear = christmasYear + 1;
        }
        return new Date(christmasYear, 12, 25);
    }

    isThisYearChristmasHasPassed(){
        let today = new Date();
        if (today.getMonth() == 11 && today.getDate() > 25) {
            return true
        } else {
            return false
        }
    }
    
    getRemainingGapDays(timeGap){
        const xDay = Math.floor(timeGap / (1000 * 60 * 60 * 24));
        return String(xDay).padStart(2, "0");
    }
    
    getRemainingGapHours(timeGap){
        const day = Math.floor(timeGap / (1000 * 60 * 60 * 24)); 
        const xHours = Math.floor((timeGap - day * 1000 * 60 * 60 * 24) / (1000 * 60 * 60));
        return String(xHours).padStart(2, "0");
    }
    
    getRemainingGapMinutes(timeGap){
        const xMinutes = Math.floor((timeGap % (60 * 60 * 1000)) / (60 * 1000));
        return String(xMinutes).padStart(2, "0");
    }
    
    getRemainingGapSeconds(timeGap){
        const xSeconds = Math.floor((timeGap % (60 * 1000)) / 1000);
        return String(xSeconds).padStart(2, "0");
    }

    getRemainingChristmasTimegap(){
        return {
            day: this.getRemainingGapDays(this.getTodayChristmasTimegap()),
            hours: this.getRemainingGapHours(this.getTodayChristmasTimegap()),
            minutes: this.getRemainingGapMinutes(this.getTodayChristmasTimegap()),
            seconds: this.getRemainingGapSeconds(this.getTodayChristmasTimegap())
        }
    }
}
```

## 고친 내용들
* 알기 쉬운 명명규칙으로 변경하였다
* 너무 긴 함수를 클래스로 추상화하고 묶었으며 짧고 간결하게 변경했다.
* 전체적으로 소스코드는 길어졌지만 하나의 함수에서 여러 단계의 추상화를 함수단위로 쪼개서 하나의 함수에선 하나의 일만 처리하게끔 변경하였다.

## Links
* [노개북 README](https://nomadcoders.oopy.io/readme?utm_source=Nomad_Book_Club%231&utm_campaign=853979327e-EMAIL_CAMPAIGN_2022_01_20_09_04&utm_medium=email&utm_term=0_26f5b50d66-853979327e-357549064)
* [TIL 출석표](https://docs.google.com/spreadsheets/d/1Cy2NOnfFDP6Y1snkd3nL5VidLDmBq8C9696iTwbc_K0/edit#gid=0)