package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.MemberDAO;
import model.dto.MemberDTO;

public class JoinAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		MemberDAO dao = MemberDAO.getInstance();
		
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
		
		String url = "";
	 	int result = dao.join(member);
		if(result == -2){		//아이디 중복
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('사용할 수 없는 아이디 입니다.')");
			script.println("</script>");
			url = "views/_01_validate.jsp";
		}else{          // 회원가입 ok => 로그인 상태 + 메인페이지로 이동
			HttpSession session = request.getSession();
			session.setAttribute("log", id);
			
			PrintWriter script = response.getWriter();
			url = "views/_04_main.jsp";
		} 
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
