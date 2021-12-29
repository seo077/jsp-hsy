package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import utill.DBManager;

public class CommentsHateDAO {
	private CommentsHateDAO() {};
	private static CommentsHateDAO instance = new CommentsHateDAO();
	public static CommentsHateDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public boolean getHate(int commentNo,String userId){
		String sql = "select * from commentsHate WHERE commentNo = ?";
		
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
	
	public int upHate(int commentNo, String userId) {
		
		String sql = "insert into commentsHate values (?,?)";
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
	
public int downHates(int commentNo, String userId) {
		
		String sql = "DELETE FROM commentsHate WHERE commentNo = ? AND userId =?;";
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
