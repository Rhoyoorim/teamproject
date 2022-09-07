package member;

public class MemberVO {
	private String mid;
	private String mpw;
	private String mnick;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMnick() {
		return mnick;
	}
	public void setMnick(String mnick) {
		this.mnick = mnick;
	}
	@Override
	public String toString() {
		return "MemberVO [mid=" + mid + ", mpw=" + mpw + ", mnick=" + mnick + "]";
	}
}
