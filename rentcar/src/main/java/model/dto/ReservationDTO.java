package model.dto;

import java.sql.Timestamp;

public class ReservationDTO {
	private int carNo;
	private String userId;
	private String startday;
	private String endday;
	private Timestamp regdate;
	
	public ReservationDTO(int carNo,String userId,String startday,String endday,Timestamp regdate) {
		this.carNo = carNo;
		this.userId = userId;
		this.startday = startday;
		this.endday = endday;
		this.regdate = regdate;
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

	public String getStartday() {
		return startday;
	}

	public void setStartday(String startday) {
		this.startday = startday;
	}

	public String getEndday() {
		return endday;
	}

	public void setEndday(String endday) {
		this.endday = endday;
	}

	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
}
