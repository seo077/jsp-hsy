<!-- 회원 정보 수정, 탈퇴 -->

<%@page import="model.dto.MemberDTO"%>
<%@page import="model.dao.MemberDAO"%>
<%@page import="model.dto.RentalCarDTO"%>
<%@page import="model.dao.RentalCarDAO"%>
<%@page import="model.dto.ReservationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.ReservationDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta property="og:title" content="Green렌터카">
<meta property="og:description" content=".">
<meta property="og:image" content="../resources/css/img/logo.png">
<title>Green렌터카</title>

<link rel="shortcut icon" href="../resources/css/img/logo.png"
	sizes="16x16 32x32 48x48">
<link rel="stylesheet" type="text/css" href="../resources/css/rent.css">
<link rel="stylesheet" type="text/css" href="../resources/css/board.css">
</head>
<body>
	<%
	// 로그인이 되어 있지 않음.
	String logID = null;
	
	if (session.getAttribute("log") == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후 이용해 주세요.')");
		script.println("location.href='../service?command=loginForm&next=memberInfo'");
		script.println("</script>");
	}
	%>
	<c:import url="header.jsp"></c:import>
	<div class="container">
		<%
		MemberDAO memberdao = MemberDAO.getInstance();
		MemberDTO member = memberdao.getMember_info(logID);
		%>
		<h1 id="table_title">회원 정보</h1>
		<form action="service?command=memberInfo&dir=0" method="post">
			<div class="table_div">
				<table class="table">
					<thead>
						<tr>
							<th colspan="4"
								style="text-align: center; background-color: #eeeeee">회원 정보
								보기</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td style="width: 20%;">아이디</td>
							<td><input type="text" id="idid" onchange="idcheck(idid)"
								value="<%=member.getId()%>" name="id"></td>
							<td colspan="2" id="al0"
								style="color: red; visibility: hidden; position: inherent;"></td>
						</tr>
						<tr>
							<td style="width: 20%;">비밀번호</td>
							<td><input type="text" id="pwpw" onchange="pwcheck(pwpw)"
								value="<%=member.getPw()%>" name="pw"></td>
							<td colspan="2" id="al1"
								style="color: red; visibility: hidden; position: inherent;"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" id="namename"
								onchange="namecheck(namename)" value="<%=member.getName()%>"
								name="name"></td>
							<td colspan="2" id="al3"
								style="color: red; visibility: hidden; position: inherent;"></td>
						</tr>
						<tr>
							<td>생일</td>
							<td colspan="3"><%=member.getBirth_year()%></td>
						</tr>
						<tr>
							<td>성별</td>
							<td colspan="3"><%=member.getGender()%></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" id="eemail"
								onchange="emailcheck(eemail)" value="<%=member.getEmail()%>"
								name="email"></td>
							<td colspan="2" id="alE"
								style="color: red; visibility: hidden; position: inherent;"></td>
						</tr>
						<tr>
							<td>국가</td>
							<td colspan="3"><%=member.getCountry()%></td>
						</tr>
						<tr>
							<td>핸드폰 번호</td>
							<td><input type="text" id="pp" onchange="numbercheck(pp)"
								value="<%=member.getPhone_number()%>" name="phone"></td>
							<td colspan="2" id="al6"
								style="color: red; visibility: hidden; position: inherent;"></td>
						</tr>
						<tr>
							<td>회원가입 일자</td>
							<%
							String date = String.valueOf(member.getRegDate());
							%>
							<td colspan="3"><%=date.substring(0, 11) + date.substring(11, 13) + "시" + date.substring(14, 16) + "분"%></td>
						</tr>

					</tbody>
				</table>
			</div>

			<input type="submit" class="view_btn" value="수정">
			<a class="view_btn"
			href="service?command=memberInfo&dir=1">삭제</a>
		</form>

	</div>

	<c:import url="footer.jsp"></c:import>
	<script type="text/javascript" src="js/member.js"></script>
</body>
</html>