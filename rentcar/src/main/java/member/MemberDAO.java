package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

import utill.DBManager;

public class MemberDAO {
	private MemberDAO() {};
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	// member �迭
	private ArrayList<MemberDTO>members = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt;
	private ResultSet rs = null;
	
	// 회원가입
	public int join(MemberDTO member) {
		Calendar cd = Calendar.getInstance();
		long time = cd.getTimeInMillis();
		Timestamp regDate = new Timestamp(time);
		
		try {
			conn = DBManager.getConnection();
			
			String sql = "INSERT INTO member VALUES (?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setDate(4, member.getBirth_year());
			pstmt.setString(5, member.getGender());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getCountry());
			pstmt.setString(8, member.getPhone_number());
			pstmt.setTimestamp(9, regDate);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("실패");
		return -2; // 데이터베이스 오류
	}
	
	// 로그인
	public int login(String id, String pw) {
		String sql = "SELECT pw FROM member WHERE id = ?";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pw.equals(rs.getString(1))) {
					return 1; //로그인 성공
				}else {
					return -2; // 비밀번호 오류
				}
			}
			return -1; // 존재하지 않는 아이디
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -3; //데이터베이스 오류
	}
	// 회원 탈퇴
}
