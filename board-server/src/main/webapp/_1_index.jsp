<%@page import="user.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        span{white-space: pre;}
    </style>
    <title>Green</title>
</head>
<body>

	<%
	UserDAO dao = UserDAO.getInstance();
	ArrayList<UserDTO> datas = dao.getUsers();
	
	for(int i=0;i<datas.size();i++){
		UserDTO user = datas.get(i);
		System.out.println(String.format("%s %s %s", user.getId(),user.getPw(),user.getRegDate()));
	}
	
	
	%>
	<h1>인덱스 페이지</h1>
        <input type="button" id="login" value="login" >
        <input type="button" id="join" value="join" >

    
    <script>
    	document.querySelector('input#login').addEventListener('click', e=>{
    		location.href='_5_login.jsp';
    	});
    	document.querySelector('input#join').addEventListener('click', e=>{
    		location.href='_3_join.jsp';
    	});
    </script>
</body>
</html>