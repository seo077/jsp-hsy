package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import utill.DBManager;

public class CommentsLikeDAO {
	private CommentsLikeDAO() {};
	private static CommentsLikeDAO instance = new CommentsLikeDAO();
	public static CommentsLikeDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public boolean getLikes(int commentNo,String userId){
		String sql = "select * from commentsLike WHERE commentNo = ?";
		
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,commentNo);
			
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
	
	public int upLike(int commentNo, String userId) {
		
		String sql = "insert into commentsLike values (?,?)";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commentNo);
			pstmt.setString(2, userId);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 데이터베이스 오류
		return -2;
	}
	
	public int downLikes(int commentNo, String userId) {
		
		String sql = "DELETE FROM commentsLike WHERE commentNo = ? AND userId =?;";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commentNo);
			pstmt.setString(2, userId);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 데이터베이스 오류
		return -2;
	}
}
