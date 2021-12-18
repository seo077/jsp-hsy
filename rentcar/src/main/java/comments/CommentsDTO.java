package comments;

import java.sql.Timestamp;

public class CommentsDTO {
	private int boardNo;
	private String userId;
	private String comments;
	private int likes;
	private int hates;
	private Timestamp regdate;
	
	public CommentsDTO(int boardNo, String userId,String comments,int likes,int hates,Timestamp regdate) {
		this.boardNo = boardNo;
		this.userId = userId;
		this.comments = comments;
		this.likes = likes;
		this.hates = hates;
		this.regdate = regdate;
	}
	public CommentsDTO(int boardNo, String userId,String comments,Timestamp regdate) {
		this.boardNo = boardNo;
		this.userId = userId;
		this.comments = comments;
		this.regdate = regdate;
	}
	
	public int getBoardNo() {
		return boardNo;
	}

	public String getUserId() {
		return userId;
	}

	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getHates() {
		return hates;
	}
	public void setHates(int hates) {
		this.hates = hates;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
}
