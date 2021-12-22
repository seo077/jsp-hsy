package utill;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBManager {
	private DBManager() {}
	private static DBManager instance = new DBManager();
	public static DBManager getInstange() {
		return instance;
	}
	
	
	// ��� DAO �ȿ��� DB������ �ʿ��� ��,
	// Connection conn = DBManager.getConnection;
	
	// ������ DB(Schema) �ȿ� �ִ� ������ ��,
	// � ���̺��� ���� -> use ��Ű���� (sql ��ɾ� �߰�)
	
	public static Connection getConnection(){
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/rentcar?serverTimezone=UTC";
			String id = "root";
			String pw = "gkqrur1!1531a";
			
			conn = DriverManager.getConnection(url, id, pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}
