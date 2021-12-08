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
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("date");
	String number = request.getParameter("number");
	String gender = request.getParameter("gender");
	%>
	<h1>환영합니다, <%=name %>님 !!!!!</h1>
	<h2><%=name %>님의 아이디 : <%=id %></h2>
	<h2><%=name %>님의 비밀번호 : <%=pw %></h2>
	<h2><%=name %>님의 생일 : <%=year %>년 <%=month %>월 <%=date %>일 </h2>
	<h2><%=name %>님의 성별 : <%=gender %></h2>
	<h2><%=name %>님의 전화번호 : <%=number %></h2>
</body>
</html>