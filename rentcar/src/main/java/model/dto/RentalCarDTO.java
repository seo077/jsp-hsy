package model.dto;


public class RentalCarDTO {
	private int no;
    private int available; // 이용가능(de) : 0, 이용 불가 :1
    private String img;
    private int price;
    private int usepeople;
    private String company;
    private String modelName;
    private String fuel;
    private String olds;
    private int qty;
    private int usein;
    private int usenavi;
    private int useseat;
    private int usewifi;
    private int userearcam;
    private int usehi_pass;
    private int useblack_box;
    private int isdiscount;
    private String car_type;
    
    public RentalCarDTO(int no,int available,String img,
    		int price,int usepeople,String company, String modelName,String fuel,String olds,int qty,int usein,int usenavi,int useseat,int usewifi,int userearcam,int usehi_pass,int useblack_box,int isdiscount,String car_type) {
    	this.no = no;
    	this.available = available;
    	this.img = img;
    	this.price = price;
    	this.usepeople = usepeople;
    	this.company = company;
    	this.modelName = modelName;
    	this.fuel = fuel;
    	this.olds = olds;
    	this.qty = qty;
    	this.usein = usein;
    	this.usenavi = usenavi;
    	this.useseat = useseat;
    	this.usewifi = usewifi;
    	this.userearcam = userearcam;
    	this.usehi_pass = usehi_pass;
    	this.useblack_box = useblack_box;
    	this.isdiscount = isdiscount;
    	this.car_type = car_type;
    	}
    
    public int getIsdiscount() {
		return isdiscount;
	}

	public void setIsdiscount(int isdiscount) {
		this.isdiscount = isdiscount;
	}

	public String getCar_type() {
		return car_type;
	}

	public void setCar_type(String car_type) {
		this.car_type = car_type;
	}

	public RentalCarDTO(int no,int available,String img,int price, String modelName,int qty,int usein,int isdiscount) {
    	this.no = no;
    	this.available = available;
    	this.img = img;
    	this.price = price;
    	this.modelName = modelName;
    	this.qty = qty;
    	this.usein = usein;
    	this.isdiscount = isdiscount;
    }
   
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}

	public int getAvailable() {
		return available;
	}
	public void setAvailable(int available) {
		this.available = available;
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
	public int getUsepeople() {
		return usepeople;
	}
	public void setUsepeople(int usepeople) {
		this.usepeople = usepeople;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	public String getOlds() {
		return olds;
	}
	public void setOlds(String olds) {
		this.olds = olds;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getUsein() {
		return usein;
	}
	public void setUsein(int usein) {
		this.usein = usein;
	}
	public int getUsenavi() {
		return usenavi;
	}
	public void setUsenavi(int usenavi) {
		this.usenavi = usenavi;
	}
	public int getUseseat() {
		return useseat;
	}
	public void setUseseat(int useseat) {
		this.useseat = useseat;
	}
	public int getUsewifi() {
		return usewifi;
	}
	public void setUsewifi(int usewifi) {
		this.usewifi = usewifi;
	}
	public int getUserearcam() {
		return userearcam;
	}
	public void setUserearcam(int userearcam) {
		this.userearcam = userearcam;
	}
	public int getUsehi_pass() {
		return usehi_pass;
	}
	public void setUsehi_pass(int usehi_pass) {
		this.usehi_pass = usehi_pass;
	}
	public int getUseblack_box() {
		return useblack_box;
	}
	public void setUseblack_box(int useblack_box) {
		this.useblack_box = useblack_box;
	}
    

}
