<%@page import="java.util.Date"%>
<%@page import="model.dto.ReviewDTO"%>
<%@page import="model.dao.ReviewDAO"%>
<%@page import="model.dto.RentalCarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.RentalCarDAO"%>
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
	<meta property="og:image" content="css/img/logo.png">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Green렌터카</title>
	
    <link rel = "shortcut icon" href="css/img/logo.png" sizes="16x16 32x32 48x48">
  	<link rel="stylesheet" type="text/css" href="../resources/css/rent.css">
  	<link rel="stylesheet" type="text/css" href="../resources/css/main_cars.css">
  	<link rel="stylesheet" type="text/css" href="../resources/css/detail_car.css">
</head>
<body>
    <!-- 모든 화면에 고정 -->
    <%
    
    RentalCarDAO rentdao = RentalCarDAO.getInstance();
	
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");
	int usein = Integer.parseInt(request.getParameter("usein"));
	String type = request.getParameter("type");
	String startday =request.getParameter("startday");
  	String endday = request.getParameter("endday");
 	
  	int num = Integer.parseInt(no);
  	RentalCarDTO car = rentdao.getCarInfo(num);
    
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
              <div style="display: flex; margin: 10px;">
                  <img src="<%=car.getImg() %>" width="50%" height="40%">
                  <div class="info" style="margin: 3%;">
                      <h2 style="margin-bottom: 10px;"><%=car.getModelName() %></h2>
                      <span style="margin-top: 10px;">#<%=car.getFuel() %> #<%=car.getUsepeople() %>인승 #<%=car.getQty() %>개 남음.</span>
                      <div style="border-top: solid 1px; border-bottom: solid 1px; margin: 10px;">
                            <ul style="list-style: circle; padding: 10px; ">
                                <li>금연차량</li>
                                <%if(car.getUsein() == 1){ %>
                                	<li>완전면책포함(사고1건 350만원 한도 적용)</li>
                                <%}else{ %>
                                	<li>보험 미포함</li>
                                <%} %>
                                <li>조기반납 환불불가</li>
                                <li>색상 배정 및 차량 옵션은 상이 할 수 있음.</li>
                            </ul>
                      </div>
                      <strong class="car_price"><%=car.getPrice() %></strong>
                      <a class="reserve_btn" href="service?command=reservationForm&no=<%=car.getNo()%>&usein=<%=usein %>&type=<%=type %>&startday=<%=startday%>&endday=<%=endday%>">예약하기</a>
                  </div>
              </div>
             
              <div>
                  <div class="table_div">
                      <table class="table" border="1px #eeeeee">
                          <thead>
                              <tr>
                                  <th style="background-color: #eeeeee">연료</th>
                                  <th><%=car.getFuel() %></th>
                                  <th style="background-color: #eeeeee">인원</th>
                                  <th><%=car.getUsepeople() %></th>
                                  <th style="background-color: #eeeeee">연식</th>
                                  <th><%=car.getOlds() %></th>
                              </tr>
                          </thead>
                          <tbody style="min-height: 70%;">
                              <tr>
                                  <th style="background-color: #eeeeee;  min-height: 100%;">옵션</th>
                                  <th  style="min-height: 100%; text-align: left; padding-left: 10px;" colspan="5">
                                  		<%if(car.getUsenavi() == 1){ %>
		                                      <span class="option">네비게이션</span>
                               		 	<%}%>
                                  		<%if(car.getUseseat() == 1){ %>
		                                      <span class="option">베이비시트</span>
                               		 	<%}%>
                                  		<%if(car.getUsewifi() == 1){ %>
		                                      <span class="option">와이파이</span>
                               		 	<%}%>
                                  		<%if(car.getUserearcam() == 1){ %>
		                                      <span class="option">후방카메라</span>
                               		 	<%}%>
                                  		<%if(car.getUsehi_pass() == 1){ %>
		                                      <span class="option">하이패스</span>
                               		 	<%}%>
                                  		<%if(car.getUseblack_box() == 1){ %>
		                                      <span class="option">블랙박스</span>
                               		 	<%}%>
                                	
                                    
                                  </th>
                              </tr>
                          </tbody>
                      </table>
     
                  </div>
                
             </div>

             <div style="border-top: solid 1px lightgray; margin: 10px;">
                 <h2 id="table_title">REVIEW</h2>
                 <div class="table_div">
                     <table class="table">
                         <thead>
                             <tr>
                                 <th style="background-color: #eeeeee; width: 10%;">번호</th>
                                 <th style="background-color: #eeeeee; width: 20%;">작성자</th>
                                 <th style="background-color: #eeeeee; width: 50%; " >리뷰</th>
                                 <th style="background-color: #eeeeee; width: 20%; " >작성날짜</th>

                             </tr>
                         </thead>
                         <tbody>
                             <%
                             ReviewDAO reviewdao = ReviewDAO.getInstance();
                             ArrayList<ReviewDTO>reviews = reviewdao.getReviews(car.getNo());
                             int size = reviews.size();
                             
                             for(int i=0;i<size;i++){
                             %>
		                       <tr>
									<td><%=i+1%></td>
									<%if(reviews.get(i).getRealuser() == 1){ %>
										<td><%=reviews.get(i).getUserId()%><span style="color:blue;">[실구매자]</span></td>	
									<%}else{ %>
										<td><%=reviews.get(i).getUserId()%></td>	
									<%} %>
									<td><%=reviews.get(i).getReview()%></td>
									<%String temp = String.valueOf(reviews.get(i).getRegdate()); %>
									<td><%=temp.substring(0,11)+temp.substring(11,13)+"시"+temp.substring(14,16)+"분" %></td>
								</tr>
                             <%} %>
                            
                         </tbody>
                     </table>
 
                 </div>
                 <div id="reply_form">
                    <form method="post" action="service?command=review&no=<%=car.getNo()%>&type=<%=type %>&usein=<%=usein %>&startday=<%=startday %>&endday=<%=endday %>">
                        <input type="text" placeholder="리뷰를 입력하세요." name="review" style="width: 65%; padding:10px">
                        <input type="submit" value="작성" style=" padding:8px">
                    </form>
                </div>

             </div>
         
            
        </main>
        </div>
  </div>

		
	<c:import url="footer.jsp"></c:import>
    <script type="text/javascript" src="../resources/js/search.js"></script>
</body>
</html>