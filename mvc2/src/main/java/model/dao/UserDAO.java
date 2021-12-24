package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBManager;

public class UserDAO {
	private UserDAO() {};
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public int join(String id,String pw,String userName) {
		String sql ="insert into userInfo values (?,?,?)";
		try {
			
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, userName);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류(아이디 중복)
	}
	
	public int login(String id,String pw) {
		String sql = "select pw from userInfo where id = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String dbPw = rs.getString(1);
				
				if(dbPw.equals(pw)) {
					return 0; // 로그인 성공
				}else {
					return -3; // 비밀번호 오류
				}
			}else {
				return -1; // 존재하지 않는 아이디
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -2; // 데이터베이스 오류
	}
	
}
