package review;

public class ReviewVO {
	private int rid; // 리뷰번호
	private String iid; // 물건번호
	private String mid; // 멤버아이디
	private String writer; // 작성자
	private String content; // 내용
	private Float star; // 별점
	private String rimg;
	
	public String getRimg() {
		return rimg;
	}
	public void setRimg(String rimg) {
		this.rimg = rimg;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Float getStar() {
		return star;
	}
	public void setStar(Float star) {
		this.star = star;
	}
	@Override
	public String toString() {
		return "ReviewVO [rid=" + rid + ", iid=" + iid + ", mid=" + mid + ", writer=" + writer
				+ ", content=" + content + ", star=" + star + "]";
	}
	
	
	
}
