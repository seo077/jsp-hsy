package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

public class UserDAO {
	// DAO : Date Access Object [중앙데이터 관리 따라서 접근 못하게 싱글톤]
	public static final int REMOVE = 0;
	public static final int UPDATE = 1;
	
	// 1. Singletone Pattern
	private UserDAO () {}
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	
	// 2. DTO에 대한 객체 배열(ArrayList)
	private ArrayList<UserDTO>users = null;
	
	// 3. 실제 데이터베이스에 연동할 객체들 (SQL)
	// ㄴ 1) Connection : (DB연동)
	// ㄴ 2) PreparedStatement : DB에 쿼리를 날릴 준비
	// ㄴ 3) ResultSet : excute된 쿼리에 대한 결과값을 가져와줌.
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public Connection getConnection() {
		try {
			// 드라이버 연동 (jdbc mysql connector (.jar)를 -> 	WEB-INF/lib 폴더로 넣어주기
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//url = "jdbc:mysql://localhost:3306/데이터베이스스키마명?serverTimezone=UTC"; // 데이터베이스 주소
			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=UTC";
			String id = "root";
			String pw = "gkqrur1!1531a";
			
			conn = DriverManager.getConnection(url, id, pw);
			
			if(conn != null) {
				System.out.println("데이터베이스 연동 성공!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스 연동 실패!");
		}
		return conn;
	}
	
	//데이터 조회(객체 배열을 초기화 - 가져온 데이터에 대해서)
	public ArrayList<UserDTO>getUsers(){
		
		try {
			conn = getConnection(); // DB연동
			
			//쿼리를 스트링 타입으로 작성
			String str = "select * from users"; // sql 쿼리를 준비
			pstmt = conn.prepareStatement(str); // 쿼리를 prepareStatement()메소드를 활용하여 태움
			rs = pstmt.executeQuery();			// 쿼리를 날림과 동시에 rs로 결과값을 받음.
			
			users = new ArrayList<UserDTO>();
			while(rs.next()) { //행(row) 단위
				String id = rs.getString(1); // id
				String pw = rs.getString(2); // pw
				Timestamp regDate = rs.getTimestamp(3); // reg
				
				UserDTO P = new UserDTO(id, pw, regDate);
				users.add(P);
			}
			System.out.println("데이터 불러오기 완료!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터 불러오기 실패...");
		}
				
		return users;
	}
	
	public int addUser(UserDTO user){
		
		// 중복 예외 처리 메소드 추가
		if(checkUser(user.getId())) {
			try {
				UserDTO newUser = new UserDTO(user.getId(), user.getPw(), new Timestamp(Calendar.getInstance().getTimeInMillis()));
				
				conn = getConnection();
				
				String str = "insert into users values(?,?,?)"; // ?자리는 맵핑값을 setter로 처리할 포맷이다.
				pstmt = conn.prepareStatement(str);
				pstmt.setString(1, user.getId());
				pstmt.setString(2, user.getPw());
				pstmt.setTimestamp(3, user.getRegDate()); //여기까지 쿼리 완성 -> 이제 보내야징
				
				pstmt.executeUpdate();   // 완성된 쿼리를 연동된 데이터베이스에 날림. << db에 업데이트
				
				users.add(newUser); // 실행중인 상태에서 dao의 객체 배열도 업데이트   << DAO
				
				System.out.println("업데이트 성공");
				
				return users.size();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("업데이트 실패");
			}
		}
		System.out.println("아이디 중복");
		return -1;
	}
	
	private boolean checkUser(String id) {
		users = getUsers();
		for(UserDTO user : users) {
			if(id.equals(user.getId())) {
				return false;
			}
		}
		return true;
	}

	public boolean checkLogin(String id, String pw) {
		users = getUsers();
		for(UserDTO user : users) {
			if(user.getId().equals(id) && user.getPw().equals(pw)) {
				return true;
			}
		}
		return false;
	}

	public int deleteUser(String id,String pw) {
		users = getUsers();
		int delIdx = -1;
		for(int i=0;i<users.size();i++) {
			if(id.equals(users.get(i).getId()) && pw.equals(users.get(i).getPw())) {
				delIdx = i;
			}
		}
		
		if(delIdx != -1) {
			try {
				conn = getConnection();
				
				String sql = "DELETE FROM users WHERE id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate(); //db
				
				users.remove(delIdx); //dao
				return delIdx;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
}
