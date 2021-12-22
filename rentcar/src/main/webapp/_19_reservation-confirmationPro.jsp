<%@page import="rentalCar.RentalCarDTO"%>
<%@page import="rentalCar.RentalCarDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="reservation.ReservationDAO"%>
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
	
	ReservationDAO reservationdao = ReservationDAO.getInstance();
	RentalCarDAO rentaldao = RentalCarDAO.getInstance();
	
	int carNo = Integer.parseInt(request.getParameter("carNo"));
	String userId = request.getParameter("userId");
	
	RentalCarDTO car = rentaldao.getCarInfo(carNo);
	int qty = car.getQty();
	
	// 예약 취소
	int result1 = reservationdao.cancelRes(userId, carNo);
	// 예약 취소에 성공하면 차 수량 다시 증가
	int result2 =	rentaldao.cancelReservation(qty, carNo);
	
	if(result1 == 2 && result2 == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('예약 취소에 실패하였습니다.')");
		script.println("history.back()"); 
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('예약이 취소되었습니다.')");
		script.println("history.back()"); 
		script.println("</script>");
	}
	%>
</body>
</html>