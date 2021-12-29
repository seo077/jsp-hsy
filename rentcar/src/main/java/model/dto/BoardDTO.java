package model.dto;

import java.sql.Timestamp;

public class BoardDTO {
	private int boardNo;
	private String userId;
	private String title;
	private String content;
	private int likes;
	private int views;
	private Timestamp regdate;
	
	public BoardDTO(int boardNo, String userId,String title,String content, int likes, int views,Timestamp regDate) {
		this.boardNo = boardNo;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.likes = likes;
		this.views = views;
		this.regdate = regDate;
	}
	
	public BoardDTO( String userId,String title,String content,Timestamp regDate) {
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.regdate = regDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public String getUserId() {
		return userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
}
