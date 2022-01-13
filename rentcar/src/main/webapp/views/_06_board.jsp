<%@page import="model.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.BoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="../resources/css/rent.css">
<link rel="stylesheet" type="text/css" href="../resources/css/board.css">
<title>Green렌터카</title>
</head>
<body>
	<%
	BoardDAO dao = BoardDAO.getInstance();
	ArrayList<BoardDTO> boards = new ArrayList<>();
	boards = dao.getBoards();
	int size = boards.size();

	// 로그인이 되어 있지 않음. => 메인페이지로
	String logID = null;
	if (session.getAttribute("log") == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후 이용해 주세요.')");
		script.println("location.href='/service?command=loginForm&next=board'");
		script.println("</script>");
	}
	%>

	<c:import url="header.jsp"></c:import>
	<div class="container">
		<h1 id="table_title">자유 게시판</h1>
		<div class="table_div">
			<table class="table">
				<thead>
					<tr>
						<th style="background-color: #eeeeee">번호</th>
						<th style="background-color: #eeeeee">작성자</th>
						<th style="background-color: #eeeeee">제목</th>
						<th style="background-color: #eeeeee">좋아요</th>
						<th style="background-color: #eeeeee">작성일</th>
						<th style="background-color: #eeeeee">조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (int i = 0; i < size; i++) {
					%>
					<tr>
						<td><%=i+1%></td>
						<td><%=boards.get(i).getUserId()%></td>
						<td><a
							href="/service?command=boardView&boardNo=<%=boards.get(i).getBoardNo()%>&views=<%=boards.get(i).getViews()%>"><%=boards.get(i).getTitle()%></a></td>
						<td><%=boards.get(i).getLikes()%></td>
						<td><%=boards.get(i).getRegdate()%></td>
						<td><%=boards.get(i).getViews()%></td>
					</tr>
					<%
					}
					%>

				</tbody>
			</table>

		</div>
		<a id="write_btn" href="/service?command=boardWriteForm">글쓰기</a>
	</div>


	 <c:import url="footer.jsp"></c:import>

</body>
</html>