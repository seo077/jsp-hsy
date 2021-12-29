<%@page import="model.dao.CommentsHateDAO"%>
<%@page import="model.dao.CommentsLikeDAO"%>
<%@page import="model.dao.LikesDAO"%>
<%@page import="model.dto.CommentsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.CommentsDAO"%>
<%@page import="model.dto.BoardDTO"%>
<%@page import="model.dao.BoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String boardNo = request.getParameter("boardNo");
	System.out.println("boardNo:"+boardNo);
	
	CommentsDAO coDao = CommentsDAO.getInstance();
	ArrayList<CommentsDTO>replies = coDao.getReplies(boardNo);
	
    BoardDAO dao = BoardDAO.getInstance();
	
    if(request.getParameter("views") != null){
		int views = Integer.parseInt(request.getParameter("views"));
		dao.upViews(boardNo, views);
	}
	BoardDTO board = dao.getBoardView(boardNo);
	
	// 이미 로그인이 된 상태
	String logID = null;
	if(session.getAttribute("log") != null){
		logID = (String)session.getAttribute("log");%>
	    <div class="nav" id="nav1">  
	        <a href="service?command=mainForm"><div id="logo"></div></a>
	        
	        <div class="nav-left" id="nav1-left">
	            <a><%=logID %>님 로그인 중..</a>
	            <a href="service?command=logout">로그아웃</a>
	            <a href="">고객센터</a>
	        </div>
	    </div>
	<% }else{%>
	    <div class="nav" id="nav1">  
	        <a href="service?command=mainForm"><div id="logo"></div></a>
	        
	        <div class="nav-left" id="nav1-left">
	            <a href="../service?command=loginForm">로그인</a>
	            <a href="service?command=validateForm">회원가입</a>
	            <a href="">고객센터</a>
	        </div>
	    </div>
	<%	
	}
	%>
    <div class="nav" id="nav2">
        <div class="nav2_grid">
            <div id="menu1" class="dropdown">
                <a>단기렌터카</a>
                <div class="dropdown-content">
                    <a style="font-size: 1em;" class="arrow"> ▲</a>
                    <a href="../service?command=carSearch&usein=-1&type=전체" style="font-size: 1em;" class="dropdown-content_content">단기렌터카 예약</a>
                    <a href="service?command=shortCarInfo" style="font-size: 1em;" class="dropdown-content_content">단기렌터카 안내</a>
                </div>
            </div>
            <div id="menu2" class="dropdown">
                <a>장기렌터카</a>
                <div class="dropdown-content">
                    <a style="font-size: 1em;" class="arrow"> ▲</a>
                    <a href="service?command=longCarRent" style="font-size: 1em;" class="dropdown-content_content">장기렌터카 예약</a>
                    <a href="service?command=longCarInfo" style="font-size: 1em;" class="dropdown-content_content">장기렌터카 안내</a>
                </div>
            </div>
            <div id="menu3" class="dropdown">
                <a>커뮤니티</a>
                <div class="dropdown-content">
                    <a style="font-size: 1em;" class="arrow"> ▲</a>
                    <a href="service?command=board" style="font-size: 1em;" class="dropdown-content_content">게시판</a>
                    <a href="service?command=event" style="font-size: 1em;" class="dropdown-content_content">이벤트</a>
                </div>
            </div>
            <div id="menu4" class="dropdown">
                <a>마이페이지</a>
                <div class="dropdown-content">
                    <a style="font-size: 1em;" class="arrow"> ▲</a>
                    <a href="service?command=memberInfoForm" style="font-size: 1em;" class="dropdown-content_content">회원정보</a>
                    <a href="service?command=reservationConfirmForm" style="font-size: 1em;" class="dropdown-content_content">예약확인</a>
                </div>
            </div>
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
						<td style="min-height: 200px;">내용</td>
						<td colspan="2" style="min-height: 200px;"><%=board.getContent() %></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="like_box">
			<div id="like_btn">
				<%
				LikesDAO likesdao = LikesDAO.getInstance();
				int no = Integer.parseInt(boardNo);
				boolean click = likesdao.getLikes(no, logID);
				if(click){%>
					<a href="service?command=boardLike&boardNo=<%=boardNo %>&likes=<%=board.getLikes() %>" style="color:red">♥</a><br>
				<%	
				}else{
				%>
					<a href="service?command=boardLike&boardNo=<%=boardNo %>&likes=<%=board.getLikes() %>" style="color:red">♡</a><br>
				<%
				}
				%>
				<a href="service?command=boardLike&boardNo=<%=boardNo %>&likes=<%=board.getLikes() %>"><%=board.getLikes() %></a>
			</div>
			<div id="view_view">
				<a>조회수</a><br>
				<a><%=board.getViews() %></a>
			</div>
		</div>
		
		<a class="view_btn" href="service?command=board">목록</a>
		<%
		if(logID.equals(board.getUserId())){%>
			<a class="view_btn" href="service?command=boardUpdateForm&boardNo=<%= boardNo%>">수정</a>
			<a class="view_btn" href="service?command=boardDelete&boardNo=<%= boardNo%>">삭제</a>
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
							<th style="background-color: #eeeeee; width:5%;">좋아요</th>
							<th style="background-color: #eeeeee; width:5%;">싫어요</th>
							<th style="background-color: #eeeeee; width:20%;">작성일</th>
						</tr>
						
					<%
					if(replies !=null){
						int size = replies.size();
						System.out.println(size);
						for (int i = 0; i < size; i++) {
						%>
						<tr>
							<td><%=i+1%></td>
							<td><%=replies.get(i).getUserId()%></td>
							<td><%=replies.get(i).getComments()%></td>
							<!-- 이미 누른 사람-> -->
							<%
							CommentsLikeDAO likedao = CommentsLikeDAO.getInstance();
							CommentsHateDAO hatedao = CommentsHateDAO.getInstance();
							
							no = replies.get(i).getCommentNo();
							click = likedao.getLikes(no, logID);
							if(click){%>
								<td><a style="color:blue" href="../service?command=comment&dir=<%=CommentsDTO.LIKE%>&boardNo=<%=boardNo %>&commentNo=<%=replies.get(i).getCommentNo() %>&likes=<%=replies.get(i).getLikes()%>">▲<%=replies.get(i).getLikes() %></a></td>
							<%	
							}else{
							%>
								<td><a style="color:blue" href="../service?command=comment&dir=<%=CommentsDTO.LIKE%>&boardNo=<%=boardNo %>&commentNo=<%=replies.get(i).getCommentNo() %>&likes=<%=replies.get(i).getLikes()%>">△<%=replies.get(i).getLikes() %></a></td>
								
							<%
							}
							%>
							
							<% 
							click = hatedao.getHate(no, logID);
							if(click){%>
								<td><a style="color:blue" href="../service?command=comment&dir=<%=CommentsDTO.HATE%>&boardNo=<%=boardNo %>&commentNo=<%=replies.get(i).getCommentNo() %>&hates=<%=replies.get(i).getHates()%>">▼<%=replies.get(i).getHates()%></a></td>
								
							<%	
							}else{
							%>
								<td><a style="color:blue" href="../service?command=comment&dir=<%=CommentsDTO.HATE%>&boardNo=<%=boardNo %>&commentNo=<%=replies.get(i).getCommentNo() %>&hates=<%=replies.get(i).getHates()%>">▽<%=replies.get(i).getHates()%></a></td>
							<%
							}
							%>
							<%String temp = String.valueOf(replies.get(i).getRegdate()); %>
							<td>
								<%=temp.substring(0,11)+temp.substring(11,13)+"시"+temp.substring(14,16)+"분" %>
								<!-- 작성자 -> + 댓글 삭제 버튼 -->
								<%if(logID.equals(replies.get(i).getUserId())){ %>
									<a href="../service?command=comment&dir=<%=CommentsDTO.DEL%>&boardNo=<%=boardNo %>&commentNo=<%=replies.get(i).getCommentNo() %>" style="padding:2px; background-color:#eeeeee;">삭제</a>
								<%} %>
							
							</td>
						</tr>
						<%
						}
					}
					%>
					</tbody>
				</table>
	
			</div>
			<div id="reply_form">
				<form method="post" action="service?boardNo=<%=board.getBoardNo()%>">
					<input type="hidden" name="command" value="writeComment">
					<input type="text" placeholder="댓글을 입력하세요." name="reply" style="width: 65%; padding:10px">
					<input type="submit" value="작성" style=" padding:8px">
				</form>
			</div>
		</div>
	</div>
	

    <!-- 모든 화면에 고정 -->
    <footer>
        <div id="info1">
            <span><strong>고객센터</strong></span><br><br>
            <div class="btns">
	            <div id="phone_img"></div>
	            <span><strong>  02-123-1234</strong></span><br>
            </div>
            <span>평일 : 오전9시~오후6시</span><br>
            <span>토 : 오전9시~오후3시</span>
        </div>
        
        <div id="info2">
            <span><strong>Green렌터카 앱 설치</strong></span><br><br>
            <div class="btns">
                <a href=""><div id="google"></div></a>
                <a href=""><div id="apple"></div></a>
            </div>
        </div>
        
        <div id="info3">
             <span><strong>Green렌터카 SNS</strong></span><br><br>  
             <div class="btns">
                <a href=""><div id="facebook"></div></a>
                <a href=""><div id="insta"></div></a>
                <a href=""><div id="youtube"></div></a>
                <a href=""><div id="naver"></div></a>
                <a href=""><div id="naver_blog"></div></a>
            </div> 
        </div>
    </footer>
    <!-- 모든 화면에 고정 -->
</body>
</html>