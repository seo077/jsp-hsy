<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메인</h1>
		<%
		String logId = (String)session.getAttribute("log");
		if( logId != null){%>
			<form method="post" action="LogoutPro">
				<h3>로그인 중인 회원 : <%=logId %></h3>
				<input type="submit" value="로그아웃">
			</form>
		<%	
		}
		%>
	<form method="post" action="Main">
		<input type="submit" value="로그인" name="dir">
		<input type="submit" value="회원가입" name="dir">
	</form>
	
</body>
</html>