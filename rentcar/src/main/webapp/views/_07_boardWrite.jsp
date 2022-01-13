<%@page import="model.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/rent.css">
<link rel="stylesheet" type="text/css" href="../resources/css/board.css">
<title>Green렌터카</title>
</head>
<body>
	<%
	//수정하기 페이지
	String logID = (String)session.getAttribute("log");
	%>
	<c:import url="header.jsp"></c:import>
	<div class="container">
		<form method="post" action="service">	
			<input type="hidden" name="command" value="boardWrite">
			<h1 id="table_title">자유 게시판</h1>
			<div class="table_div">
				<table class="table">
					<thead>
						<tr>
							<th colspan = "3" style="text-align: center; background-color: #eeeeee">게시판 글 쓰기</th>
						</tr>
					</thead>
					<tbody>
							<tr>
								<td>작성자</td>
								<td colspan="2"><%=logID %></td>
							</tr>
							<tr>
								<td style="width:20%;">글 제목</td>
								<td colspan="2"><input type="text" name="title" placeholder="제목을 입력하세요" style="width:90%; height:100%"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="2" style="min-height: 200px;"><textarea name ="content" placeholder="내용을 입력하세요" style="width:90%; height:100%"></textarea></td>
							</tr>
					</tbody>
				</table>
			</div>
			<input type="submit" id="write_btn" value="작성하기">
		</form>
	</div>

	
	<c:import url="footer.jsp"></c:import>
</body>
</html>