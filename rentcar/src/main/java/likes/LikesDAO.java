package likes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import board.BoardDAO;
import board.BoardDTO;
import utill.DBManager;

public class LikesDAO {
	private LikesDAO() {};
	private static LikesDAO instance = new LikesDAO();
	public static LikesDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public boolean getLikes(int boardNo,String userId){
		String sql = "select * from likes WHERE boardNo = ?";
		
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,boardNo);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString(2);
				if(id.equals(userId)) {
					//이미 좋아요 누름
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public int upLikes(int boardNo, String userId) {
		
		String sql = "insert into likes values (?,?)";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			pstmt.setString(2, userId);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 데이터베이스 오류
		return -2;
	}
	
	public int downLikes(int boardNo, String userId) {
		
		String sql = "DELETE FROM likes WHERE boardNo = ? AND userId =?;";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			pstmt.setString(2, userId);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 데이터베이스 오류
		return -2;
	}
	
	public int delBoard(int boardNo) {
		
		String sql = "DELETE FROM likes WHERE boardNo = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 데이터베이스 오류
		return -2;
	}
}
