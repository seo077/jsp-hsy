const onedayPrice = document.getElementById('onedayPrice').value;

window.onload = totalTime();

// 대여 시간
function totalTime(){
	const start = document.getElementById('starttime').value;
	const end = document.getElementById('endtime').value;
	
	const tt = document.querySelector('#total');
		
	if(start === null || end === null || start === "" || end === ""){
	
	}else{
		let startday = new Date(start);
		let endday = new Date(end);
		const time = (endday-startday)/(24*60*60*1000);
		
		const d = Math.floor(time);
		
		let temph =(time - d)*(24*60*60*1000);
		temph = temph /(60*60*1000);
		h = Math.floor(temph);
		
		let m = (temph -h) * (60*60*1000);
		m = m /(60*1000);
		m = Math.floor(m)+1;
		
		tt.innerText = "";
		tt.innerText = `${d}일 ${h}시간 ${m}분`;

        checkTotalPrice(d,h,m);
	}
}

//렌트카 가격 계산
function checkTotalPrice(day,hour,min){
    let total = 0;
    const tp = document.querySelector('#totalPrice');
   
    // 날짜
    total += day * onedayPrice;

    // 시간
    total += (onedayPrice/24)*hour;

    // 분
    total += (onedayPrice/24/60)*min;

    if(total/1000 === 0){
        tp.innerText = `${(total/1000)},000`;
    }else{
        tp.innerText = `${(total/1000)},${total%1000}`;
    }
}