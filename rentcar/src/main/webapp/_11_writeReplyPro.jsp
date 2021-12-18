<%@page import="comments.CommentsDAO"%>
<%@page import="comments.CommentsDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Calendar"%>
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
	CommentsDAO dao = CommentsDAO.getInstance();
	
	request.setCharacterEncoding("UTF-8");
	
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	String userId = String.valueOf(session.getAttribute("log"));
	String reply = request.getParameter("reply");
	
	Calendar cd = Calendar.getInstance();
	long time = cd.getTimeInMillis();
	Timestamp regdate = new Timestamp(time);
	
	CommentsDTO comment = new CommentsDTO(boardNo, userId,reply,regdate);
	dao.writeReply(comment);
	
	response.sendRedirect("_08_boardWrite.jsp");
	%>
</body>
</html>