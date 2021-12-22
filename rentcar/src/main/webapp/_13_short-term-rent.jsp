<%@page import="java.io.PrintWriter"%>
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
	// 로그인이 되어 있지 않음. => 메인페이지로
	String logID = null;
	if (session.getAttribute("log") == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후 이용해 주세요.')");
		script.println("location.href='_03_login.jsp'");
		script.println("</script>");
	}
	
    RentalCarDAO rentdao = RentalCarDAO.getInstance();
    ArrayList<RentalCarDTO>cars = null;
	
 	String tempCar_type = request.getParameter("car_type");
 	String tempusein = request.getParameter("usein");
 	String tempisdiscount = request.getParameter("isdiscount");
 	
    
 	if(tempCar_type != null){
	 	if(tempCar_type.equals("전체")){
	 		cars = rentdao.getcars();
	 	}else{
		    cars = rentdao.getType_car(tempCar_type);
	 	}
 	}else if(tempusein != null){
 		int useinInt = Integer.parseInt(tempusein);
 		cars = rentdao.getusein_car(useinInt);
 	}else if(tempisdiscount != null){
 		int isdiscountInt = Integer.parseInt(tempisdiscount);
 		cars = rentdao.getdiscount_car(isdiscountInt);
 	}else{
	 		cars = rentdao.getcars();
 		
 	}
    
 	String startstart = request.getParameter("startday");
 	String endend = request.getParameter("endday");
 	
    int size = cars.size();
    
	// 이미 로그인이 된 상태 => 메인페이지로

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
                     <%if(startstart == null && endend == null){ %>
	                     	<span style="color:tomato">대여일 </span><input type="date" id="startday"><br>
	                     	<span style="color:tomato">반납일 </span><input type="date" id="endday">
                     <%}else{ %>
                     		<span style="color:tomato">대여일 </span><input type="date" id="startday" value="<%=startstart %>"><br>
                     		<span style="color:tomato">반납일 </span><input type="date" id="endday" value="<%=endend%>">
                     <%} %>
                 </div>
                 <div id="sel_insurance">
                     <h4><strong>보험 선택</strong></h4>
                     <%if(startstart == null && endend == null){ %>
	                     <a href="_13_short-term-rent.jsp?usein=0" style="border: solid 1px lightgray;">미포함</a>
	                     <a href="_13_short-term-rent.jsp?usein=1" style="border: solid 1px lightgray;">포함</a>
                     <%}else{ %>
	                     <a href="_13_short-term-rent.jsp?usein=0&startday=<%=startstart %>&endday=<%=endend %>" style="border: solid 1px lightgray;">미포함</a>
	                     <a href="_13_short-term-rent.jsp?usein=1&startday=<%=startstart %>&endday=<%=endend %>" style="border: solid 1px lightgray;">포함</a>
                     	
                     <%} %>
                 </div>
                 
                 <div id="sel_type">
                     <h4><strong>차종 선택</strong></h4>
                     <%if(startstart == null && endend == null){ %>
	                     <div>
	                         <ul class="types">
	                             <li><a href="_13_short-term-rent.jsp?car_type=전체">전체</a></li>
	                             <li><a href="_13_short-term-rent.jsp?car_type=경형">경형</a></li>
	                             <li><a href="_13_short-term-rent.jsp?car_type=소형">소형</a></li>
	                             <li><a href="_13_short-term-rent.jsp?car_type=중형">중형</a></li>
	                         </ul>
	                         <ul class="types">
	                             <li><a href="_13_short-term-rent.jsp?car_type=고급">고급</a></li>
	                             <li><a href="_13_short-term-rent.jsp?car_type=SUV">SUV</a></li>
	                             <li><a href="_13_short-term-rent.jsp?car_type=승합">승합</a></li>
	                             <li><a href="_13_short-term-rent.jsp?isdiscount=1" style="font-size: 0.8em;">특가할인</a></li>
	                         </ul>
	                     </div>
                     <%}else{ %>
	                     <div>
	                         <ul class="types">
	                             <li><a href="_13_short-term-rent.jsp?car_type=전체&startday=<%=startstart %>&endday=<%=endend %>">전체</a></li>
	                             <li><a href="_13_short-term-rent.jsp?car_type=경형&startday=<%=startstart %>&endday=<%=endend %>">경형</a></li>
	                             <li><a href="_13_short-term-rent.jsp?car_type=소형&startday=<%=startstart %>&endday=<%=endend %>">소형</a></li>
	                             <li><a href="_13_short-term-rent.jsp?car_type=중형&startday=<%=startstart %>&endday=<%=endend %>">중형</a></li>
	                         </ul>
	                         <ul class="types">
	                             <li><a href="_13_short-term-rent.jsp?car_type=고급&startday=<%=startstart %>&endday=<%=endend %>">고급</a></li>
	                             <li><a href="_13_short-term-rent.jsp?car_type=SUV&startday=<%=startstart %>&endday=<%=endend %>">SUV</a></li>
	                             <li><a href="_13_short-term-rent.jsp?car_type=승합&startday=<%=startstart %>&endday=<%=endend %>">승합</a></li>
	                             <li><a href="_13_short-term-rent.jsp?isdiscount=1&startday=<%=startstart %>&endday=<%=endend %>" style="font-size: 0.8em;">특가할인</a></li>
	                         </ul>
	                     </div>
                     <%} %>
                 </div>
          </nav>
          <main class="cars">
              <!-- 차 상세 페이지로 넘어가기 전 일정 선택했는지 확인 + form.submit()-->
              <ul class="auto_grid">
					<%
					
					for(int i=0;i<size;i++){%>
	                  <li>
	                      <div onclick="car_info(this)"  id="<%=cars.get(i).getNo() %>" class="car_info">
	                           <div class="car_img_wrap">
	                           		<%int isdiscount = cars.get(i).getIsdiscount();
				                          if(isdiscount == 1){%>
			                                <span class="discount">특가할인</span>
		                          	<%	
		                          	}
		                          	%>
	                           		<%int qty = cars.get(i).getQty();
				                          if(qty == 0){%>
				                               <span class="soldout">마감</span>
			                               
		                          	<%	
		                          	}
		                          	%>
	                                <img src="<%=cars.get(i).getImg() %>" class="img">
                            	</div>
	                          <span><%=cars.get(i).getModelName() %></span>
	                          <span><Strong><%=cars.get(i).getPrice() %></Strong></span>
	                          <%int usein = cars.get(i).getUsein();
	                          	if(usein == 1){%>
	                          		<span style="color:red">보험 포함</span>
	                          	<%	
	                          	}else{%>
	                          		<span style="color:red">보험 미포함</span>
	                          <%} %>
	                      </div>
	                  </li>
					<%	
					}
					%>
              </ul>
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
    <script src="js/main_cars.js"></script>
</body>
</html>