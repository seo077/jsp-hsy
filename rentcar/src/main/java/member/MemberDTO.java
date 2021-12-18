package member;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberDTO {
	private String id, pw, name, gender,email,country,phone_number;
	private Date birth_year;
	private Timestamp regDate;
	
	public MemberDTO(String id, String pw, String name, Date birth_year, String gender, String email, String country, String phone_number) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.gender = gender;
		this.birth_year = birth_year;
		this.email = email;
		this.country = country;
		this.phone_number = phone_number;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public Date getBirth_year() {
		return birth_year;
	}
	public void setBirth_year(Date birth_year) {
		this.birth_year = birth_year;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
}
