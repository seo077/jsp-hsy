const type = document.getElementById('type').value;
const usein = document.getElementById('usein').value;

function car_info(event){
	// 차량 수 검증
	const num = event.id;
	const qty = document.getElementById(num).value;
	if(qty <= 0){
		alert("차량을 예약할 수 없습니다.");
		history.back();
	}else{
	    const start = document.getElementById('startday').value;
	    const end = document.getElementById('endday').value;
	
		if(start === null || end === null || start === "" || end === ""){
			alert("일정을 선택하세요.");
		}else{
			// 날짜 검증!!!
			if(checkDay(start) == 1 && checkDay(end) == 1 && checkStartEndDay(start,end)){
				location.href= `service?command=carInfo&no=${num}&usein=${usein}&type=${type}&startday=${start}&endday=${end}`;
			}else{
				alert("올바른 일정을 선택하세요.");	
			}
		}
	}
}

// 지금과 비교
function checkDay(day){
	let now = new Date();
	let my = new Date(day);
	
	if(now<my){
		return true;
	}else{
		return false;
	}
}

//start가 end보다 이전이면 true
function checkStartEndDay(start,end){
	let startday = new Date(start);
	let endday = new Date(end);

	
	if(startday<endday){
		return true;
	}else{
		return false;
	}
}

