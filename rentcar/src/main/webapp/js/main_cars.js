function car_info(event){
	const num = event.id;
    const start = document.getElementById('startday').value;
    const end = document.getElementById('endday').value;

	if(start === null || end === null || start === "" || end === ""){
		alert("일정을 선택하세요.");
	}else{
		// 날짜 검증!!!
		if(checkDay(start) && checkDay(end) && checkStartEndDay(start,end)){
			location.href= `_21_car_info.jsp?no=${num}&startday=${start}&endday=${end}`;
		}else{
			alert("올바른 일정을 선택하세요.");
		}
	}
}

// 오늘과 비교해서 더 이전이면 flase
function checkDay(day){
	let now = new Date();
	let my = new Date(day);
	
	if(now<my){
		console.log("오케이")
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
		console.log("오케이")
		return true;
	}else{
		return false;
	}
}
