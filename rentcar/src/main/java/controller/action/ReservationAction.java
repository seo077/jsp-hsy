package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.RentalCarDAO;
import model.dao.ReservationDAO;
import model.dao.ReviewDAO;
import model.dto.RentalCarDTO;

public class ReservationAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		RentalCarDAO rentalcardao = RentalCarDAO.getInstance();
		
		HttpSession session = request.getSession();
		String userId = String.valueOf(session.getAttribute("log"));
		int no = Integer.parseInt(request.getParameter("no"));
		String usein = request.getParameter("usein");
		String type = request.getParameter("type");
		String startday = (String)request.getParameter("startday");
		String endday = (String)request.getParameter("endday");
		
		Calendar c = Calendar.getInstance();
		long time = c.getTimeInMillis();
		Timestamp regdate = new Timestamp(time);
		
		//reservationdao -> 등록
		ReservationDAO reservationdao = ReservationDAO.getInstance();
		int result1 = reservationdao.reservation(no, userId, startday, endday, regdate);
		
		//rentalCardao -> 차 수량 줄이기
		RentalCarDTO car = rentalcardao.getCarInfo(no);
		int qty = car.getQty();
		int result2 = rentalcardao.reservation(no, qty);
		
		//실구매자로 전환
		ReviewDAO reviewdao = ReviewDAO.getInstance();
		reviewdao.turnReal(no,userId);
		
		String url = "";
		if(result1 == -2 || result2 == -2){		//예약 실패
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('예약을 실패하였습니다.')");
			script.println("</script>");
			url = String.format("views/_21_car_info.jsp?no=%d&usein=%s&type=%s&startday=%s&endday=%s",no,usein,type,startday,endday);
		}else{          // 예약 성공!
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('예약을 성공하였습니다.')");
			script.println("</script>");
			url="views/_04_main.jsp";
		} 
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
