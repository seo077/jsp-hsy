<%@page import="java.io.PrintWriter"%>
<%@page import="model.dto.RentalCarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.RentalCarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <meta property="og:title" content="Green렌터카">
	<meta property="og:description" content=".">
	<meta property="og:image" content="../resources/imgs/logo.png">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Green렌터카</title>
	
    <link rel = "shortcut icon" href="../resources/imgs/logo.png" sizes="16x16 32x32 48x48">
  	<link rel="stylesheet" type="text/css" href="../resources/css/rent.css">
  	<link rel="stylesheet" type="text/css" href="../resources/css/main_cars.css">
</head>
<body>
    <%
	// 로그인이 되어 있지 않음. => 로그인 페이지로
 String logID = null;
	if (session.getAttribute("log") == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후 이용해 주세요.')");
		script.println("location.href='../service?command=loginForm&next=short'");
		script.println("</script>");
	}

    RentalCarDAO rentdao = RentalCarDAO.getInstance();
    ArrayList<RentalCarDTO>cars = null;
	
    request.setCharacterEncoding("utf-8");
    int usein = Integer.parseInt(request.getParameter("usein"));
    String type = request.getParameter("type");
   	String startday = null;
   	String endday = null;
   	
    if(request.getParameter("startday") != null && request.getParameter("endday") != null) {
	 	startday = request.getParameter("startday");
	 	endday = request.getParameter("endday");

	}
 	
 	if(usein == -1){
	 	cars = rentdao.getcars(type);
 	}else{
	   	usein = Integer.parseInt(request.getParameter("usein"));
	 	cars = rentdao.getcars(usein,type);
 	}
 	
    int size = cars.size();
    %>
    
 	<c:import url="header.jsp"></c:import>
    <div class="container">
      <div class="cars_wrap">
          <nav class="sel">
                <input type="hidden" value="<%=type %>" id="type">
    			<input type="hidden" value="<%=usein %>" id="usein">
                 <div id="sel_schedule">
                     <h4><strong>일정 선택</strong></h4>
                     <%if(startday == null && endday == null){ %>
	                     	<span style="color:tomato">대여일 </span><input type="datetime-local" onchange="totalTime()" id="startday" style="cursor:pointer"><br>
	                     	<span style="color:tomato">반납일 </span><input type="datetime-local" onchange="totalTime()" id="endday" style="cursor:pointer">
                     <%}else{ %>
                     		<span style="color:tomato">대여일 </span><input type="datetime-local" onchange="totalTime()" id="startday" value="<%=startday %>" style="cursor:pointer"><br>
                     		<span style="color:tomato">반납일 </span><input type="datetime-local" onchange="totalTime()" id="endday" value="<%=endday%>" style="cursor:pointer">
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
              <!-- 차 상세 페이지로 넘어가기 전 일정 선택했는지 확인 + form.submit()-->
              <ul class="auto_grid">
					<%
					if(size == 0){%>
						<h2 style="margin:10px">차량이 없습니다.</h2>
					<%
					}else{
						for(int i=0;i<size;i++){%>
		                  <li>
		                  	<input type="hidden" value="<%=cars.get(i).getQty()%>" id="<%=cars.get(i).getNo()%>">
		                      <div onclick="car_info(this)"  id="<%=cars.get(i).getNo() %>" class="car_info">
		                           <div class="car_img_wrap">
		                           		<%int isdiscount = cars.get(i).getIsdiscount();
					                          if(isdiscount == 1){%>
				                                <span class="discount">특가할인</span>
			                          	<%	
			                          	}
			                          	%>
		                           		<%int qty = cars.get(i).getQty();
					                          if(qty< 0){%>
					                               <span class="soldout">마감</span>
				                               
			                          	<%	
			                          	}
			                          	%>
		                                <img src="<%=cars.get(i).getImg() %>" class="img">
	                            	</div>
		                          <span><%=cars.get(i).getModelName() %></span>
		                          <span><Strong><%=cars.get(i).getPrice() %></Strong></span>
		        					<%
		                          	if(cars.get(i).getUsein() == 1){%>
		                          		<span style="color:red">보험 포함</span>
		                          	<%	
		                          	}else{%>
		                          		<span style="color:red">보험 미포함</span>
		                          <%} %>
		                      </div>
		                  </li>
						<%
						}
					}
				%>
              </ul>
          </main>
      </div>
  </div>
     	<c:import url="footer.jsp"></c:import>

    <script src="../resources/js/main_cars.js"></script>
    <script type="text/javascript" src="../resources/js/search.js"></script>
</body>
</html>