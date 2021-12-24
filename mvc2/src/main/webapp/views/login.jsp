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
	<h1>로그인 페이지</h1>
	<form method="post" action="LoginPro">
        <h1>login</h1>
        <span>id:&#9;</span><input type="text" name = "id"><br>
        <span>pw:&#9;</span><input type="text" name = "pw"><br>
        <input type="submit" value="login">
    </form>
</body>
</html>