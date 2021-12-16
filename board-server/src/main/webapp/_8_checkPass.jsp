<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>update & delete 권한확인</h1>
    <form method="post" action="_9_checkPassPro.jsp">
        <span>id:&#9;</span><input type="text" name ="id" value=<%=session.getAttribute("log") %>><br><br>
        <span>pw:&#9;</span><input type="text" name ="pw"><br><br>
		<input type="submit">
    </form>
</body>
</html>