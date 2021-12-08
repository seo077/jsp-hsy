<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<style>
* {
	text-align: center;
	margin: 0 auto;
}
</style>
</head>
<body>
	<h1 id="title"
		style="color: #519259; margin-top: 10px; font-size: 3em;">가입하기</h1>
	<br>

	<form method="post" action="_2_joinPro.jsp">
		<div style="position: relative;">
			<span style="font-size: 1.2em; position: absolute; left: 40%;"><strong>아이디</strong></span><br>
			<input type="text"  onchange="idcheck(event)"  style="width: 20%; height: 30px; margin: 7px;"
				name="id" required> <br>
			<span id="al0"
				style="color: red; position: absolute; left: 40%; visibility: hidden;"></span>
		</div>
		<br>
		<br>

		<div style="position: relative;">
			<span style="font-size: 1.2em; position: absolute; left: 40%;"><strong>비밀번호</strong></span><br>
			<input id="pwpw"   onchange="pwcheck(event)" type="password" style="width: 20%; height: 30px; margin: 7px;"
				name="pw" required> <br>
			<span id="al1"
				style="color: red; position: absolute; left: 40%; visibility: hidden;"></span>
		</div>
		<br>
		<br>

		<div style="position: relative;">
			<span style="font-size: 1.2em; position: absolute; left: 40%;"><strong>비밀번호
					재확인</strong></span><br> <input type="password"  onchange="re_pwcheck(event)"
				style="width: 20%; height: 30px; margin: 7px;" required name="re_pw">
			<br>
			<span id="al2"
				style="color: red; position: absolute; left: 40%; visibility: hidden;"></span>
		</div>
		<br>
		<br>

		<div style="position: relative;">
			<span style="font-size: 1.2em; position: absolute; left: 40%;"><strong>이름</strong></span><br>
			<input type="text" style="width: 20%; height: 30px; margin: 7px;"
				name="name" required> <br>
			<span id="al3"
				style="color: red; position: absolute; left: 40%; visibility: hidden;">필수
				정보입니다.</span>
		</div>
		<br>
		<br>


		<div style="position: relative;">
			<span style="font-size: 1.2em; position: absolute; left: 40%;"><strong>생년월일</strong></span><br>
			<div style="display: flex; justify-content: center;">
				<input style="margin: 3px; height: 30px; width: 6%;" type="text"
					id="year" onclick="del(year)" value="년(4자)" name="year" required>
				<br> <select style="margin: 3px; height: 32px; width: 6%;"
					name="month" required>
					<option>월</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
					<option>11</option>
					<option>12</option>
				</select> <br> <input style="margin: 3px; height: 30px; width: 6%;"
					id="day" onclick="del(day)" type="text" value="일" name="date"
					required>
			</div>
			<span id="al4"
				style="color: red; position: absolute; left: 40%; visibility: hidden;">태어난
				년도 4자리를 정확하게 입력하세요.</span>
		</div>
		<br>
		<br>

		<div style="position: relative;">
			<span style="font-size: 1.2em; position: absolute; left: 40%;"><strong>성별</strong></span><br>
			<select style="width: 20%; height: 30px; margin: 7px;" name="gender"
				required>
				<option>성별</option>
				<option>남</option>
				<option>여</option>
			</select> <br>
			<span id="al5"
				style="color: red; position: absolute; left: 40%; visibility: hidden;">필수
				정보입니다.</span>
		</div>
		<br>
		<br>

		<div style="position: relative;">
			<span style="font-size: 1.2em; position: absolute; left: 40%;"><strong>본인
					확인 이메일<span style="color: gray; font-size: 0.6em;">(선택)</span>
			</strong></span><br> <input type="email" id="email" onclick="del(email)"
				style="width: 20%; height: 30px; margin: 7px;" value="선택입력"
				name="email">
		</div>
		<br>
		<br>

		<div style="position: relative;">
			<span style="font-size: 1.2em; position: absolute; left: 40%;"><strong>휴대전화</strong></span><br>
			<select style="width: 20%; height: 30px; margin: 7px;" name="country"
				required>
				<option>대한민국 +82</option>
				<option>미국/캐나다 +1</option>
				<option>프랑스 +33</option>
				<option>남극 +672</option>
				<option>가나 +233</option>
			</select><br> <input type="tel" id="number" onclick="del(number)"
				style="width: 11%; height: 30px; margin-bottom: 5px;"
				pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" value="전화번호 입력" name="number"
				required> <input type="button"
				style="width: 8%; height: 30px; margin-bottom: 5px; background-color: #519259; color: white; border: none;"
				value="인증번호 받기"> <br> <input type="text"
				id="check_number" onclick="del(check_number)"
				style="width: 20%; height: 30px; margin-bottom: 5px;"
				value="인증번호를 입력하세요" name="num" required> <br>
			<span id="al6"
				style="color: red; position: absolute; left: 40%; visibility: hidden;">필수
				정보입니다.</span>
		</div>
		<br>
		<br> <input type="button" onclick="checkVal(form)"
			style="width: 20%; height: 40px; margin: 7px; background-color: #519259; color: white; border: none;"
			value="가입하기">
	</form>


	<script type="text/javascript">
        function del(id){
            id.value='';
        };

        function idcheck(e){
        	console.log(e.target.value);
            const a = document.querySelector('#al0');
        	if(e.target.value.valueOf()===""){
                 a.innerText="필수 정보입니다.";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
        	}else if(e.target.value.length<5 ||e.target.value.length>20){
                 a.innerText="5-20자의 아이디를 입력하세요";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
             }else{
                a.innerText="";
                a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
            }
         }
       
        function pwcheck(e){
            const a = document.querySelector('#al1');
        	if(e.target.value.length==0){
                 a.innerText="필수 정보입니다.";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
        	}else if(e.target.value.length<5 ||e.target.value.length>20){
                 a.innerText="5-20자의 비밀번호를 입력하세요";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
             }else{
                a.innerText="";
                a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
            }
         }
       
        function re_pwcheck(e){
        	const pw =  document.querySelector('#pwpw');
            const a = document.querySelector('#al2');
        	if(e.target.value.length==0){
                 a.innerText="필수 정보입니다.";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
        	}else{
               if(e.target.value.valueOf() !== pw.value.valueOf()){
                 a.innerText="비밀번호가 일지하지 않습니다.";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
               }else{
                 a.innerText="";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
               }
            }
         }

        function checkVal(form){
     		let cnt =0;
            
            if(form.id.value.valueOf() === ""){
                const a = document.querySelector('#al0');
                a.innerText="필수 정보입니다.";
                a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
                cnt++;
            }
            if(form.pw.value.valueOf() === ""){
                const a = document.querySelector('#al1');
                a.innerText="필수 정보입니다.";
                a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
                cnt++;
            }
            if(form.re_pw.value.valueOf() === ""){
                const a = document.querySelector('#al2');
                a.innerText="필수 정보입니다.";
                a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
                cnt++;
            }
            if(form.name.value.valueOf() === ""){
                const a = document.querySelector('#al3');
                a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
                cnt++;
            }
            if(form.year.value.valueOf() === "년(4자)"){
                const a = document.querySelector('#al4');
                a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
                cnt++;
            }
            if(form.month.value.valueOf() === "월"){
                const a = document.querySelector('#al4');
                a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
                cnt++;
            }
            if(form.date.value.valueOf() === "일"){
                const a = document.querySelector('#al4');
                a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
                cnt++;
            }
            if(form.gender.value.valueOf() === "성별"){
                const a = document.querySelector('#al5');
                a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
                cnt++;
            }
            if(form.number.value.valueOf() === "전화번호 입력"){
                const a = document.querySelector('#al6');
                a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
                cnt++;
            }
            if(form.num.value.valueOf() === "인증번호를 입력하세요"){
                const a = document.querySelector('#al6');
                a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
                cnt++;
            }

            if(cnt===0){ 
	              form.submit();

                
            }

            
            
        }
        </script>
</body>
</html>