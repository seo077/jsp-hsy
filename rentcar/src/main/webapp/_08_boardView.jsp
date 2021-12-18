<%@page import="comments.CommentsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="comments.CommentsDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/board.css">
<title>Green렌터카</title>
</head>
<body>
	<%
	String boardNo = request.getParameter("boardNo");
	CommentsDAO coDao = CommentsDAO.getInstance();
	ArrayList<CommentsDTO>replies = coDao.getReplies(boardNo);
	
    BoardDAO dao = BoardDAO.getInstance();
	BoardDTO board = dao.getBoardView(boardNo);
	
	String logID = null;
	 //<!-- 모든 화면에 고정 -->
	if(session.getAttribute("log") != null){
		logID = (String)session.getAttribute("log");%>
	    <div class="nav" id="nav1">  
	        <a href="_04_main.jsp"><div id="logo"></div></a>
	        
	        <div class="nav-left" id="nav1-left">
	            <a><%=logID %>님 로그인 중..</a>
	            <a href="_05_logout.jsp">로그아웃</a>
	            <a href="">고객센터</a>
	        </div>
	    </div>
	<% }else{%>
	    <div class="nav" id="nav1">  
	        <a href="_04_main.jsp"><div id="logo"></div></a>
	        
	        <div class="nav-left" id="nav1-left">
	            <a href="_03_login.jsp">로그인</a>
	            <a href="_01_validate.jsp">회원가입</a>
	            <a href="">고객센터</a>
	        </div>
	    </div>
	<%	
	}
	%>
	<div class="nav" id="nav2">
		<div>
			<div class="dropdown">
				<a class="menus" href="_04_main.jsp">단기렌터카</a>
				<div class="dropdown-content">
					<a style="font-size: 0.8em;" class="arrow">△</a> <a
						href="" style="font-size: 0.8em;"
						class="dropdown-content_content">단기렌터카 안내</a> <a
						href="" style="font-size: 0.8em;"
						class="dropdown-content_content">요금/할인 안내</a> <a
						href="" style="font-size: 0.8em;"
						class="dropdown-content_content">단기렌터카 예약</a>
				</div>
			</div>
			<div class="dropdown">
				<a class="menus" href="_04_main.jsp">장기렌터카</a>
				<div class="dropdown-content">
					<a style="font-size: 0.8em;" class="arrow">△</a> <a
						href="" style="font-size: 0.8em;"
						class="dropdown-content_content">개인 장기렌터카</a> <a
						href="" style="font-size: 0.8em;"
						class="dropdown-content_content">법인 장기렌터카</a> <a
						href="" style="font-size: 0.8em;"
						class="dropdown-content_content">장기렌터카 예약</a>
				</div>
			</div>
			<div class="dropdown">
				<a class="menus" href="_04_main.jsp">커뮤니티</a>
				<div class="dropdown-content">
					<a style="font-size: 0.8em;" class="arrow">△</a> <a
						href="_06_board.jsp" style="font-size: 0.8em;"
						class="dropdown-content_content">게시판</a> <a href=""
						style="font-size: 0.8em;" class="dropdown-content_content">이벤트</a>
				</div>
			</div>
			<div class="dropdown">
				<a class="menus" href="_04_main.jsp">마이페이지</a>
				<div class="dropdown-content">
					<a style="font-size: 0.8em;" class="arrow">△</a> 
					<a href="" style="font-size: 0.8em;" class="dropdown-content_content">회원정보</a> 
					<a href="" style="font-size: 0.8em; "class="dropdown-content_content">예약확인</a>
				</div>
			</div>
		</div>
		<div class="nav-left" id="nav2-left">
			<form style="display: flex;">
				<input type="search" id="search" placeholder="차 검색" name="search">
				<input type="button" id="search_btn">
			</form>
		</div>
	</div>

	<!-- 모든 화면에 고정 -->
	<div class="container">
		<h1 id="table_title">자유 게시판</h1>
		<div class="table_div">
			<table class="table">
				<thead>
					<tr>
						<th colspan = "3" style="text-align: center; background-color: #eeeeee">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:20%;">글 제목</td>
						<td colspan="2"><%=board.getTitle() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=board.getUserId() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<%String date = String.valueOf(board.getRegdate()); %>
						<td colspan="2"><%=date.substring(0,11)+date.substring(11,13)+"시"+date.substring(14,16)+"분" %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px;"><%=board.getContent() %></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="like_box">
			<div id="like_btn">
				<a href="" style="color:red">♡</a><br>
				<a href="">0</a>
			</div>
			<div id="view_view">
				<a>조회수</a><br>
				<a>0</a>
			</div>
		</div>
		
		<a class="view_btn" href="_06_board.jsp">목록</a>
		<%
		if(logID.equals(board.getUserId())){%>
			<a class="view_btn" href="_09_boardUpdate.jsp?boardNo=<%= boardNo%>">수정</a>
			<a class="view_btn" href="_10_boardDelete.jsp?boardNo=<%= boardNo%>">삭제</a>
		<%
		}
		%>
		<div class="container" style="margin-top:10px">
			<div class="table_div">
				<table class="table">
					<thead>
						<tr>
							<th colspan = "6" style="text-align: center; background-color: #eeeeee">댓글 보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th style="background-color: #eeeeee; width:10%;">번호</th>
							<th style="background-color: #eeeeee; width:10%;">작성자</th>
							<th style="background-color: #eeeeee; width:50%;">댓글</th>
							<th style="background-color: #eeeeee; width:10%;">좋아요</th>
							<th style="background-color: #eeeeee; width:10%;">싫어요</th>
							<th style="background-color: #eeeeee; width:10%;">작성일</th>
						</tr>
						
					<%
					if(replies !=null){
						int size = replies.size();
						for (int i = 0; i < size; i++) {
						%>
						<tr>
							<td><%=i+1%></td>
							<td><%=replies.get(i).getUserId()%></td>
							<td><%=replies.get(i).getComments()%></td>
							<td><%=replies.get(i).getLikes()%></td>
							<td><%=replies.get(i).getHates()%></td>
							<td><%=replies.get(i).getRegdate()%></td>
						</tr>
						<%
						}
						%>
					}
					</tbody>
				</table>
	
			</div>
		</div>
		<div id="reply_form">
			<form method="post" action="_11_writeReplyPro.jsp?boardNo=<%=boardNo %>">
				<input type="text" placeholder="댓글을 입력하세요." name="reply" style="width: 65%; padding:10px">
				<input type="submit" value="작성" style=" padding:8px">
			</form>
		</div>
	</div>
	

	<!-- 모든 화면에 고정 -->
	<footer>
		<div id="info1">
			<span>고객센터</span><br> <span>02-000-0000</span><br> <span>평일
				: 오전9시~오후6시</span><br> <span>토 : 오전9시~오후3시</span>
		</div>

		<div id="info2">
			<span>Green렌터카 앱 설치</span><br>
			<div class="btns">
				<a href=""><div id="google"></div></a> <a
					href=""><div id="apple"></div></a>
			</div>
		</div>

		<div id="info3">
             <span>Green렌터카 SNS</span><br>  
             <div class="btns">
                <a href=""><div id="facebook"></div></a>
                <a href=""><div id="insta"></div></a>
                <a href=""><div id="youtube"></div></a>
                <a href=""><div id="naver"></div></a>
            </div> 
        </div>
	</footer>
	<!-- 모든 화면에 고정 -->
</body>
</html>