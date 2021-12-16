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
	ArrayList<BoardDTO> boards = dao.getBoard();

	%>

	<button onclick="location.href='_8_checkPass.jsp'">탈퇴</button>
	<h1>List</h1>
		<div class="wrap">
			<table border="solid 1px" id="table">
				<tr>
					<td>no</td>
					<td>id</td>
					<td>title</td>
					<td>like</td>
					<td>regDate</td>
				</tr>

				<%
				int size = boards.size();
				for (int i = 0; i < size; i++) {
				%>
				<tr>
					<td><%=boards.get(i).getNo()%></td>
					<td><%=boards.get(i).getId()%></td>
					<%-- add anchor tag to title td --%>
					<td><a href="_12_boardView.jsp?no=<%=boards.get(i).getNo()%>"><%=boards.get(i).getTitle()%></a></td>
					<td><%=boards.get(i).getLikes()%></td>_
					<td><%=boards.get(i).getRegDate()%></td>
				<tr>
					<%
					}
					%>
				
			</table>
		</div>
		<br> 
		<button onclick="location.href='_10_boardWrite.jsp'">작성하기</button>
</body>
</html>
