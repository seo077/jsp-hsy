package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MainAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		String id = (String)session.getAttribute("log");
		
		if(id != null) { // 이미 로그인 중이라면, -> 다시 메인으로
			request.getRequestDispatcher("views/main.jsp").forward(request, response);
		}else {
			String dir = request.getParameter("dir");
			System.out.println("dir : "+dir);
			
			String url = "";
			if(dir.equals("로그인")) {
				url = "views/login.jsp";
			}else {
				url = "views/join.jsp";
				
			}
			
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

}
