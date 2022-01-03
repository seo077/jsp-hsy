package model.dto;

import java.sql.Timestamp;

public class UserDTO {
	private String name;
	private String id;
	private String pw;
	private int gender;
	private String phone_number;
	private String email;
	private String address;
	private Timestamp joinDate;
	
	public UserDTO(String name,String id,String pw,int gender,String phone_number,String email,String address,Timestamp joinDate) {
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.gender = gender;
		this.phone_number = phone_number;
		this.email = email;
		this.address = address;
		this.joinDate = joinDate;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Timestamp getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}
	
}
