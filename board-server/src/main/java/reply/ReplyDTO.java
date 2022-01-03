package reply;

import java.sql.Timestamp;

public class ReplyDTO {
	private int no;
	private String id;
	private String content;
	private Timestamp regdate;
	
	public ReplyDTO(String id, String content,Timestamp regdate) {
		this.id = id;
		this.content = content;
		this.regdate = regdate;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
}
