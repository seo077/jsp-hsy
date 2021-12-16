package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import user.UserDAO;

public class BoardDAO {
	private BoardDAO() {};
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	public final int CHANGE = 0;
	public final int DELETE = 1;
	public int dir = -1;
	
	private UserDAO dao = UserDAO.getInstance();
	
	private ArrayList<BoardDTO>boards = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 게시글 가져오기
	public ArrayList<BoardDTO>getBoard(){
		try {
			conn = dao.getConnection(); //db연동
			
			String str = "select * from board";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			
			boards = new ArrayList<BoardDTO>();
			while(rs.next()){
				int no = rs.getInt(1);
				String id = rs.getString(2); 
				String pw = rs.getString(3); 
				String title = rs.getString(4); 
				String content = rs.getString(5); 
				int likes = rs.getInt(6);
				Timestamp regDate = rs.getTimestamp(7);
				
				BoardDTO b = new BoardDTO(no, id, pw, title, content, likes, regDate);
				boards.add(b);
				System.out.println("ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boards;
	}
	
	public BoardDTO getBoardOne(int idx) {
		 String str = "select * from board where no = ?";
		 try {
			 conn = dao.getConnection(); //db연동
				
			 PreparedStatement pstmt1 = conn.prepareStatement(str);
			 pstmt1.setInt(1, idx);
			 rs = pstmt1.executeQuery();
			 if(rs.next()) {
				 int no = rs.getInt(1);
				 String id = rs.getString(2);
				 String pw = rs.getString(3);
				 String title = rs.getString(4);
				 String content = rs.getString(5);
				 int likes = rs.getInt(6);
				 Timestamp regDate = rs.getTimestamp(7);
				 
				 BoardDTO board = new BoardDTO(no,id, pw, title, content,likes, regDate);
				 return board;
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return null;
	}
	
	// 게시긓 작성
	public void addBoard(BoardDTO board) {
		try {
			conn = dao.getConnection();
			
			String str = "insert into board(id,pw,title,content,regDate) values (?,?,?,?,?)";
			pstmt = conn.prepareStatement(str);
			
			pstmt.setString(1, board.getId());
			pstmt.setString(2, board.getPw());
			pstmt.setString(3, board.getTitle());
			pstmt.setString(4, board.getContent());
			pstmt.setTimestamp(5, board.getRegDate());
			
			pstmt.executeUpdate();
			
			boards.add(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 게시글 삭제
	public void delBoard(String idx) {
		int no = Integer.parseInt(idx);
			try {
				conn = dao.getConnection();
				
				String str = "DELETE FROM board WHERE no = ?";
				pstmt = conn.prepareStatement(str);
				pstmt.setInt(1, no);
				pstmt.executeUpdate();
				System.out.println("삭제완료");
			} catch (Exception e) {
				System.out.println("삭제실패");
				e.printStackTrace();
			}
	}
	
	
	//수정
	public void update(int idx, String pw, String title, String content,Timestamp regdate) {
		try {
			conn = dao.getConnection();
			
			String str = "UPDATE board SET pw = ?, title = ?, content = ?, regdate = ? WHERE no = ?";
			pstmt = conn.prepareStatement(str);
			pstmt.setString(1, pw);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setTimestamp(4, regdate);
			pstmt.setInt(5, idx);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
