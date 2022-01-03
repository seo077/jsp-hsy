package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UserDAO;

public class JoinAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = null;
		
		UserDAO dao = UserDAO.getInstance();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		String url = "";
		int result = dao.join(id, pw, name);
		if(result == -2) { // 아이디 중복 -> 다시 join 페이지로
			url = "views/join.jsp";
		}else { // 가입 성공 -> main페이지
			//로그인
			session = request.getSession();
			session.setAttribute("log", id);
			url = "views/main.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
