package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.CommentsDAO;
import model.dao.CommentsHateDAO;
import model.dao.CommentsLikeDAO;
import model.dto.CommentsDTO;

public class CommentAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CommentsDAO commentdao = CommentsDAO.getInstance();
		CommentsLikeDAO likedao = CommentsLikeDAO.getInstance();
		CommentsHateDAO hatedao = CommentsHateDAO.getInstance();
		
		int dir = Integer.parseInt(request.getParameter("dir"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		HttpSession session = request.getSession();
		String userId = String.valueOf(session.getAttribute("log"));
		
		if(dir == CommentsDTO.DEL){ // 삭제
			int commentNo = Integer.parseInt(request.getParameter("commentNo"));
			commentdao.delComment(commentNo);
			PrintWriter script = response.getWriter();
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
			script.println("<script>");
			script.println("alert('삭제 완료.')");
			script.println("</script>");
		}else if(dir == CommentsDTO.LIKE){
			int commentNo = Integer.parseInt(request.getParameter("commentNo"));
			int like = Integer.parseInt(request.getParameter("likes"));
			
			if(likedao.getLikes(commentNo, userId)) {
				likedao.downLikes(commentNo, userId);
				commentdao.downLike(commentNo, like);
			}else {
				likedao.upLike(commentNo, userId);
				commentdao.upLike(commentNo, like);
			}
		}else{
			int commentNo = Integer.parseInt(request.getParameter("commentNo"));
			int hate = Integer.parseInt(request.getParameter("hates"));
			
			if(hatedao.getHate(commentNo, userId)) {
				hatedao.downHates(commentNo, userId);
				commentdao.downHate(commentNo, hate);
			}else {
				hatedao.upHate(commentNo, userId);
				commentdao.upHate(commentNo, hate);
			}
		}
		
		String url = String.format("views/_08_boardView.jsp?boardNo = %d",boardNo);
		request.getRequestDispatcher(url).forward(request, response);
		//response.sendRedirect(url);
	}
}
