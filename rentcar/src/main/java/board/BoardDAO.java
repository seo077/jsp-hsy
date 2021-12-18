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
}
