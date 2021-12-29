package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.MemberDAO;

public class LoginAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		String next = request.getParameter("next");
		
		MemberDAO dao = MemberDAO.getInstance();
		
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		
		String url = "";
		if(id.equals("") || id == null || pw.equals("") || pw == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디와 비밀번호를 정확하게 입력하세요.')");
			script.println("</script>");
			url = "views/_03_login.jsp";
		}else {
			int result = dao.login(id,pw);
			
			if(result == 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				session.setAttribute("log", id);
				script.println("</script>");
				if(next == null) {
					url = "views/_04_main.jsp";
				}else if(next.equals("board")) {
					url = "views/_06_board.jsp";
				}else if(next.equals("short")) {
					url = "views/_13_short-term-rent.jsp?usein=-1&type=전체";
				}else if(next.equals("memberInfo")) {
					url = "views/_18_member-info.jsp";
				}else if(next.equals("reservationConfirm")) {
					url = "views/_19_reservation-confirmation.jsp";
				}
				
				
			}else if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('존재하지 않는 아이디입니다.')");
				script.println("</script>");
				url = "views/_03_login.jsp";
			}else if(result == -2){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 틀립니다.')");
				script.println("</script>");
				url = "views/_03_login.jsp";
			}else if(result == -3){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류')");
				script.println("</script>");
				url = "views/_03_login.jsp";
			}
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
