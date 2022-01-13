<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/rent.css">
</head>
<body>
	<%
	// 이미 로그인이 된 상태
	String logID = null;
	if (session.getAttribute("log") != null) {
		logID = (String) session.getAttribute("log");
	%>
	<div class="nav" id="nav1">
		<a href="service?command=mainForm"><div id="logo"></div></a>

		<div class="nav-left" id="nav1-left">
			<a><%=logID%>님 로그인 중..</a> <a href="service?command=logout">로그아웃</a>
			<a href="">고객센터</a>
		</div>
	</div>
	<%
	} else {
	%>
	<div class="nav" id="nav1">
		<a href="service?command=mainForm"><div id="logo"></div></a>

		<div class="nav-left" id="nav1-left">
			<a href="../service?command=loginForm">로그인</a> <a
				href="service?command=validateForm">회원가입</a> <a href="">고객센터</a>
		</div>
	</div>
	<%
	}
	%>
	<div class="nav" id="nav2">
		<div class="nav2_grid">
			<div id="menu1" class="dropdown">
				<a>단기렌터카</a>
				<div class="dropdown-content">
					<a style="font-size: 1em;" class="arrow"> ▲</a> <a
						href="../service?command=carSearch&usein=-1&type=전체"
						style="font-size: 1em;" class="dropdown-content_content">단기렌터카
						예약</a> <a href="service?command=shortCarInfo" style="font-size: 1em;"
						class="dropdown-content_content">단기렌터카 안내</a>
				</div>
			</div>
			<div id="menu2" class="dropdown">
				<a>장기렌터카</a>
				<div class="dropdown-content">
					<a style="font-size: 1em;" class="arrow"> ▲</a> <a
						href="service?command=longCarRent" style="font-size: 1em;"
						class="dropdown-content_content">장기렌터카 예약</a> <a
						href="service?command=longCarInfo" style="font-size: 1em;"
						class="dropdown-content_content">장기렌터카 안내</a>
				</div>
			</div>
			<div id="menu3" class="dropdown">
				<a>커뮤니티</a>
				<div class="dropdown-content">
					<a style="font-size: 1em;" class="arrow"> ▲</a> <a
						href="service?command=board" style="font-size: 1em;"
						class="dropdown-content_content">게시판</a> <a
						href="service?command=event" style="font-size: 1em;"
						class="dropdown-content_content">이벤트</a>
				</div>
			</div>
			<div id="menu4" class="dropdown">
				<a>마이페이지</a>
				<div class="dropdown-content">
					<a style="font-size: 1em;" class="arrow"> ▲</a> <a
						href="../service?command=memberInfoForm" style="font-size: 1em;"
						class="dropdown-content_content">회원정보</a> 
						<a
						href="../service?command=reservationConfirmFrom"
						style="font-size: 1em;" class="dropdown-content_content">예약확인</a>
				</div>
			</div>
		</div>
	</div>

	<!-- 모든 화면에 고정 -->
</body>
</html>