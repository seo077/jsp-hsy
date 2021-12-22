package comments;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import utill.DBManager;

public class CommentsDAO {
	private CommentsDAO() {};
	private static CommentsDAO instance = new CommentsDAO();
	public static CommentsDAO getInstance() {
		return instance;
	}
	
	private ArrayList<CommentsDTO>replies = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<CommentsDTO> getReplies(String boardNo){
		replies = new ArrayList<CommentsDTO>();
		int boardInt = Integer.parseInt(boardNo);
		String sql= "SELECT * FROM comments WHERE boardNo = ?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,boardInt);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt(1);
				String userId = rs.getString(2);
				String comments = rs.getString(3);
				int likes = rs.getInt(4);
				int hates = rs.getInt(5);
				Timestamp regdate = rs.getTimestamp(6);
				
				CommentsDTO comment = new CommentsDTO(no, userId, comments, likes, hates, regdate);
				replies.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return replies;
	}
	
	public int writeReply(CommentsDTO comment) {
		String sql = "INSERT INTO comments(boardNo,userId,comments,regdate) VALUES (?,?,?,?)";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment.getBoardNo());
			pstmt.setString(2, comment.getUserId());
			pstmt.setString(3, comment.getComments());
			pstmt.setTimestamp(4, comment.getRegdate());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int delBoard(int boardNo) {
		String sql = "DELETE FROM comments WHERE boardNo = ?";
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
	
	//삭제
	public int delComment(String userId) {
		String sql="DELETE FROM comments WHERE userId = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int updateId(String userId,String newid) {
		String sql = "UPDATE comments SET userId = ? WHERE userId = ?";
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