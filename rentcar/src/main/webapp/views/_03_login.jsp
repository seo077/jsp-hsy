<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../resources/css/login.css">
    <title>Green렌터카</title>
</head>
<body>
    <!-- 로그인 -->
    <div class="wrap">
        <h1>Green렌터카</h1>
        <div class="container">
            <div class="form">
                <form method="post" action="service">
                	<input type="hidden" value="login" name="command">
                	<input type="hidden" value="<%=request.getParameter("next") %>" name="next">
                	
                    <input class="login" type="text" placeholder="아이디" name="id"><br>
                    <input class="login" type="text" placeholder="비밀번호" name="pw" id="pw"><br>
                    <a href="">아이디/비밀번호 찾기</a>
                    <span>ㅣ</span>
                    <a href="_01_validate.jsp">회원가입</a>
                    <input class="login" id="login_btn" type="submit" value="로그인">
                </form>
            </div>
           
            <div class="ad">
                <span style="color: tomato;">추천</span><span>렌터카</span>
                <div id="recommend"></div>
                <div>21년식 롤스로이드 고스트 V12</div>
            </div>
        </div>
    </div>
</body>
</html>