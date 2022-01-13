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
<meta property="og:image" content="../resources/css/img/logo.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Green렌터카</title>

<link rel="shortcut icon" href="css/img/logo.png"
	sizes="16x16 32x32 48x48">
<link rel="stylesheet" type="text/css" href="../resources/css/rent.css">
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

	%>
	<c:import url="header.jsp"></c:import>
	<div class="container">
		<input type="hidden" value="${startday }" id="starttime">
		<input type="hidden" value="${endday }" id="endtime">
		<input type="hidden" value="<%=car.getPrice() %>" id="onedayPrice">

        <div class="table_div">
            <table class="table" border="1px #eeeeee">
                <thead>
                    <tr>
                        <th style="background-color: #eeeeee">대여일</th>
                        <th id="total"></th>
                        <th style="background-color: #eeeeee">결제 금액</th>
                        <th id="totalPrice"></th>
                    </tr>
                </thead>
            </table>

        </div>
      
	
	             
				<a href="service?command=reservation&no=<%=num%>&startday=<%=startday%>&endday=<%=endday%>"
					style="background-color: tomato">결제하기</a>
					
		</div>



	<c:import url="footer.jsp"></c:import>
    <script type="text/javascript" src="../resources/js/search.js"></script>
    <script type="text/javascript" src="../resources/js/pay.js"></script>
</body>
</html>