<!-- 회원 정보 수정, 탈퇴 -->

<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="rentalCar.RentalCarDTO"%>
<%@page import="rentalCar.RentalCarDAO"%>
<%@page import="reservation.ReservationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="reservation.ReservationDAO"%>
<%@page import="java.io.PrintWriter"%>
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
<meta property="og:image" content="css/img/logo.png">
<title>Green렌터카</title>

<link rel="shortcut icon" href="css/img/logo.png"
	sizes="16x16 32x32 48x48">
<link rel="stylesheet" type="text/css" href="css/rent.css">
<link rel="stylesheet" type="text/css" href="css/board.css">
</head>
<body>
	<!-- 모든 화면에 고정 -->
	<%
	// 로그인이 되어 있지 않음. => 메인페이지로
	String logID = null;
	if (session.getAttribute("log") == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후 이용해 주세요.')");
		script.println("location.href='_03_login.jsp'");
		script.println("</script>");
	}

	if (session.getAttribute("log") != null) {
		logID = (String) session.getAttribute("log");
	%>
	<div class="nav" id="nav1">
		<a href="_04_main.jsp"><div id="logo"></div></a>

		<div class="nav-left" id="nav1-left">
			<a><%=logID%>님 로그인 중..</a> <a href="_05_logout.jsp">로그아웃</a> <a
				href="">고객센터</a>
		</div>
	</div>
	<%
	} else {
	%>
	<div class="nav" id="nav1">
		<a href="_04_main.jsp"><div id="logo"></div></a>

		<div class="nav-left" id="nav1-left">
			<a href="_03_login.jsp">로그인</a> <a href="_01_validate.jsp">회원가입</a> <a
				href="">고객센터</a>
		</div>
	</div>
	<%
	}
	%>
	<div class="nav" id="nav2">
		<div class="nav2_grid">
			<div id="menu1" class="dropdown">
				<a href="_04_main.jsp">단기렌터카</a>
				<div class="dropdown-content">
					<a style="font-size: 1em;" class="arrow"> ▲</a> <a
						href="_13_short-term-rent.jsp?car_type=전체" style="font-size: 1em;"
						class="dropdown-content_content">단기렌터카 예약</a> <a
						href="_14_short-term-guide.jsp" style="font-size: 1em;"
						class="dropdown-content_content">단기렌터카 안내</a>
				</div>
			</div>
			<div id="menu2" class="dropdown">
				<a href="_04_main.jsp">장기렌터카</a>
				<div class="dropdown-content">
					<a style="font-size: 1em;" class="arrow"> ▲</a> <a
						href="_15_long-term-rent.jsp" style="font-size: 1em;"
						class="dropdown-content_content">장기렌터카 예약</a> <a
						href="_16_long-term-guide.jsp" style="font-size: 1em;"
						class="dropdown-content_content">장기렌터카 안내</a>
				</div>
			</div>
			<div id="menu3" class="dropdown">
				<a href="_04_main.jsp">커뮤니티</a>
				<div class="dropdown-content">
					<a style="font-size: 1em;" class="arrow"> ▲</a> <a
						href="_06_board.jsp" style="font-size: 1em;"
						class="dropdown-content_content">게시판</a> <a href="_17_event.jsp"
						style="font-size: 1em;" class="dropdown-content_content">이벤트</a>
				</div>
			</div>
			<div id="menu4" class="dropdown">
				<a href="_04_main.jsp">마이페이지</a>
				<div class="dropdown-content">
					<a style="font-size: 1em;" class="arrow"> ▲</a> <a
						href="_18_member-info.jsp" style="font-size: 1em;"
						class="dropdown-content_content">회원정보</a> <a
						href="_19_reservation-confirmation.jsp" style="font-size: 1em;"
						class="dropdown-content_content">예약확인</a>
				</div>
			</div>
		</div>
		<div class="nav-left" id="nav2-left">
			<form style="display: flex;" method="get" action="_20_search-car.jsp">
				<input type="search" id="search" placeholder="차 검색" name="search">
				<input type="button" id="search_btn">
			</form>
		</div>
	</div>

	<!-- 모든 화면에 고정 -->

	<div class="container">
		<%
		MemberDAO memberdao = MemberDAO.getInstance();
		MemberDTO member = memberdao.getMember_info(logID);
		%>
		<h1 id="table_title">회원 정보</h1>
		<form action="_18_member-infoPro.jsp?dir=0" method="post">
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
			href="_18_member-infoPro.jsp?dir=1&id=<%=member.getId()%>">삭제</a>
		</form>




	</div>

	<!-- 모든 화면에 고정 -->
	<footer>
		<div id="info1">
			<span><strong>고객센터</strong></span><br>
			<br>
			<div class="btns">
				<div id="phone_img"></div>
				<span><strong> 02-123-1234</strong></span><br>
			</div>
			<span>평일 : 오전9시~오후6시</span><br> <span>토 : 오전9시~오후3시</span>
		</div>

		<div id="info2">
			<span><strong>Green렌터카 앱 설치</strong></span><br>
			<br>
			<div class="btns">
				<a href=""><div id="google"></div></a> <a href=""><div
						id="apple"></div></a>
			</div>
		</div>

		<div id="info3">
			<span><strong>Green렌터카 SNS</strong></span><br>
			<br>
			<div class="btns">
				<a href=""><div id="facebook"></div></a> <a href=""><div
						id="insta"></div></a> <a href=""><div id="youtube"></div></a> <a
					href=""><div id="naver"></div></a> <a href=""><div
						id="naver_blog"></div></a>
			</div>
		</div>
	</footer>
	<!-- 모든 화면에 고정 -->
	<script type="text/javascript" src="js/member.js"></script>
</body>
</html>