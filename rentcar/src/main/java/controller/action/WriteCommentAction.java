package controller.action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.CommentsDAO;
import model.dto.CommentsDTO;

public class WriteCommentAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CommentsDAO dao = CommentsDAO.getInstance();
		
		request.setCharacterEncoding("UTF-8");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		HttpSession session = request.getSession();
		String userId = String.valueOf(session.getAttribute("log"));
		
		String reply = request.getParameter("reply");
		
		Calendar cd = Calendar.getInstance();
		long time = cd.getTimeInMillis();
		Timestamp regdate = new Timestamp(time);
		
		CommentsDTO comment = new CommentsDTO(boardNo, userId,reply,regdate);
		dao.writeReply(comment);
		
		String url = String.format("views/_08_boardView.jsp?boardNo=%d",boardNo);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
