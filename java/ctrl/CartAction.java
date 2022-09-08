package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.ItemDAO;
import item.ItemVO;

public class CartAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ItemVO vo=new ItemVO();
		ItemDAO dao=new ItemDAO();
		vo.setIid(request.getParameter("iid"));
		ArrayList<ItemVO> datas=(ArrayList<ItemVO>)request.getSession().getAttribute("data");
		ItemVO cvo=dao.selectOne2(vo);
		datas.add(cvo);
		request.getSession().setAttribute("data", datas);

		ActionForward forward=new ActionForward();
		forward.setPath("/detail.do?iid="+request.getParameter("iid"));
		forward.setRedirect(false);
		return forward;
	}

}
