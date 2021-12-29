package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.BoardDAO;

public class BoardUpdateAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		String boardNo = request.getParameter("boardNo");
		BoardDAO dao = BoardDAO.getInstance();
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		String url = "";
		if(title.equals("") || title == null || content.equals("") || content == null){
			//아무것도 안 쓰여 있을 떄
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용을 입력하세요.')");
			script.println("</script>");
			url = String.format("views/_09_boardUpdate.jsp?boardNo=%s",boardNo);
		}else {
			int result = dao.update(boardNo, title, content);
			if(result == -2){
				// 데이터베이스 오류
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('수정 실패')");
				script.println("</script>");
				url = String.format("views/_09_boardUpdate.jsp?boardNo=%s",boardNo);
			}else{
				url = String.format("views/_08_boardView.jsp?boardNo=%s",boardNo);
			}
			
			request.getRequestDispatcher(url).forward(request, response);
		}
		
		
	}

}
