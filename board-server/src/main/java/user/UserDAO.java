package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

public class UserDAO {
	// DAO : Date Access Object [�߾ӵ����� ���� ���� ���� ���ϰ� �̱���]
	public static final int REMOVE = 0;
	public static final int UPDATE = 1;
	
	// 1. Singletone Pattern
	private UserDAO () {}
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	
	// 2. DTO�� ���� ��ü �迭(ArrayList)
	private ArrayList<UserDTO>users = null;
	
	// 3. ���� �����ͺ��̽��� ������ ��ü�� (SQL)
	// �� 1) Connection : (DB����)
	// �� 2) PreparedStatement : DB�� ������ ���� �غ�
	// �� 3) ResultSet : excute�� ������ ���� ������� ��������.
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public Connection getConnection() {
		try {
			// ����̹� ���� (jdbc mysql connector (.jar)�� -> 	WEB-INF/lib ������ �־��ֱ�
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//url = "jdbc:mysql://localhost:3306/�����ͺ��̽���Ű����?serverTimezone=UTC"; // �����ͺ��̽� �ּ�
			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=UTC";
			String id = "root";
			String pw = "gkqrur1!1531a";
			
			conn = DriverManager.getConnection(url, id, pw);
			
			if(conn != null) {
				System.out.println("�����ͺ��̽� ���� ����!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("�����ͺ��̽� ���� ����!");
		}
		return conn;
	}
	
	//������ ��ȸ(��ü �迭�� �ʱ�ȭ - ������ �����Ϳ� ���ؼ�)
	public ArrayList<UserDTO>getUsers(){
		
		try {
			conn = getConnection(); // DB����
			
			//������ ��Ʈ�� Ÿ������ �ۼ�
			String str = "select * from users"; // sql ������ �غ�
			pstmt = conn.prepareStatement(str); // ������ prepareStatement()�޼ҵ带 Ȱ���Ͽ� �¿�
			rs = pstmt.executeQuery();			// ������ ������ ���ÿ� rs�� ������� ����.
			
			users = new ArrayList<UserDTO>();
			while(rs.next()) { //��(row) ����
				String id = rs.getString(1); // id
				String pw = rs.getString(2); // pw
				Timestamp regDate = rs.getTimestamp(3); // reg
				
				UserDTO P = new UserDTO(id, pw, regDate);
				users.add(P);
			}
			System.out.println("������ �ҷ����� �Ϸ�!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("������ �ҷ����� ����...");
		}
				
		return users;
	}
	
	public int addUser(UserDTO user){
		
		// �ߺ� ���� ó�� �޼ҵ� �߰�
		if(checkUser(user.getId())) {
			try {
				UserDTO newUser = new UserDTO(user.getId(), user.getPw(), new Timestamp(Calendar.getInstance().getTimeInMillis()));
				
				conn = getConnection();
				
				String str = "insert into users values(?,?,?)"; // ?�ڸ��� ���ΰ��� setter�� ó���� �����̴�.
				pstmt = conn.prepareStatement(str);
				pstmt.setString(1, user.getId());
				pstmt.setString(2, user.getPw());
				pstmt.setTimestamp(3, user.getRegDate()); //������� ���� �ϼ� -> ���� ������¡
				
				pstmt.executeUpdate();   // �ϼ��� ������ ������ �����ͺ��̽��� ����. << db�� ������Ʈ
				
				users.add(newUser); // �������� ���¿��� dao�� ��ü �迭�� ������Ʈ   << DAO
				
				System.out.println("������Ʈ ����");
				
				return users.size();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("������Ʈ ����");
			}
		}
		System.out.println("���̵� �ߺ�");
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
