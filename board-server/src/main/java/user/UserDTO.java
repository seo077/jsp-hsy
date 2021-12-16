package user;

import java.sql.Timestamp;

public class UserDTO {
	private String id,pw;
	private Timestamp regDate;
	
	//»ý¼ºÀÚ
	public UserDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	public UserDTO(String id, String pw, Timestamp regDate) {
		this.id = id;
		this.pw = pw;
		this.regDate = regDate;
	}
	
	//getter,setter
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Timestamp getRegDate() {
		return regDate;
	}

	@Override
	public String toString() {
		return String.format("%s/%s/%s\n", id,pw,regDate);
	}
	
}
