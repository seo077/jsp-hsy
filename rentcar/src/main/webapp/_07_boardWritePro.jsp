<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Calendar"%>
<%@page import="board.BoardDTO"%>
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
	request.setCharacterEncoding("UTF-8");
	
	String boardNo = request.getParameter("boardNo");
	BoardDAO dao = BoardDAO.getInstance();
	
	String userId = String.valueOf(session.getAttribute("log"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Calendar cd = Calendar.getInstance();
	long time = cd.getTimeInMillis();
	Timestamp regdate = new Timestamp(time);
	
	BoardDTO board = new BoardDTO(userId,title,content,regdate);
	//아무것도 안 쓰여 있을 떄
	if(title.equals("") || title == null || content.equals("") || content == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('내용을 입력하세요.')");
		script.println("history.back()"); 
		script.println("</script>");
	}
	
	
	int result = dao.write(board);
	if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기 실패')");
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