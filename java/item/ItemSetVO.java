package item;

import java.util.ArrayList;

import review.ReviewVO;

public class ItemSetVO {

	
	private ItemVO itemVO;
	private ArrayList<ReviewVO> rList =new ArrayList<ReviewVO>();
	
	public ItemVO getItemVO() {
		return itemVO;
	}
	public void setItemVO(ItemVO itemVO) {
		this.itemVO = itemVO;
	}
	public ArrayList<ReviewVO> getrList() {
		return rList;
	}
	public void setrList(ArrayList<ReviewVO> rList) {
		this.rList = rList;
	}
}
