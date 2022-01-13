<%@page import="model.dto.ReservationDTO"%>
<%@page import="model.dto.RentalCarDTO"%>
<%@page import="model.dao.RentalCarDAO"%>
<%@page import="model.dao.ReservationDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>

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
	<meta property="og:image" content="../resources/css/img/logo.png">
    <title>Green렌터카</title>
	
    <link rel = "shortcut icon" href="css/img/logo.png" sizes="16x16 32x32 48x48">
  	<link rel="stylesheet" type="text/css" href="../resources/css/rent.css">
  	<link rel="stylesheet" type="text/css" href="../resources/css/res_confirm.css">
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
		script.println("location.href='../service?command=loginForm&next=reservationConfirm'");
		script.println("</script>");
	}
	%>
    <c:import url="header.jsp"></c:import>
    <div class="container">
     <main class="cars">
              <!-- 차 상세 페이지로 넘어가기 전 일정 선택했는지 확인 + form.submit()-->
              <ul class="auto_grid">
				<%
		    	ReservationDAO redao = ReservationDAO.getInstance();
		    	RentalCarDAO rentaldao = RentalCarDAO.getInstance();
		    	
		    	ArrayList<ReservationDTO>res = redao.reservation_confirmation(logID);
		    	
		    	int size = res.size();
		    	%>
		    	
		    	<c:choose>
		    		<c:when test="${size == 0 }">
		    			<h2>예약한 차량이 없습니다.</h2>
		    		</c:when>
		    		<c:otherwise>
		    		
		    				<%
		    				for(int i=0;i<size;i++){
				    		int carNo = res.get(i).getCarNo();
				    		RentalCarDTO cars = rentaldao.getCarInfo(carNo);
		    				%>
			                  <li>
			                      <a href="service?command=carInfo&no=<%=cars.getNo() %>&startday=<%=res.get(i).getStartday() %>&endday=<%=res.get(i).getEndday() %>" class="car_info">
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
						          <a class="cancel_btn" href="service?command=reservationConfirm&carNo=<%=cars.getNo()%>">예약취소</a>
			                  </li>
		    				<%} %>

		    		</c:otherwise>
		    	</c:choose>
				
              </ul>
          </main>
          
    </div>
    
    <c:import url="footer.jsp"></c:import>
    
</body>
</html>