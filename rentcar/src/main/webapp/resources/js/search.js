const temptype = document.getElementById('type').value;
const tempusein = document.getElementById('usein').value;

if(temptype === "전체"){
    $('.type1').css("background-color","#3E8E7E");
}else if(temptype === "경형"){
    $('.type2').css("background-color","#3E8E7E");
}else if(temptype === "소형"){
    $('.type3').css("background-color","#3E8E7E");
}else if(temptype === "중형"){
    $('.type4').css("background-color","#3E8E7E");
}else if(temptype === "고급"){
    $('.type5').css("background-color","#3E8E7E");
}else if(temptype === "SUV"){
    $('.type6').css("background-color","#3E8E7E");
}else if(temptype === "승합"){
    $('.type7').css("background-color","#3E8E7E");
}else if(temptype === "특가할인"){
    $('.type8').css("background-color","#3E8E7E");
}

if(tempusein === "-1"){
    $('.usein1').css("background-color","#3E8E7E");
}else if(tempusein === "0"){
    $('.usein2').css("background-color","#3E8E7E");
}else if(tempusein === "1"){
    $('.usein3').css("background-color","#3E8E7E");
}
firstTotalTime();
function firstTotalTime(){
	const start = document.getElementById('startday').value;
	const end = document.getElementById('endday').value;
	
	const tt = document.querySelector('#totaltime');
		
	if(start === null || end === null || start === "" || end === ""){
		tt.innerText = '0일 0시간 0분';
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
		m = Math.floor(m);
		
		tt.innerText = "";
		tt.innerText = `${d}일 ${h}시간 ${m}분`;
	}
	
}

function totalTime(){
	const start = document.getElementById('startday').value;
	const end = document.getElementById('endday').value;
	
	const tt = document.querySelector('#totaltime');
		
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
	}
}

function selUsein(ths){
	const start = document.getElementById('startday').value;
	const end = document.getElementById('endday').value;
	let selIn = -1;
	if($(ths).text() === "전체"){
		selIn = -1;
	}else if($(ths).text() === "미포함"){
		selIn = 0;
	}else{
		selIn = 1;
	}
	
	if(start === null || end === null || start === "" || end === ""){
		location.href= `service?command=carSearch&usein=${selIn}&type=${temptype}`;
	}else{
		location.href= `service?command=carSearch&usein=${selIn}&type=${temptype}&startday=${start}&endday=${end}`;
	}
};

function selType(ths){
	const start = document.getElementById('startday').value;
	const end = document.getElementById('endday').value;
	let typetype = $(ths).text();
	
	if(start === null || end === null || start === "" || end === ""){
		location.href= `service?command=carSearch&usein=${tempusein}&type=${typetype}`;
	}else{
		location.href= `service?command=carSearch&usein=${tempusein}&type=${typetype}&startday=${start}&endday=${end}`;
	}
};
	
