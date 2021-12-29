package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import model.dto.CommentsDTO;
import model.dto.ReviewDTO;
import utill.DBManager;

public class ReviewDAO {

	private ReviewDAO() {};
	private static ReviewDAO instance = new ReviewDAO();
	public static ReviewDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<ReviewDTO> getReviews(int carNo){
		ArrayList<ReviewDTO>reviews = null;
		
		String sql= "SELECT * FROM review WHERE carNo = ?";
		try {
			reviews = new ArrayList<ReviewDTO>();
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,carNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt(1);
				String userId = rs.getString(2);
				String revieww = rs.getString(3);
				Timestamp regdate = rs.getTimestamp(4);
				int real = rs.getInt(5);
				
				ReviewDTO review = new ReviewDTO(no, userId, revieww, regdate, real);
				reviews.add(review);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reviews;
	}
	
	public int writeReview(ReviewDTO review) {
		String sql = "INSERT INTO review VALUES (?,?,?,?,?)";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review.getCarNo());
			pstmt.setString(2, review.getUserId());
			pstmt.setString(3, review.getReview());
			pstmt.setTimestamp(4, review.getRegdate());
			pstmt.setInt(5, review.getRealuser());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	// 구매 완료-> 실구매자로 전환
	public int turnReal(int carNo,String userId) {
		String sql="update review set realuser = '1' where userId =? and carNo =?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			pstmt.setInt(2, carNo);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;	
	}
	
	//삭제
	public int delReview(String userId) {
		String sql="DELETE FROM review WHERE userId =?";
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
		String sql = "UPDATE review SET userId = ? WHERE userId = ?";
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
