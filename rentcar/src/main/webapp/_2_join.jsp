<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Green렌터카</title>
<style>
* {
	text-align: center;
	margin: 0 auto;
}
</style>
</head>
<body>
	<h1 id="title"
		style="color: #fabb51; margin-top: 10px; font-size: 3em;">Green렌터카</h1>
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
					type="text" id="year" 
					onchange="yearcheck(yearyear)" placeholder="년(4자)" name="year" required>
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
					id="day" onchange="datecheck(day)" type="text"
					placeholder="일" name="date" required>
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
			</strong></span><br> <input type="email" id="email" onchange="emailcheck(email)"
				style="width: 20%; height: 30px; margin: 7px;" placeholder="선택입력"
				name="email"><br>
				<span id="alE"
				style="color: red; position: absolute; left: 40%; visibility: hidden;"></span>
		</div>
		<br> <br>

		<div style="position: relative;">
			<span style="font-size: 1.2em; position: absolute; left: 40%;"><strong>휴대전화</strong></span><br>
			<select style="width: 20%; height: 30px; margin: 7px;" name="country"
				required>
				<option value="대한민국 +82">대한민국 +82</option>
				<option value="미국/캐나다 +1">미국/캐나다 +1</option>
				<option value="프랑스 +33">프랑스 +33</option>
				<option value="남극 +672">남극 +672</option>
				<option value="가나 +233">가나 +233</option>
			</select><br> <input type="tel" id="number"
				onchange="numbercheck(number)"
				style="width: 11%; height: 30px; margin-bottom: 5px;"
				pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="전화번호 입력" name="number"
				required> <input type="button" onclick="verificationCode()"
				style="width: 8%; height: 30px; margin-bottom: 5px; background-color: #fabb51; color: white; border: none;"
				value="인증번호 받기"> <br> <input type="text"
				id="check_number"
				onchange="verification(check_number)"
				style="width: 20%; height: 30px; margin-bottom: 5px;"
				placeholder="인증번호를 입력하세요" name="num" required> <br> <span
				id="al6"
				style="color: red; position: absolute; left: 40%; visibility: hidden;"></span>
				<input type="hidden" id="code">
		</div>
		<br> <br> <input type="button" onclick="checkVal(form)"
			style="width: 20%; height: 40px; margin: 7px; background-color: #fabb51; color: white; border: none;"
			value="가입하기">
	</form>


	<script type="text/javascript" src="join.js"></script>
</body>
</html>