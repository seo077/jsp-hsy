<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Calendar"%>
<%@page import="reply.ReplyDTO"%>
<%@page import="reply.ReplyDAO"%>
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
 	
	Calendar cd = Calendar.getInstance();
	long time = cd.getTimeInMillis();
	Timestamp regdate = new Timestamp(time);
	
 	String id = String.valueOf(session.getAttribute("log"));
	String content= request.getParameter("reply");

	ReplyDAO dao = ReplyDAO.getInstance();
	
	ReplyDTO reply = new ReplyDTO(id,content,regdate);
	dao.addReply(reply);
	
	response.sendRedirect("_12_boardView.jsp");
 	%>
</body>
</html>