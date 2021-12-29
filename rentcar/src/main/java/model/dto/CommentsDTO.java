package model.dto;

import java.sql.Timestamp;

public class CommentsDTO {
	
	public static int LIKE = 1;
	public static int HATE = 2;
	public static int DEL = 3;
	
	private int commentNo;
	private int boardNo;
	private String userId;
	private String comments;
	private int likes;
	private int hates;
	private Timestamp regdate;
	
	public CommentsDTO(int commernNo, int boardNo, String userId,String comments,int likes,int hates,Timestamp regdate) {
		this.commentNo = commernNo;
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
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
