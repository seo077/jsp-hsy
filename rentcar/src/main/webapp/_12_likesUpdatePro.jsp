<%@page import="board.BoardDAO"%>
<%@page import="likes.LikesDAO"%>
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
	String temp = request.getParameter("boardNo");
	int boardNo = Integer.parseInt(temp);
	String userId = request.getParameter("userId");
	int likes = Integer.parseInt(request.getParameter("likes"));
	
	LikesDAO likesdao = LikesDAO.getInstance();
	BoardDAO boarddao = BoardDAO.getInstance();
	
	boolean run = likesdao.getLikes(boardNo, userId);
	if(run){ // 좋아요를 눌렀던 사람
		likesdao.downLikes(boardNo, userId);
		boarddao.downLikes(temp, likes);
		
	}else{ // 좋아요를 누르지 않았던 사람
		likesdao.upLikes(boardNo, userId);
		boarddao.upLikes(temp, likes);
	}
	String url = String.format("_08_boardView.jsp?boardNo=%d",boardNo);
	response.sendRedirect(url);
	%>
</body>
</html>