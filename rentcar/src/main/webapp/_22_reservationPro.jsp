<%@page import="review.ReviewDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="reservation.ReservationDAO"%>
<%@page import="rentalCar.RentalCarDTO"%>
<%@page import="rentalCar.RentalCarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	RentalCarDAO rentalcardao = RentalCarDAO.getInstance();
	
	String userId = (String)session.getAttribute("log");
	int no = Integer.parseInt(request.getParameter("no"));
	String startday = (String)request.getParameter("startday");
	String endday = (String)request.getParameter("endday");
	
	Calendar c = Calendar.getInstance();
	long time = c.getTimeInMillis();
	Timestamp regdate = new Timestamp(time);
	
	//reservationdao -> 등록
	ReservationDAO reservationdao = ReservationDAO.getInstance();
	int result1 = reservationdao.reservation(no, userId, startday, endday, regdate);
	
	//rentalCardao -> 차 수량 줄이기
	RentalCarDTO car = rentalcardao.getCarInfo(no);
	int qty = car.getQty();
	int result2 = rentalcardao.reservation(no, qty);
	
	//실구매자로 전환
	ReviewDAO reviewdao = ReviewDAO.getInstance();
	reviewdao.turnReal(no,userId);
	
	if(result1 == -2 || result2 == -2){		//예약 실패
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('예약을 실패하였습니다.')");
		script.println("history.back()"); 
		script.println("</script>");
	}else{          // 예약 성공!
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('예약을 성공하였습니다.')");
		script.println("location.href = '_04_main.jsp';"); 
		script.println("</script>");
	} 
	%>
</body>
</html>