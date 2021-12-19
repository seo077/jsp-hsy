<%@page import="board.BoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Green렌터카</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String boardNo = request.getParameter("boardNo");
	BoardDAO dao = BoardDAO.getInstance();
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//아무것도 안 쓰여 있을 떄
	if(title.equals("") || title == null || content.equals("") || content == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('내용을 입력하세요.')");
		script.println("history.back()"); 
		script.println("</script>");
	}
	
	
	int result = dao.update(boardNo, title, content);
	if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('수정 실패')");
		script.println("history.back()"); 
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '_06_board.jsp';"); 
		script.println("</script>");
	}
	%>
</body>
</html>