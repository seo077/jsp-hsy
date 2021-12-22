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
	
    <link rel = "shortcut icon" href="css/img/logo.png" sizes="16x16 32x32 48x48">
  	<link rel="stylesheet" type="text/css" href="css/rent.css">
  	<link rel="stylesheet" type="text/css" href="css/res_confirm.css">
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
                    <a href="_13_short-term-rent.jsp?car_type=전체" style="font-size: 1em;" class="dropdown-content_content">단기렌터카 예약</a>
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
     <main class="cars">
              <!-- 차 상세 페이지로 넘어가기 전 일정 선택했는지 확인 + form.submit()-->
              <ul class="auto_grid">
				<%
		    	ReservationDAO redao = ReservationDAO.getInstance();
		    	RentalCarDAO rentaldao = RentalCarDAO.getInstance();
		    	
		    	ArrayList<ReservationDTO>res = redao.reservation_confirmation(logID);
		    	
		    	int size = res.size();
		    	for(int i=0;i<size;i++){
		    		int carNo = res.get(i).getCarNo();
		    		RentalCarDTO cars = rentaldao.getCarInfo(carNo);
		    	%>
	                  <li>
	                      <a href="_21_car_info.jsp?no=<%=cars.getNo() %>&startday=<%=res.get(i).getStartday() %>&endday=<%=res.get(i).getEndday() %>" class="car_info">
	                           <div class="car_img_wrap">
	                                <img src="<%=cars.getImg() %>" class="img">
                            	</div>
	                          <span><%=cars.getModelName() %></span>
	                          <span><Strong><%=cars.getPrice() %></Strong></span>
	                          <%int usein = cars.getUsein();
	                          	if(usein == 1){%>
	                          		<span style="color:red">보험 포함</span>
	                          	<%	
	                          	}else{%>
	                          		<span style="color:red">보험 미포함</span>
	                          <%} %>
	                      </a>
				          <a class="cancel_btn" href="_19_reservation-confirmationPro.jsp?carNo=<%=cars.getNo()%>&userId=<%=logID%>">예약취소</a>
	                  </li>
					<%	
					}
					%>
              </ul>
          </main>
          
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