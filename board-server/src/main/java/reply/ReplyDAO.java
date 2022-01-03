package reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import user.UserDAO;

public class ReplyDAO {
	private ReplyDAO() {};
	private static ReplyDAO instance = new ReplyDAO();
	public static ReplyDAO getInstance() {
		return instance;
	}
	
	private UserDAO dao = UserDAO.getInstance();
	
	private ArrayList<ReplyDTO>replys = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// �Խñ� ��������
	public ArrayList<ReplyDTO>getReply(){
		try {
			conn = dao.getConnection(); //db����
			
			String str = "select * from reply";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			
			replys = new ArrayList<ReplyDTO>();
			while(rs.next()){
				int no = rs.getInt(1);
				String id = rs.getString(2); 
				String content = rs.getString(3); 
				Timestamp regDate = rs.getTimestamp(4);
				
				ReplyDTO b = new ReplyDTO(id,content,regDate);
				replys.add(b);
				System.out.println("ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return replys;
	}
	
	public void addReply(ReplyDTO reply) {
		try {
			conn = dao.getConnection();
			
			String str = "insert into reply(id,content,regDate) values (?,?,?)";
			pstmt = conn.prepareStatement(str);
			
			pstmt.setString(1, reply.getId());
			pstmt.setString(2, reply.getContent());
			pstmt.setTimestamp(3, reply.getRegdate());
			
			pstmt.executeUpdate();
			
			replys.add(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
