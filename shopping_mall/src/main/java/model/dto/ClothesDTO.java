package model.dto;

public class ClothesDTO {
	private int code;
	private String size;
	private String name;
	private String img;
	private int price;
	private int cnt;
	private int temperature;
	private String type;
	
	public ClothesDTO(int code,String size,String name,String img,int price,int cnt,int temperature,String type) {
		this.code = code;
		this.size = size;
		this.name = name;
		this.img = img;
		this.price = price;
		this.cnt = cnt;
		this.temperature = temperature;
		this.type = type;
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getTemperature() {
		return temperature;
	}
	public void setTemperature(int temperature) {
		this.temperature = temperature;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
