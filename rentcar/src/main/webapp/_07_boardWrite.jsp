<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/rent.css">
<link rel="stylesheet" type="text/css" href="css/board.css">
<title>Green렌터카</title>
</head>
<body>
<%
	//수정하기 페이지
	String boardNo = request.getParameter("boardNo");
	BoardDAO dao = BoardDAO.getInstance();
	
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
        <div class="nav2_grid">
            <div id="menu1" class="dropdown">
                <a href="_04_main.jsp">단기렌터카</a>
                <div class="dropdown-content">
                    <a style="font-size: 1em;" class="arrow"> ▲</a>
                    <a href="_13_short-term-rent.jsp" style="font-size: 1em;" class="dropdown-content_content">단기렌터카 예약</a>
                    <a href="_14_short-term-guide.jsp" style="font-size: 1em;" class="dropdown-content_content">단기렌터카 안내</a>
                </div>
            </div>
            <div id="menu2" class="dropdown">
                <a href="_04_main.jsp">장기렌터카</a>
                <div class="dropdown-content">
                    <a style="font-size: 1em;" class="arrow"> ▲</a>
                    <a href="_15_long-term-rent.jsp" style="font-size: 1em;" class="dropdown-content_content">장기렌터카 예약</a>
                    <a href="_16_long-term-guide.jsp" style="font-size: 1em;" class="dropdown-content_content">장기렌터카 안내</a>
                </div>
            </div>
            <div id="menu3" class="dropdown">
                <a href="_04_main.jsp">커뮤니티</a>
                <div class="dropdown-content">
                    <a style="font-size: 1em;" class="arrow"> ▲</a>
                    <a href="_06_board.jsp" style="font-size: 1em;" class="dropdown-content_content">게시판</a>
                    <a href="_17_event.jsp" style="font-size: 1em;" class="dropdown-content_content">이벤트</a>
                </div>
            </div>
            <div id="menu4" class="dropdown">
                <a href="_04_main.jsp">마이페이지</a>
                <div class="dropdown-content">
                    <a style="font-size: 1em;" class="arrow"> ▲</a>
                    <a href="_18_member-info.jsp" style="font-size: 1em;" class="dropdown-content_content">회원정보</a>
                    <a href="_19_reservation-confirmation.jsp" style="font-size: 1em;" class="dropdown-content_content">예약확인</a>
                </div>
            </div>
        </div>
        <div class="nav-left" id="nav2-left">
            <form style="display: flex;" method="get" action="_20_search-car.jsp">
                <input type="search" id="search" placeholder="차 검색" name="search">
                <input type="button" id="search_btn">
            </form>
        </div>
    </div>

	<!-- 모든 화면에 고정 -->
	<div class="container">
		<form method="post" action="_07_boardWritePro.jsp">	
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