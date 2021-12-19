<%@page import="likes.LikesDAO"%>
<%@page import="comments.CommentsDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="board.BoardDAO"%>
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
	String boardNo = request.getParameter("boardNo");
	BoardDAO dao = BoardDAO.getInstance();
	
	int result = dao.delete(boardNo);
	if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제 실패')");
		script.println("history.back()"); 
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '_06_board.jsp';"); 
		script.println("</script>");
	}
	
	CommentsDAO commentdao = CommentsDAO.getInstance();
	LikesDAO likesdao = LikesDAO.getInstance();
	
	int no = Integer.parseInt(boardNo);
	
	// 댓글,좋아요도 함께 삭제
	likesdao.delBoard(no);
	commentdao.delBoard(no);
	%>
</body>
</html>