package bean;
import java.util.Date;

public class transactions {
	public transactions() {}
	private String Tid;
	private Date date;
	private int quantity;
	private String Cid;
	private String Pid;
	private String Sid;
	
	public String getTid() {
		return Tid;
	}
	public void setTid(String Tid) {
		this.Tid=Tid;
	}
	
	public Date getdate() {
		return date;
	}
	public void setdate(Date date) {
		this.date=date;
	}
	
	public int getquantity() {
		return quantity;
	}
	public void setquantity(int quantity) {
		this.quantity=quantity;
	}
	
	public String getCid() {
		return Cid;
	}
	public void setCid(String Cid) {
		this.Cid=Cid;
	}
	
	public String getPid() {
		return Pid;
	}
	public void setPid(String Pid) {
		this.Pid=Pid;
	}
	
	public String getSid() {
		return Sid;
	}
	public void setSid(String Sid) {
		this.Sid=Sid;
	}

}
