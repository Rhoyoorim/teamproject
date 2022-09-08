package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.ItemDAO;
import item.ItemSetVO;
import item.ItemVO;

public class DetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ItemVO vo=new ItemVO();
		ItemDAO dao=new ItemDAO();
		vo.setIid(request.getParameter("iid"));
		ItemSetVO datas=dao.selectOne(vo);
		request.setAttribute("datas", datas);
		
		ActionForward forward=new ActionForward();
		forward.setPath("/detail.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
