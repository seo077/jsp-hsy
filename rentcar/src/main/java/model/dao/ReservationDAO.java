package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import model.dto.ReservationDTO;
import utill.DBManager;

public class ReservationDAO {
	private ReservationDAO() {};
	private static ReservationDAO instance = new ReservationDAO();
	public static ReservationDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	// 예약
	public int reservation(int carNo,String userId,String startday,String endday,Timestamp regdate) {
		String sql = "INSERT INTO reservation VALUES(?,?,?,?,?)";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, carNo);
			pstmt.setString(2, userId);
			pstmt.setString(3, startday);
			pstmt.setString(4, endday);
			pstmt.setTimestamp(5, regdate);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	// 예약취소
	public int cancelRes(String userId,int carNo) {
		String sql = "DELETE FROM reservation WHERE userId =? AND carNo = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, carNo);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	
	// 모든 예약 삭제
	public int delReservation(String userId) {
		String sql="DELETE FROM reservation WHERE userId =?";
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
	
	// 예약확인
	public ArrayList<ReservationDTO> reservation_confirmation(String userId) {
		String sql = "SELECT * FROM reservation WHERE userId = ?";
		ArrayList<ReservationDTO>reservations = null;
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			reservations = new ArrayList<>();
			while(rs.next()) {
				int carNo = rs.getInt(1);
				String id = rs.getString(2);
				String startday = rs.getString(3);
				String endday = rs.getString(4);
				Timestamp regdate = rs.getTimestamp(5);
				
				ReservationDTO reservation = new ReservationDTO(carNo, id, startday, endday, regdate);
				reservations.add(reservation);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return reservations;
		
	}
	
	// 실 구매자 확인
	public boolean realUser(int carNo,String userId) {
		String sql = "SELECT * FROM reservation WHERE carNo = ? AND userId =?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, carNo);
			pstmt.setString(2, userId);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public int updateId(String userId,String newid) {
		String sql = "UPDATE reservation SET userId = ? WHERE userId = ?";
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
