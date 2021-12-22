package rentalCar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

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
	
	//전체 출력
	public ArrayList<RentalCarDTO> getcars(){
		try {
			conn = DBManager.getConnection();
			
			String sql = "select * from rentalCar";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			cars = new ArrayList<RentalCarDTO>();
			while(rs.next()) {
					int no = rs.getInt(1);
					int available = rs.getInt(2);
					String img = rs.getString(3);
					int price = rs.getInt(4);
					String modelName = rs.getString(7);
					int qty = rs.getInt(10);
					int usein = rs.getInt(11);
					int isdiscount = rs.getInt(18);
					
					RentalCarDTO car = new RentalCarDTO(no,available,img,price,modelName,qty,usein,isdiscount);
					cars.add(car);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cars;
	}
	// 차 종류로 검색
	public ArrayList<RentalCarDTO> getType_car(String car_type){
		String sql = "SELECT * FROM rentalCar WHERE car_type = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, car_type);
			
			rs = pstmt.executeQuery();
			cars = new ArrayList<>();
			while(rs.next()) {
				int no = rs.getInt(1);
				int available = rs.getInt(2);
				String img = rs.getString(3);
				int price = rs.getInt(4);
				String modelName = rs.getString(7);
				int qty = rs.getInt(10);
				int usein = rs.getInt(11);
				int isdiscount = rs.getInt(18);
				
				RentalCarDTO car = new RentalCarDTO(no,available,img,price,modelName,qty,usein,isdiscount);
				cars.add(car);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cars;
	}
	
	// 보험이 있는 차 or 없는 차
	public ArrayList<RentalCarDTO> getusein_car(int usein){
		String sql = "SELECT * FROM rentalCar WHERE usein = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, usein);
			
			rs = pstmt.executeQuery();
			cars = new ArrayList<>();
			while(rs.next()) {
				int no = rs.getInt(1);
				int available = rs.getInt(2);
				String img = rs.getString(3);
				int price = rs.getInt(4);
				String modelName = rs.getString(7);
				int qty = rs.getInt(10);
				int useinn = rs.getInt(11);
				int isdiscount = rs.getInt(18);
				
				RentalCarDTO car = new RentalCarDTO(no,available,img,price,modelName,qty,useinn,isdiscount);
				cars.add(car);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cars;
	}
	
	// 할인하는 차 출력
	public ArrayList<RentalCarDTO> getdiscount_car(int isdiscount){
		String sql = "SELECT * FROM rentalCar WHERE isdiscount = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, isdiscount);
			
			rs = pstmt.executeQuery();
			cars = new ArrayList<>();
			while(rs.next()) {
				int no = rs.getInt(1);
				int available = rs.getInt(2);
				String img = rs.getString(3);
				int price = rs.getInt(4);
				String modelName = rs.getString(7);
				int qty = rs.getInt(10);
				int usein = rs.getInt(11);
				int isdiscountt = rs.getInt(18);
				
				RentalCarDTO car = new RentalCarDTO(no,available,img,price,modelName,qty,usein,isdiscountt);
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
