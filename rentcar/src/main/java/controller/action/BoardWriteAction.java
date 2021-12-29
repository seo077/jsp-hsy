package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.BoardDAO;
import model.dto.BoardDTO;

public class BoardWriteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		BoardDAO dao = BoardDAO.getInstance();
		
		HttpSession session = request.getSession();
		String userId = String.valueOf(session.getAttribute("log"));
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Calendar cd = Calendar.getInstance();
		long time = cd.getTimeInMillis();
		Timestamp regdate = new Timestamp(time);
		
		BoardDTO board = new BoardDTO(userId,title,content,regdate);
		
		String url = "";
		if(title.equals("") || title == null || content.equals("") || content == null){
			//아무것도 안 쓰여 있을 떄
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용을 입력하세요.')");
			script.println("</script>");
			url = "views/_07_boardWrite.jsp";
		}else {
			int result = dao.write(board);
			if(result == -2){
				// 데이터베이스 오류
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기 실패')");
				script.println("</script>");
				url = "views/_07_boardWrite.jsp";
			}else{
				//작성 성공
				url = "views/_06_board.jsp";
			}
		}
		
		
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
