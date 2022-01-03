<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="reply.ReplyDTO"%>
<%@page import="reply.ReplyDAO"%>

<%@page import="java.util.ArrayList"%>

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
	<a>좋아요</a><br>
	
	<%
	if(id != null && id.equals(board.getId())){
	%>
		<a href="_13_boardUpdate.jsp?no=<%=no%>">수정</a>
		<a href="_15_boardDeletePro.jsp?no=<%=no%>">삭제</a><br>
	<%
	}
	%>
	
	<%
		ReplyDAO rdao = ReplyDAO.getInstance();
		ArrayList<ReplyDTO>replys = rdao.getReply();
		int size = replys.size();
		if(size != 0){%>
			<span>댓글</span><br>
			<table border="solid 1px" id="table">
			<tr>
				<td>no</td>
				<td>아이디</td>
				<td>내용</td>
				<td>날짜</td>
			</tr>
			<%
				for(int i=0;i<size;i++){%>
					<tr>
					 	<td><%=i+1%></td>
		 				<td><%=replys.get(i).getId() %></td>
		 				<td><%=replys.get(i).getContent() %></td>
		 				<td><%=replys.get(i).getRegdate() %></td>
					</tr>
					
					<%
				}
			%>
	</table>
		<%
		}
	%>
	<form method="post" action="_16_replyPro.jsp">
		<input type="text" placeholder="댓글쓰기" name="reply">
		<input type="submit" value="작성">
	</form>
</body>
</html>