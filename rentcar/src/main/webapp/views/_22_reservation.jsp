<%@page import="java.io.PrintWriter"%>
<%@page import="model.dto.RentalCarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.RentalCarDAO"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Green렌터카</title>

<link rel="shortcut icon" href="css/img/logo.png"
	sizes="16x16 32x32 48x48">
<link rel="stylesheet" type="text/css" href="../resources/css/rent.css">
<link rel="stylesheet" type="text/css" href="../resources/css/main_cars.css">
</head>
<body>
	<!-- 모든 화면에 고정 -->
	<%
	String logID = null;

	request.setCharacterEncoding("utf-8");
	RentalCarDAO rentdao = RentalCarDAO.getInstance();

	String userId = request.getParameter("userId");
	String no = request.getParameter("no");
	int usein = Integer.parseInt(request.getParameter("usein"));
	String type = request.getParameter("type");
	String startday = request.getParameter("startday");
	String endday = request.getParameter("endday");

	int num = Integer.parseInt(no);
	RentalCarDTO car = rentdao.getCarInfo(num);

	// 이미 로그인이 된 상태 => 메인페이지로
	if(session.getAttribute("log") != null){
		logID = (String)session.getAttribute("log");%>
	    <div class="nav" id="nav1">  
	        <a href="service?command=mainForm"><div id="logo"></div></a>
	        
	        <div class="nav-left" id="nav1-left">
	            <a><%=logID %>님 로그인 중..</a>
	            <a href="service?command=logout">로그아웃</a>
	            <a href="">고객센터</a>
	        </div>
	    </div>
	<% }else{%>
	    <div class="nav" id="nav1">  
	        <a href="service?command=mainForm"><div id="logo"></div></a>
	        
	        <div class="nav-left" id="nav1-left">
	            <a href="../service?command=loginForm">로그인</a>
	            <a href="service?command=validateForm">회원가입</a>
	            <a href="">고객센터</a>
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
                    <a style="font-size: 1em;" class="arrow"> ▲</a>
                    <a href="../service?command=carSearch&usein=-1&type=전체" style="font-size: 1em;" class="dropdown-content_content">단기렌터카 예약</a>
                    <a href="service?command=shortCarInfo" style="font-size: 1em;" class="dropdown-content_content">단기렌터카 안내</a>
                </div>
            </div>
            <div id="menu2" class="dropdown">
                <a>장기렌터카</a>
                <div class="dropdown-content">
                    <a style="font-size: 1em;" class="arrow"> ▲</a>
                    <a href="service?command=longCarRent" style="font-size: 1em;" class="dropdown-content_content">장기렌터카 예약</a>
                    <a href="service?command=longCarInfo" style="font-size: 1em;" class="dropdown-content_content">장기렌터카 안내</a>
                </div>
            </div>
            <div id="menu3" class="dropdown">
                <a>커뮤니티</a>
                <div class="dropdown-content">
                    <a style="font-size: 1em;" class="arrow"> ▲</a>
                    <a href="service?command=board" style="font-size: 1em;" class="dropdown-content_content">게시판</a>
                    <a href="service?command=event" style="font-size: 1em;" class="dropdown-content_content">이벤트</a>
                </div>
            </div>
            <div id="menu4" class="dropdown">
                <a>마이페이지</a>
                <div class="dropdown-content">
                    <a style="font-size: 1em;" class="arrow"> ▲</a>
                    <a href="service?command=memberInfoForm" style="font-size: 1em;" class="dropdown-content_content">회원정보</a>
                    <a href="service?command=reservationConfirmForm" style="font-size: 1em;" class="dropdown-content_content">예약확인</a>
                </div>
            </div>
        </div>
    </div>
	<!-- 모든 화면에 고정 -->
	<div class="container">
		<div class="cars_wrap">
          <nav class="sel">
                <input type="hidden" value="<%=type %>" id="type">
    			<input type="hidden" value="<%=usein %>" id="usein">
                 <div id="sel_schedule">
                     <h4><strong>일정 선택</strong></h4>
                     <%if(startday == null && endday == null){ %>
	                     	<span style="color:tomato">대여일 </span><input type="datetime-local" id="startday" style="cursor:pointer"><br>
	                     	<span style="color:tomato">반납일 </span><input type="datetime-local" id="endday" style="cursor:pointer">
                     <%}else{ %>
                     		<span style="color:tomato">대여일 </span><input type="datetime-local" id="startday" value="<%=startday %>" style="cursor:pointer"><br>
                     		<span style="color:tomato">반납일 </span><input type="datetime-local" id="endday" value="<%=endday%>" style="cursor:pointer">
                     <%} %>
                  	<div id="showtime">
                    	<span style="color:#fabb51">총 대여 시간 :</span><br>
                    	<span id="totaltime"></span>
                   	</div>
                 </div>
                 <div id="sel_insurance">
                     <h4><strong>보험 선택</strong></h4>
	                     <a class="usein1" onclick="selUsein(this)"  style="border: solid 1px lightgray; cursor:pointer">전체</a>
	                     <a class="usein2"  onclick="selUsein(this)" style="border: solid 1px lightgray; cursor:pointer">미포함</a>
	                     <a class="usein3" onclick="selUsein(this)" style="border: solid 1px lightgray; cursor:pointer">포함</a>
                 </div>
                 
                 <div id="sel_type">
                     <h4><strong>차종 선택</strong></h4>

	                     <div>
	                         <ul class="types">
	                             <li class="type1" onclick="selType(this)" style="cursor:pointer"><a>전체</a></li>
	                             <li class="type2" onclick="selType(this)" style="cursor:pointer"><a>경형</a></li>
	                             <li class="type3" onclick="selType(this)" style="cursor:pointer"><a>소형</a></li>
	                             <li class="type4" onclick="selType(this)" style="cursor:pointer"><a>중형</a></li>
	                         </ul>
	                         <ul class="types">
	                             <li class="type5" onclick="selType(this)" style="cursor:pointer"><a>고급</a></li>
	                             <li class="type6" onclick="selType(this)" style="cursor:pointer"><a>SUV</a></li>
	                             <li class="type7" onclick="selType(this)" style="cursor:pointer"><a>승합</a></li>
	                             <li class="type8" onclick="selType(this)" style="cursor:pointer"><a style="font-size: 0.8em;">특가할인</a></li>
	                         </ul>
	                     </div>
                 </div>
          </nav>

			<main class="cars">
				<a
					href="service?command=reservation&no=<%=num%>&startday=<%=startday%>&endday=<%=endday%>"
					style="background-color: tomato">예약/결제</a>
			</main>
		</div>
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
    <script type="text/javascript" src="../resources/js/search.js"></script>
</body>
</html>