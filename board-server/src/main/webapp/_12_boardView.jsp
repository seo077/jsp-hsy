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
 	
	String temp = request.getParameter("no");
	System.out.println(temp);
 	int no = Integer.parseInt(temp);
 	BoardDTO board = dao.getBoardOne(no);
 	
 	String id = String.valueOf(session.getAttribute("log"));
 	%>
 	
 	<h1>게시글 상세보기</h1>
 	<table border="solid 1px" id="table">
			<tr>
				<td>no</td>
			 	<td><%=board.getNo()%></td>
			</tr>
			
			<tr>
				<td>아이디</td>
 				<td><%=board.getId() %></td>
			</tr>
			
			<tr>
				<td>제목</td>
 				<td><%=board.getTitle() %></td>
			</tr>
			
			<tr>
				<td>내용</td>
 				<td><%=board.getContent() %></td>
			</tr>
			
			<tr>
				<td>좋아요</td>
 				<td><%=board.getLikes() %></td>
			</tr>
			
			<tr>
				<td>날짜</td>
 				<td><%=board.getRegDate() %></td>
			</tr>
	</table>
	<a href="_7_boardList.jsp">목록</a>
	<%
	if(id != null && id.equals(board.getId())){
	%>
		<a href="_13_boardUpdate.jsp?no=<%=no%>">수정</a>
		<a href="_15_boardDeletePro.jsp?no=<%=no%>">삭제</a>
	<%
	}
	%>
</body>
</html>