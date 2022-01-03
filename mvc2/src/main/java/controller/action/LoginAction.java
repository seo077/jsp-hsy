package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UserDAO;

public class LoginAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = null;
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDAO dao = UserDAO.getInstance();
		int result = dao.login(id,pw);
		
		String url = "";
		if(result == 0) {
			session = request.getSession();
			session.setAttribute("log", id);
			url = "views/main.jsp";
		}else {
			url = "views/login.jsp";
		}
		
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
