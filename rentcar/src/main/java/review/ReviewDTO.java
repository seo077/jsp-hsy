package review;

import java.sql.Timestamp;

public class ReviewDTO {
	private int carNo;
	private String userId;
	private String review;
	private Timestamp regdate;
	private int realuser;
	
	public ReviewDTO(int carNo, String userId,String review,Timestamp regdate, int realuser) {
		this.carNo = carNo;
		this.userId = userId;
		this.review = review;
		this.regdate = regdate;
		this.realuser = realuser;
	}
	
	public int getCarNo() {
		return carNo;
	}
	public void setCarNo(int carNo) {
		this.carNo = carNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getRealuser() {
		return realuser;
	}
	public void setRealuser(int realuser) {
		this.realuser = realuser;
	}
}
