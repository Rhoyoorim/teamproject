package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.ItemDAO;
import item.ItemVO;

public class ProductListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ItemVO vo=new ItemVO();
		ItemDAO dao=new ItemDAO();
		int more=Integer.parseInt(request.getParameter("more").replaceAll("[^0-9]", ""));
		vo.setIid(request.getParameter("iid"));
		vo.setMore(more);
		ItemVO vo2=new ItemVO();
		vo2.setIid(request.getParameter("iid"));
		vo2.setMore(more+1);
		if(dao.selectAll(vo).size()==dao.selectAll(vo2).size()) {
			int flag=1;
			request.setAttribute("flag", flag);
		}
		request.setAttribute("iid", request.getParameter("iid"));
		request.setAttribute("more", request.getParameter("more").replaceAll("[^0-9]", ""));
		System.out.println("로그 iid:"+request.getAttribute("iid"));
		ArrayList<ItemVO> datas=dao.selectAll(vo);
		if(datas.size()!=0) {
			if(datas.get(0).getIid().substring(0,3).equals("053")) {
				request.setAttribute("icategory", "댕댕이");
			}else {
				request.setAttribute("icategory", "냥냥이");
			}
		}
		request.setAttribute("ITEM", datas);
		ActionForward forward=new ActionForward();
		forward.setPath("/productlist.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
