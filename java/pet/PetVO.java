package pet;

public class PetVO {
	private int pid;// 펫 번호
	private String pname; // 펫 이름
	private String pvarity; // 펫 종
	private String page; // 펫 나이
	private String pweight; // 펫 무게
	private String pbirth; // 펫 생일
	private String mid; // 멤버 아이디
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPvarity() {
		return pvarity;
	}
	public void setPvarity(String pvarity) {
		this.pvarity = pvarity;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getPweight() {
		return pweight;
	}
	public void setPweight(String pweight) {
		this.pweight = pweight;
	}
	public String getPbirth() {
		return pbirth;
	}
	public void setPbirth(String pbirth) {
		this.pbirth = pbirth;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	@Override
	public String toString() {
		return "PetVO [pid=" + pid + ", pname=" + pname + ", pvarity=" + pvarity + ", page=" + page + ", pweight="
				+ pweight + ", pbirth=" + pbirth + ", mid=" + mid + "]";
	}
	
	
	
}
