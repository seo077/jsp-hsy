<%@page import="java.io.PrintWriter"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Green렌터카</title>
</head>
<body>
	<%
	// 로그인
	MemberDAO dao = MemberDAO.getInstance();
	
	request.setCharacterEncoding("UTF-8");
	
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals("") || id == null || pw.equals("") || pw == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디와 비밀번호를 정확하게 입력하세요.')");
		script.println("history.back()"); 
		script.println("</script>");
	}
	
	int result = dao.login(id,pw);
	
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		session.setAttribute("log", id);
		script.println("location.href='_4_main.jsp'"); 
		script.println("</script>");
	}else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()"); 
		script.println("</script>");
	}else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()"); 
		script.println("</script>");
	}else if(result == -3){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류')");
		script.println("history.back()"); 
		script.println("</script>");
	}
	%>

</body>
</html>