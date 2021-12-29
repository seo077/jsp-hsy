package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReservationFormAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String no = request.getParameter("no");
		String usein = request.getParameter("usein");
		String type = request.getParameter("type");
		String startday = request.getParameter("startday");
		String endday = request.getParameter("endday");
		
		String url = String.format("views/_22_reservation.jsp?no=%s&usein=%s&type=%s&startday=%s&endday=%s",no,usein,type,startday,endday);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
