package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CarInfoAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no = Integer.parseInt(request.getParameter("no"));
		String usein = request.getParameter("usein");
		String type = request.getParameter("type");
		
		String startday = request.getParameter("startday");
		String endday = request.getParameter("endday");
		
		String url = String.format("views/_21_car_info.jsp?no=%d&usein=%s&type=%s&startday=%s&endday=%s",no,usein,type,startday,endday);
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
