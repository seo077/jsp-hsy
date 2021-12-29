package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.BoardDAO;
import model.dao.LikesDAO;

public class BoardLikeAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String temp = request.getParameter("boardNo");
		int boardNo = Integer.parseInt(temp);

		HttpSession session = request.getSession();
		String userId = String.valueOf(session.getAttribute("log"));
		int likes = Integer.parseInt(request.getParameter("likes"));
		
		LikesDAO likesdao = LikesDAO.getInstance();
		BoardDAO boarddao = BoardDAO.getInstance();
		
		boolean run = likesdao.getLikes(boardNo, userId);
		if(run){ // 좋아요를 눌렀던 사람
			likesdao.downLikes(boardNo, userId);
			boarddao.downLikes(temp, likes);
			
		}else{ // 좋아요를 누르지 않았던 사람
			likesdao.upLikes(boardNo, userId);
			boarddao.upLikes(temp, likes);
		}
		String url = String.format("views/_08_boardView.jsp?boardNo=%d",boardNo);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
