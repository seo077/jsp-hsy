package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CarSearchAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url = "";
		if(request.getParameter("startday") == null || request.getParameter("endday") == null) {
			// 날짜 선택 x
			int usein = Integer.parseInt(request.getParameter("usein"));
			String type = request.getParameter("type");
			
			url = String.format("views/_13_short-term-rent.jsp?usein=%d&type=%s",usein,type);
		}else {
			// 날짜 선택 o
			int usein = Integer.parseInt(request.getParameter("usein"));
			String type = request.getParameter("type");
			String startday = request.getParameter("startday");
			String endday = request.getParameter("endday");
			
			url = String.format("views/_13_short-term-rent.jsp?usein=%d&type=%s&startday=%s&endday=%s",usein,type,startday,endday);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
