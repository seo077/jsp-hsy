<%@page import="rentalCar.RentalCarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="rentalCar.RentalCarDAO"%>
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
	
    <link rel = "shortcut icon" href="css/img/logo.png" sizes="16x16 32x32 48x48">
  	<link rel="stylesheet" type="text/css" href="css/rent.css">
  	<link rel="stylesheet" type="text/css" href="css/main_cars.css">
</head>
<body>
    <!-- 모든 화면에 고정 -->
    <%
    
    RentalCarDAO rentdao = RentalCarDAO.getInstance();
	
    String userId = request.getParameter("userId");
	String no = request.getParameter("no");
  	String startday = request.getParameter("startday");
  	String endday = request.getParameter("endday");
 	
  	int num = Integer.parseInt(no);
  	RentalCarDTO car = rentdao.getCarInfo(num);
    
	// 이미 로그인이 된 상태 => 메인페이지로
	String logID = null;
	if(session.getAttribute("log") != null){
		logID = (String)session.getAttribute("log");%>
	    <div class="nav" id="nav1">  
	        <a href="_04_main.jsp"><div id="logo"></div></a>
	        
	        <div class="nav-left" id="nav1-left">
	            <a><%=logID %>님 로그인 중..</a>
	            <a href="_05_logout.jsp">로그아웃</a>
	            <a href="">고객센터</a>
	        </div>
	    </div>
	<% }else{%>
	    <div class="nav" id="nav1">  
	        <a href="_04_main.jsp"><div id="logo"></div></a>
	        
	        <div class="nav-left" id="nav1-left">
	            <a href="_03_login.jsp">로그인</a>
	            <a href="_01_validate.jsp">회원가입</a>
	            <a href="">고객센터</a>
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
                    <a style="font-size: 1em;" class="arrow"> ▲</a>
                    <a href="_13_short-term-rent.jsp" style="font-size: 1em;" class="dropdown-content_content">단기렌터카 예약</a>
                    <a href="_14_short-term-guide.jsp" style="font-size: 1em;" class="dropdown-content_content">단기렌터카 안내</a>
                </div>
            </div>
            <div id="menu2" class="dropdown">
                <a href="_04_main.jsp">장기렌터카</a>
                <div class="dropdown-content">
                    <a style="font-size: 1em;" class="arrow"> ▲</a>
                    <a href="_15_long-term-rent.jsp" style="font-size: 1em;" class="dropdown-content_content">장기렌터카 예약</a>
                    <a href="_16_long-term-guide.jsp" style="font-size: 1em;" class="dropdown-content_content">장기렌터카 안내</a>
                </div>
            </div>
            <div id="menu3" class="dropdown">
                <a href="_04_main.jsp">커뮤니티</a>
                <div class="dropdown-content">
                    <a style="font-size: 1em;" class="arrow"> ▲</a>
                    <a href="_06_board.jsp" style="font-size: 1em;" class="dropdown-content_content">게시판</a>
                    <a href="_17_event.jsp" style="font-size: 1em;" class="dropdown-content_content">이벤트</a>
                </div>
            </div>
            <div id="menu4" class="dropdown">
                <a href="_04_main.jsp">마이페이지</a>
                <div class="dropdown-content">
                    <a style="font-size: 1em;" class="arrow"> ▲</a>
                    <a href="_18_member-info.jsp" style="font-size: 1em;" class="dropdown-content_content">회원정보</a>
                    <a href="_19_reservation-confirmation.jsp" style="font-size: 1em;" class="dropdown-content_content">예약확인</a>
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
      <div class="cars_wrap">
          <nav class="sel">
                 <div id="sel_schedule">
                     <h4><strong>일정 선택</strong></h4>
                     <span style="color:tomato">대여일 </span><span><%=startday %></span><br>
                     <span style="color:tomato">반납일 </span><span><%=endday %></span>
                 </div>
                 <div id="sel_insurance">
                     <h4><strong>보험 선택</strong></h4>
                     <a href="_13_short-term-rent.jsp?usein=0&startday=<%=startday %>&endday=<%=endday %>" style="border: solid 1px lightgray;">미포함</a>
                     <a href="_13_short-term-rent.jsp?usein=1&startday=<%=startday %>&endday=<%=endday %>" style="border: solid 1px lightgray;">포함</a>
                 </div>
                 
                 <div id="sel_type">
                     <h4><strong>차종 선택</strong></h4>
                     <div>
                         <ul class="types">
                             <li><a href="_13_short-term-rent.jsp?car_type=전체&startday=<%=startday %>&endday=<%=endday %>">전체</a></li>
                             <li><a href="_13_short-term-rent.jsp?car_type=경형&startday=<%=startday %>&endday=<%=endday %>">경형</a></li>
                             <li><a href="_13_short-term-rent.jsp?car_type=소형&startday=<%=startday %>&endday=<%=endday %>">소형</a></li>
                             <li><a href="_13_short-term-rent.jsp?car_type=중형&startday=<%=startday %>&endday=<%=endday %>">중형</a></li>
                         </ul>
                         <ul class="types">
                             <li><a href="_13_short-term-rent.jsp?car_type=고급&startday=<%=startday %>&endday=<%=endday %>">고급</a></li>
                             <li><a href="_13_short-term-rent.jsp?car_type=SUV&startday=<%=startday %>&endday=<%=endday %>">SUV</a></li>
                             <li><a href="_13_short-term-rent.jsp?car_type=승합&startday=<%=startday %>&endday=<%=endday %>">승합</a></li>
                             <li><a href="_13_short-term-rent.jsp?isdiscount=1&startday=<%=startday %>&endday=<%=endday %>" style="font-size: 0.8em;">특가할인</a></li>
                         </ul>
                     </div>
                 </div>
          </nav>
         
          <main class="cars">
             
            <a href="_22_reservationPro.jsp?no=<%=num%>&startday=<%=startday%>&endday=<%=endday %>" style="background-color:tomato">예약/결제</a>
        </main>
      </div>
  </div>

		
		

    
    <!-- 모든 화면에 고정 -->
    <footer>
        <div id="info1">
            <span><strong>고객센터</strong></span><br><br>
            <div class="btns">
	            <div id="phone_img"></div>
	            <span><strong>  02-123-1234</strong></span><br>
            </div>
            <span>평일 : 오전9시~오후6시</span><br>
            <span>토 : 오전9시~오후3시</span>
        </div>
        
        <div id="info2">
            <span><strong>Green렌터카 앱 설치</strong></span><br><br>
            <div class="btns">
                <a href=""><div id="google"></div></a>
                <a href=""><div id="apple"></div></a>
            </div>
        </div>
        
        <div id="info3">
             <span><strong>Green렌터카 SNS</strong></span><br><br>  
             <div class="btns">
                <a href=""><div id="facebook"></div></a>
                <a href=""><div id="insta"></div></a>
                <a href=""><div id="youtube"></div></a>
                <a href=""><div id="naver"></div></a>
                <a href=""><div id="naver_blog"></div></a>
            </div> 
        </div>
    </footer>
    <!-- 모든 화면에 고정 -->

</body>
</html>