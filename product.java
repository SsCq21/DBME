package bean;

public class product {
	public product() {}
	private String Pid;
	private String Pname;
	private int inventory;
	private String type;
	private String image;
	private double price;
	
	private int Pquantity;
	
	public String getPid() {
		return Pid;
	}
	public void setPid(String Pid) {
		this.Pid=Pid;
	}
	
	public String getPname() {
		return Pname;
	}
	public void setPname(String Pname) {
		this.Pname=Pname;
	}
	
	public int getinventory() {
		return inventory;
	}
	public void setinventory(int inventory) {
		this.inventory=inventory;
	}
	
	public String gettype() {
		return type;	
	}
	public void settype(String type) {
		this.type=type;
	}
	
	public String getimage() {
		return image;
	}
	public void setimage(String image) {
		this.image=image;
	}
	
	public double getprice() {
		return price;
	}
	public void setprice(double price) {
		this.price=price;
	}
	
	public int getPquantity() {
		return Pquantity;
	}
	public void setPquantity(int Pquantity) {
		this.Pquantity=Pquantity;
	}
	
	

}
