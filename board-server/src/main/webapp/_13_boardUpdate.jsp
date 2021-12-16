<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<%

	BoardDAO dao = BoardDAO.getInstance();

	int no = Integer.parseInt(request.getParameter("no"));
	BoardDTO board = dao.getBoardOne(no);
%>

<h1>게시글 수정하기</h1>
   <form method="post" action="_14_boardUpdatePro.jsp?no=<%=no%>">
	   <span>아이디 :&#9;</span><input type="text" name="id" value=<%=session.getAttribute("log") %>><br>
	   <span>게시글비밀번호 :&#9;</span><input type="text" name="pw" value=<%=board.getPw() %>><br>
	   <span>제목 :&#9;</span><input type="text" name="title" value=<%=board.getTitle() %>><br><br>
	   <span>내용을 입력하세요</span><br><textarea cols="50px" rows="20px" name="content"><%=board.getContent() %></textarea><br>
	   <input type="submit" value="제출하기">
   </form>
   
</body>
</html>