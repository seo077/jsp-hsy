package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import model.dto.RentalCarDTO;
import utill.DBManager;

public class RentalCarDAO {
	private RentalCarDAO() {};
	private static RentalCarDAO instance = new RentalCarDAO();
	public static RentalCarDAO getInstance() {
		return instance;
	}
	
	private ArrayList<RentalCarDTO>cars = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 차 종류 출력
	// 1 ) 보험 선택 : 전체
	public ArrayList<RentalCarDTO> getcars(String type){
		try {
			conn = DBManager.getConnection();
			
			String sql = "";
			if(type.equals("특가할인")) {
				sql = "select * from rentalCar where isdiscount = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, 1);
			}else if(type.equals("전체")) {
				sql = "select * from rentalCar";
				pstmt = conn.prepareStatement(sql);
			}else {
				sql = "select * from rentalCar where car_type = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, type);
			}
			
			rs = pstmt.executeQuery();
			cars = new ArrayList<RentalCarDTO>();
			while(rs.next()) {
					int no = rs.getInt(1);
					int available = rs.getInt(2);
					String img = rs.getString(3);
					int price = rs.getInt(4);
					String modelName = rs.getString(7);
					int qty = rs.getInt(10);
					int in = rs.getInt(11);
					int isdiscount = rs.getInt(18);
					
					RentalCarDTO car = new RentalCarDTO(no,available,img,price,modelName,qty,in,isdiscount);
					cars.add(car);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cars;
	}
	
	// 2) 보험 선택
	public ArrayList<RentalCarDTO> getcars(int usein,String type){
		try {
			conn = DBManager.getConnection();

			String sql = "";
			if(type.equals("특가할인")) {
				sql = "select * from rentalCar where isdiscount = ? and usein = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, 1);
				pstmt.setInt(2,usein);
				rs = pstmt.executeQuery();
			}else if(type.equals("전체")) {
				sql = "select * from rentalCar where usein = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,usein);
				rs = pstmt.executeQuery();
			}else {
				sql = "select * from rentalCar where car_type = ? and usein = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, type);
				pstmt.setInt(2,usein);
				rs = pstmt.executeQuery();
			}
			
			cars = new ArrayList<RentalCarDTO>();
			while(rs.next()) {
				int no = rs.getInt(1);
				int available = rs.getInt(2);
				String img = rs.getString(3);
				int price = rs.getInt(4);
				String modelName = rs.getString(7);
				int qty = rs.getInt(10);
				int in = rs.getInt(11);
				int isdiscount = rs.getInt(18);
				
				RentalCarDTO car = new RentalCarDTO(no,available,img,price,modelName,qty,in,isdiscount);
				cars.add(car);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cars;
	}
	
	
	
	// 차 상세 정보 출력
	public RentalCarDTO getCarInfo(int no) {
		RentalCarDTO car = null;
		String sql = "SELECT * FROM rentalCar WHERE no = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt(1);
				int available = rs.getInt(2);
				String img = rs.getString(3);
				int price = rs.getInt(4);
				int usepeople = rs.getInt(5);
				String company = rs.getString(6);
				String modelName = rs.getString(7);
				String fuel = rs.getString(8);
				String olds = rs.getString(9);
				int qty = rs.getInt(10);
				int usein = rs.getInt(11);
				int usenavi = rs.getInt(12);
				int useseat = rs.getInt(13);
				int usewifi = rs.getInt(14);
				int userearcam = rs.getInt(15);
				int usehi_pass = rs.getInt(16);
				int useblack_box = rs.getInt(17);
				int isdiscountt = rs.getInt(18);
				String car_type = rs.getString(19);
				
				car = new RentalCarDTO(no, available, img, price, usepeople, company, modelName, fuel, olds, qty, usein, usenavi, useseat, usewifi, userearcam, usehi_pass, useblack_box, isdiscountt, car_type);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return car;
	}

	
	// 예약 -> 차 수량 감소
	public int reservation(int no,int qty) {
		String sql="UPDATE rentalCar SET qty =? WHERE no = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qty-1);
			pstmt.setInt(2, no);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	// 예약 취소 -> 차 수량 증가
	public int cancelReservation(int qty,int no) {
		String sql="UPDATE rentalCar SET qty =? WHERE no = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qty+1);
			pstmt.setInt(2, no);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	

	
}
