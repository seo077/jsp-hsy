package model.dto;

public class LikesDTO {
	private int boardNo;
	private String userId;
	
	public LikesDTO(int boardNo, String userId) {
		this.boardNo = boardNo;
		this.userId = userId;
	}
	
	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
