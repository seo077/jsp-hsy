<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Date"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
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
	// 회원가입
	MemberDAO dao = MemberDAO.getInstance();
	
	request.setCharacterEncoding("UTF-8");
	
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("date");
	
	Date birth_year = Date.valueOf(year+"-"+month+"-"+date);
	String gender = request.getParameter("gender");
	
	String email = request.getParameter("email");
	String country = request.getParameter("country");
	
	String phone_number = request.getParameter("number");
	
	Calendar cd = Calendar.getInstance();
	long time = cd.getTimeInMillis();
	Timestamp regdate = new Timestamp(time);
	
	MemberDTO member = new MemberDTO(id, pw, name, birth_year, gender, email, country, phone_number,regdate);
	
 	int result = dao.join(member);
	if(result == -2){		//아이디 중복
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.')");
		script.println("history.back()"); 
		script.println("</script>");
	}else{          // 회원가입 ok => 로그인 상태 + 메인페이지로 이동
		session.setAttribute("log", id);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '_04_main.jsp';"); 
		script.println("</script>");
	} 
	%>

</body>
</html>