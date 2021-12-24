<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <style>
      span{white-space:pre;}
      h1{
          color: rgb(59,170,59);
      }
      input[type="text"]{
          padding: 10px;
          border: solid 2px rgb(59,170,59);
      }
      
  </style>
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입 페이지</h1>
	<form method="post" action="JoinPro">
        <h1>join</h1>
        <span>id:&#9;</span><input type="text" name = "id"><br>
        <span>pw:&#9;</span><input type="text" name = "pw"><br>
        <span>name:&#9;</span><input type="text" name = "name"><br>
        <input type="submit" value="join">
    </form>
</body>
</html>