package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.ReservationDAO;
import model.dao.ReviewDAO;
import model.dto.ReviewDTO;

public class ReviewAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String review = request.getParameter("review");
		ReservationDAO redao = ReservationDAO.getInstance();
		ReviewDAO reviewdao = ReviewDAO.getInstance();
		
		int carNo = Integer.parseInt(request.getParameter("no"));
		HttpSession session = request.getSession();
		String userId = String.valueOf(session.getAttribute("log"));
		int realuser  = 0;
		String usein = request.getParameter("usein");
		String type = request.getParameter("type");
		String startday = request.getParameter("startday");
		String endday = request.getParameter("endday");
		
		boolean realUser = redao.realUser(carNo, userId);
		if(realUser){
			realuser = 1;
		}
		
		
		String url = "";
		if(review == null || review == ""){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('리뷰를 입력하세요.')");
			script.println("</script>");
		}else {
			Calendar cd = Calendar.getInstance();
			long time = cd.getTimeInMillis();
			Timestamp regdate = new Timestamp(time);
			
			ReviewDTO reply = new ReviewDTO(carNo,userId,review,regdate,realuser);
			reviewdao.writeReview(reply);
		}
		
		url = String.format("views/_21_car_info.jsp?no=%d&usein=%s&type=%s&startday=%s&endday=%s",carNo,usein,type,startday,endday);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
