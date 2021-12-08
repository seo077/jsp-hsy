<%@page import="java.util.Random"%>
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
			<input type="text" id="idid" onchange="idcheck(idid)"
				style="width: 20%; height: 30px; margin: 7px;" name="id" required>
			<br> <span id="al0"
				style="color: red; position: absolute; left: 40%; visibility: hidden;"></span>
		</div>
		<br> <br>

		<div style="position: relative;">
			<span style="font-size: 1.2em; position: absolute; left: 40%;"><strong>비밀번호</strong></span><br>
			<input id="pwpw" onchange="pwcheck(pwpw)" type="password"
				style="width: 20%; height: 30px; margin: 7px;" name="pw" required>
			<br> <span id="al1"
				style="color: red; position: absolute; left: 40%; visibility: hidden;"></span>
		</div>
		<br> <br>

		<div style="position: relative;">
			<span style="font-size: 1.2em; position: absolute; left: 40%;"><strong>비밀번호
					재확인</strong></span><br> <input type="password" id="repw"
				onchange="re_pwcheck(repw)"
				style="width: 20%; height: 30px; margin: 7px;" required name="re_pw">
			<br> <span id="al2"
				style="color: red; position: absolute; left: 40%; visibility: hidden;"></span>
		</div>
		<br> <br>

		<div style="position: relative;">
			<span style="font-size: 1.2em; position: absolute; left: 40%;"><strong>이름</strong></span><br>
			<input type="text" id="namename" onchange="namecheck(namename)"
				style="width: 20%; height: 30px; margin: 7px;" name="name" required>
			<br> <span id="al3"
				style="color: red; position: absolute; left: 40%; visibility: hidden;"></span>
		</div>
		<br> <br>


		<div style="position: relative;">
			<span style="font-size: 1.2em; position: absolute; left: 40%;"><strong>생년월일</strong></span><br>
			<div style="display: flex; justify-content: center;">
				<input style="margin: 3px; height: 30px; width: 6%;" id="yearyear"
					type="text" id="year" onclick="del(year)"
					onchange="yearcheck(yearyear)" value="년(4자)" name="year" required>
				<br> <select style="margin: 3px; height: 32px; width: 6%;"
					id="monthmonth" onchange="monthcheck(monthmonth)" name="month"
					required>
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
					id="day" onclick="del(day)" onchange="datecheck(day)" type="text"
					value="일" name="date" required>
			</div>
			<span id="al4"
				style="color: red; position: absolute; left: 40%; visibility: hidden;"></span>
		</div>
		<br> <br>

		<div style="position: relative;">
			<span style="font-size: 1.2em; position: absolute; left: 40%;"><strong>성별</strong></span><br>
			<select style="width: 20%; height: 30px; margin: 7px;" id="g"
				onchange="gendercheck(g)" name="gender" required>
				<option>성별</option>
				<option>남</option>
				<option>여</option>
			</select> <br> <span id="al5"
				style="color: red; position: absolute; left: 40%; visibility: hidden;"></span>
		</div>
		<br> <br>

		<div style="position: relative;">
			<span style="font-size: 1.2em; position: absolute; left: 40%;"><strong>본인
					확인 이메일<span style="color: gray; font-size: 0.6em;">(선택)</span>
			</strong></span><br> <input type="email" id="email" onclick="del(email)"
				style="width: 20%; height: 30px; margin: 7px;" value="선택입력"
				name="email">
		</div>
		<br> <br>

		<div style="position: relative;">
			<span style="font-size: 1.2em; position: absolute; left: 40%;"><strong>휴대전화</strong></span><br>
			<select style="width: 20%; height: 30px; margin: 7px;" name="country"
				required>
				<option>대한민국 +82</option>
				<option>미국/캐나다 +1</option>
				<option>프랑스 +33</option>
				<option>남극 +672</option>
				<option>가나 +233</option>
			</select><br> <input type="tel" id="number"
				onchange="numbercheck(number)" onclick="del(number)"
				style="width: 11%; height: 30px; margin-bottom: 5px;"
				pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" value="전화번호 입력" name="number"
				required> <input type="button" onclick="verificationCode()"
				style="width: 8%; height: 30px; margin-bottom: 5px; background-color: #519259; color: white; border: none;"
				value="인증번호 받기"> <br> <input type="text"
				id="check_number" onclick="del(check_number)"
				onchange="verification(check_number)"
				style="width: 20%; height: 30px; margin-bottom: 5px;"
				value="인증번호를 입력하세요" name="num" required> <br> <span
				id="al6"
				style="color: red; position: absolute; left: 40%; visibility: hidden;"></span>
				<input type="hidden" id="code">
		</div>
		<br> <br> <input type="button" onclick="checkVal(form)"
			style="width: 20%; height: 40px; margin: 7px; background-color: #519259; color: white; border: none;"
			value="가입하기">
	</form>


	<script type="text/javascript">
        function del(id){
            id.value='';
        };

      
        
        //아이디 검사
        function idcheck(id){
            const a = document.querySelector('#al0');
        	if(id.value===""){
                 a.innerText="필수 정보입니다.";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
        	}else if(id.value.length<5 ||id.value.length>20){
                 a.innerText="5-20자의 아이디를 입력하세요";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
             }else{
                a.innerText="";
                a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
                return true;
            }
        	return false;
         }
       
        //비밀번호 검사
        function pwcheck(id){
            const a = document.querySelector('#al1');
        	if(id.value===""){
                 a.innerText="필수 정보입니다.";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
        	}else if(id.value.length<5 ||id.value.length>20){
                 a.innerText="5-20자의 비밀번호를 입력하세요";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
             }else{
                a.innerText="";
                a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
                return true;
            }
        	return false;
         }
       
        //비밀번호 재확인 검사
        function re_pwcheck(id){
        	const pw =  document.querySelector('#pwpw');
            const a = document.querySelector('#al2');
        	if(id.value===""){
                 a.innerText="필수 정보입니다.";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
        	}else{
               if(id.value.valueOf() !== pw.value.valueOf()){
                 a.innerText="비밀번호가 일치하지 않습니다.";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
               }else{
                 a.innerText="";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
                 return true;
               }
            }
        	return false;
         }
        
        //이름 검사
        function namecheck(id){
        	const a = document.querySelector('#al3');
         	if(id.value===""){
                  a.innerText="필수 정보입니다.";
                  a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
         	}else{
                 a.innerText="";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
                 return true;
             }
         	return false;
        }
        //생년월일 중 '년'검사
        function yearcheck(id){
        	const a = document.querySelector('#al4');
         	if(id.value==="년(4자)" || id.value===""){
                  a.innerText="필수 정보입니다.";
                  a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
         	}else if(id.value.length !== 4){
                a.innerText="태어난 년도 4자리를 정확하게 입력하세요.";
                a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
         	}else{
                 a.innerText="";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
                 return true;
             }
         	return false;
        }
        //생년월일 중 '월'검사
        function monthcheck(id){
        	const a = document.querySelector('#al4');
         	if(id.value==="월"){
                  a.innerText="필수 정보입니다.";
                  a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
         	}else{
                 a.innerText="";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
                 return true;
             }
         	return false;
        }
        //생년월일 중 '일'검사
        function datecheck(id){
        	const a = document.querySelector('#al4');
         	if(id.value.valueOf()==="일" || id.value.valueOf()===""){
                  a.innerText="필수 정보입니다.";
                  a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
         	}else if(id.value<1 || id.value>31){
                  a.innerText="'일'을 정확하게 입력해주세요.";
                  a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
         	}else{
                 a.innerText="";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
                 return true;
             }
         	return false;
        }
        //성별 검사
        function gendercheck(id){
        	const a = document.querySelector('#al5');
         	if(id.value==="성별"){
                  a.innerText="필수 정보입니다.";
                  a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
         	}else{
                 a.innerText="";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
                 return true;
             }
         	return false;
        }
        //전화번호 검사
        function numbercheck(id){
        	const a = document.querySelector('#al6');
        	console.log(id.value.length);
         	if(id.value==="전화번호 입력" || id.value===""){
                  a.innerText="필수 정보입니다.";
                  a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
         	}else if(id.value.length !== 11){
         		a.innerText="형식에 맞지 않은 전화번호입니다.";
                a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
         	}else{
                 a.innerText="";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
                 return true;
             }
         	return false;
        }
        //인증번호 검사
        function verificationCode_check(id){
        	const code = document.querySelector('#code');
        	const a = document.querySelector('#al6');
         	if(id.value==="인증번호를 입력하세요" || id.value===""){
                  a.innerText="필수 정보입니다.";
                  a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
         	}else if(id.value.valueOf() !== code.value.valueOf()){
                  a.innerText="일치하지 않는 인증번호입니다.";
                  a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
         	}
         	else{
                 a.innerText="";
                 a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
                 return true;
             }
         	return false;
        }
        
        //인증번호 발급
		function verificationCode(){
        	const hide = document.querySelector('#code');
        	<%Random ran = new Random();
			int code = ran.nextInt(8999) + 1000;
			%>
        	const number = document.querySelector('#number');
        	if(numbercheck(number)){
        		alert("인증번호 : <%=code%>");
        		hide.value=<%=code %>;
        	}
        	
		}

		//모든 정보 유효성 검사
		function checkVal(form) {
			//유효한 데이터 개수(check==10 -> submit)
			let check = 0;

			if (idcheck(form.id)) {
				check++;
			}
			if (pwcheck(form.pw)) {
				check++;
			}
			if (re_pwcheck(form.re_pw)) {
				check++;
			}
			if (namecheck(form.name)) {
				check++;
			}
			if (yearcheck(form.year)) {
				check++;
			}
			if (monthcheck(form.month)) {
				check++;
			}
			if (datecheck(form.date)) {
				check++;
			}
			if (gendercheck(form.gender)) {
				check++;
			}
			if (numbercheck(form.number)) {
				check++;
			}
			if (verificationCode_check(form.num)) {
				check++;
			}

			//필수 정보가 모두 채워지면 제출
			if (check === 10) {
				form.submit();
			}
		}
	</script>
</body>
</html>