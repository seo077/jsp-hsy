package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import utill.DBManager;

public class BoardDAO {
	private BoardDAO() {};
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private ArrayList<BoardDTO>boards = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<BoardDTO> getBoards(){
		String sql = "select * from board";
		
		boards = new ArrayList<BoardDTO>();
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int boardNo = rs.getInt(1);
				String userId = rs.getString(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				int likes = rs.getInt(5);
				int views = rs.getInt(6);
				Timestamp regdate = rs.getTimestamp(7);
				
				BoardDTO board = new BoardDTO(boardNo,userId,title,content,likes,views,regdate);
				boards.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boards;
	}
	
	public int write(BoardDTO board) {
		String sql = "insert into board(userId,title,content,regdate) values (?,?,?,?)";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getUserId());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setTimestamp(4, board.getRegdate());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public BoardDTO getBoardView(String boardNo) {
		int intNo = Integer.parseInt(boardNo);
		BoardDTO board = null;
		
		String sql = "SELECT * FROM board WHERE boardNo = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, intNo);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt(1);
				String userId = rs.getString(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				int likes = rs.getInt(5);
				int views = rs.getInt(6);
				Timestamp regdate = rs.getTimestamp(7);
				
				board = new BoardDTO(no,userId,title,content,likes,views,regdate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	
	public int update(String boardNo, String title,String content) {
		int no = Integer.parseInt(boardNo);
		String sql = "UPDATE board SET title = ?, content = ? WHERE boardNo = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,title);
			pstmt.setString(2,content);
			pstmt.setInt(3, no);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int upViews(String boardNo,int views) {
		int no = Integer.parseInt(boardNo);
		String sql = "UPDATE board SET views = ? WHERE boardNo = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,views+1);
			pstmt.setInt(2,no);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
		
	}
	
	public int upLikes(String boardNo,int likes) {
		int no = Integer.parseInt(boardNo);
		String sql = "UPDATE board SET likes = ? WHERE boardNo = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,likes+1);
			pstmt.setInt(2,no);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
		
	}
	
	public int downLikes(String boardNo,int likes) {
		int no = Integer.parseInt(boardNo);
		String sql = "UPDATE board SET likes = ? WHERE boardNo = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,likes-1);
			pstmt.setInt(2,no);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
		
	}
	
	public int delete(String boardNo) {
		int no = Integer.parseInt(boardNo);
		String sql="DELETE FROM board WHERE boardNo = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -2;
	}
	
	public int delBoard(String userId) {
		String sql="DELETE FROM board WHERE userId = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -2;
	}
	
	public int updateId(String userId,String newid) {
		String sql = "UPDATE board SET userId = ? WHERE userId = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,newid);
			pstmt.setString(2,userId);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
}
