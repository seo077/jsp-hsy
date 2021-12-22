<%@page import="java.io.PrintWriter"%>
<%@page import="review.ReviewDTO"%>
<%@page import="review.ReviewDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Calendar"%>
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
	request.setCharacterEncoding("utf-8");
	
	String review = request.getParameter("review");
	
	if(review == null || review == ""){
		System.out.println("sdfsdf");
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('리뷰를 입력하세요.')");
		script.println("history.back()"); 
		script.println("</script>");
	}
	
		ReservationDAO redao = ReservationDAO.getInstance();
		ReviewDAO reviewdao = ReviewDAO.getInstance();
		
		int carNo = Integer.parseInt(request.getParameter("no"));
		String userId = String.valueOf(session.getAttribute("log"));
		int realuser  = 0;
		String startday = request.getParameter("startday");
	  	String endday = request.getParameter("endday");
		
		boolean realUser = redao.realUser(carNo, userId);
		if(realUser){
			realuser = 1;
		}
		
		Calendar cd = Calendar.getInstance();
		long time = cd.getTimeInMillis();
		Timestamp regdate = new Timestamp(time);
		
		ReviewDTO reply = new ReviewDTO(carNo,userId,review,regdate,realuser);
		reviewdao.writeReview(reply);
		
	
		String url = String.format("_21_car_info.jsp?no=%d&startday=%s&endday=%s",carNo,startday,endday);
		response.sendRedirect(url);

	
	%>

</body>
</html>