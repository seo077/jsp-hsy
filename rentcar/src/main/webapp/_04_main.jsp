<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="css/main.css">
    <title>Green렌터카</title>
</head>
<body>
    <!-- 모든 화면에 고정 -->
    <%
	
	// 이미 로그인이 된 상태 => 메인페이지로
	String logID = null;
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
                    <a style="font-size: 0.8em;" class="arrow">△</a>
                    <a href="" style="font-size: 0.8em;" class="dropdown-content_content">단기렌터카 안내</a>
                    <a href="" style="font-size: 0.8em;" class="dropdown-content_content">요금/할인 안내</a>
                    <a href="" style="font-size: 0.8em;" class="dropdown-content_content">단기렌터카 예약</a>
                </div>
            </div>
            <div class="dropdown">
                <a class="menus" href="_04_main.jsp">장기렌터카</a>
                <div class="dropdown-content">
                    <a style="font-size: 0.8em;" class="arrow">△</a>
                    <a href="" style="font-size: 0.8em;" class="dropdown-content_content">개인 장기렌터카</a>
                    <a href="" style="font-size: 0.8em;" class="dropdown-content_content">법인 장기렌터카</a>
                    <a href="" style="font-size: 0.8em;" class="dropdown-content_content">장기렌터카 예약</a>
                </div>
            </div>
            <div class="dropdown">
                <a class="menus" href="_04_main.jsp">커뮤니티</a>
                <div class="dropdown-content">
                    <a style="font-size: 0.8em;" class="arrow">△</a>
                    <a href="_06_board.jsp" style="font-size: 0.8em;" class="dropdown-content_content">게시판</a>
                    <a href="" style="font-size: 0.8em;" class="dropdown-content_content">이벤트</a>
                </div>
            </div>
            <div class="dropdown">
                <a class="menus" href="_04_main.jsp">마이페이지</a>
                <div class="dropdown-content">
                    <a style="font-size: 0.8em;" class="arrow">△</a>
                    <a href="" style="font-size: 0.8em;" class="dropdown-content_content">회원정보</a>
                    <a href="" style="font-size: 0.8em;" class="dropdown-content_content">예약확인</a>
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
        <main></main>
        
        <aside id="news">
            <article></article>
            <article></article>
        </aside>
        
        <aside id="ad"></aside>
    </div>
    
    <!-- 모든 화면에 고정 -->
    <footer>
        <div id="info1">
            <span>고객센터</span><br>
            <span>02-000-0000</span><br>
            <span>평일 : 오전9시~오후6시</span><br>
            <span>토 : 오전9시~오후3시</span>
        </div>
        
        <div id="info2">
            <span>Green렌터카 앱 설치</span><br>
            <div class="btns">
                <a href=""><div id="google"></div></a>
                <a href=""><div id="apple"></div></a>
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