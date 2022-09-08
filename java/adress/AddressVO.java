package adress;

public class AddressVO {
	private int aid;
	private String mid; // 멤버 아이디
	private String address; // 주소
	private String aname; // 수령자 이름
	private String aphone; // 수령자 전화번호
	private String aflag; // 배송지
	
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getAphone() {
		return aphone;
	}
	public void setAphone(String aphone) {
		this.aphone = aphone;
	}
	public String getAflag() {
		return aflag;
	}
	public void setAflag(String aflag) {
		this.aflag = aflag;
	}
	@Override
	public String toString() {
		return "AddressVO [aid=" + aid + ", mid=" + mid + ", address=" + address + ", aname=" + aname + ", aphone="
				+ aphone + ", aflag=" + aflag + "]";
	}
	
	
	
}
