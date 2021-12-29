package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.BoardDAO;
import model.dao.CommentsDAO;
import model.dao.LikesDAO;

public class BoardDeleteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String boardNo = request.getParameter("boardNo");
		BoardDAO dao = BoardDAO.getInstance();
		
		
		String url="";
		int result = dao.delete(boardNo);
		if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제 실패')");
			script.println("</script>");
			
			url = String.format("views/_08_boardView.jsp?boardNo=%d",boardNo);
		}else{
			CommentsDAO commentdao = CommentsDAO.getInstance();
			LikesDAO likesdao = LikesDAO.getInstance();
			
			int no = Integer.parseInt(boardNo);
			
			// 댓글,좋아요도 함께 삭제
			likesdao.delBoard(no);
			commentdao.delBoard(no);
			
			url="views/_06_board.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
