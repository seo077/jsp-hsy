package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFormAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String next = request.getParameter("next");
		
		String url = String.format("views/_03_login.jsp?next=%s",next);
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
