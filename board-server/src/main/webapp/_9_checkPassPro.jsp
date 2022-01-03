
<%@page import="user.UserDAO"%>
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
	// 권한이 필요한 수정/탈퇴 처리 담당
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	
		UserDAO dao = UserDAO.getInstance();
		if(dao.deleteUser(id, pw)==-1){
			response.sendRedirect("_8_checkPass.jsp");
			
		}else{
			// 탈퇴 성공
			session.removeAttribute("log");
			response.sendRedirect("_1_index.jsp");
		}
	
	%>
</body>
</html>