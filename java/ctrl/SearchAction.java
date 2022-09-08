package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.ItemDAO;
import item.ItemVO;

public class SearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ItemVO vo=new ItemVO();
		ItemDAO dao=new ItemDAO();
		int more;
		System.out.println("로그 search :"+request.getParameter("search"));
		vo.setIcategory(request.getParameter("search"));
		request.setAttribute("search", request.getParameter("search"));
		System.out.println("로그:SearchAction");
		if(request.getParameter("more")==null) {
			System.out.println("로그:more==null");
			vo.setMore(12);	
			more=12;
		}else {
			vo.setMore(Integer.parseInt(request.getParameter("more").replaceAll("[^0-9]", "")));
			more=Integer.parseInt(request.getParameter("more").replaceAll("[^0-9]", ""))+1;
		}
		request.setAttribute("more", more);
		ItemVO vo2=new ItemVO();
		vo2.setIcategory(request.getParameter("search"));
		vo2.setMore(more+1);
		ArrayList<ItemVO> datas=dao.selectAll(vo);
		if(datas.size()==dao.selectAll(vo2).size()) {
			int flag=1;
			request.setAttribute("flag", flag);
		}
		request.setAttribute("ITEM", datas);
		
		ActionForward forward=new ActionForward();
		forward.setPath("/productlist.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
