package buylist;

public class BuyListVO {
	private int bid; // 구매번호
	private String iid; //구매한 물건
	private String mid; // 구매한 멤버
	private int startnum;
	private int endnum;
	
	public int getStartnum() {
		return startnum;
	}
	public void setStartnum(int startnum) {
		this.startnum = startnum;
	}
	public int getEndnum() {
		return endnum;
	}
	public void setEndnum(int endnum) {
		this.endnum = endnum;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getIid() {
		return iid;
	}
	public void setIid(String iid) {
		this.iid = iid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	@Override
	public String toString() {
		return "BuyListVO [bid=" + bid + ", iid=" + iid + ", mid=" + mid + "]";
	}
	
	
}
