package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.RentalCarDAO;
import model.dao.ReservationDAO;
import model.dto.RentalCarDTO;

public class ReservationConfirmAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReservationDAO reservationdao = ReservationDAO.getInstance();
		RentalCarDAO rentaldao = RentalCarDAO.getInstance();
		
		int carNo = Integer.parseInt(request.getParameter("carNo"));

		HttpSession session = request.getSession();
		String userId = String.valueOf(session.getAttribute("log"));
		
		RentalCarDTO car = rentaldao.getCarInfo(carNo);
		int qty = car.getQty();
		
		// 예약 취소
		int result1 = reservationdao.cancelRes(userId, carNo);
		// 예약 취소에 성공하면 차 수량 다시 증가
		int result2 =	rentaldao.cancelReservation(qty, carNo);
		
		if(result1 == 2 && result2 == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('예약 취소에 실패하였습니다.')");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('예약이 취소되었습니다.')");
			script.println("</script>");
		}
		
		String url = "views/_19_reservation-confirmation.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

}
