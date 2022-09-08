package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pet.PetDAO;
import pet.PetVO;

public class InsertPAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PetVO vo=new PetVO();
		PetDAO dao=new PetDAO();
		vo.setMid(request.getSession().getAttribute("mid")+"");
		vo.setPage(request.getParameter("page"));
		vo.setPbirth(request.getParameter("pbirth"));
		vo.setPname(request.getParameter("pname"));
		vo.setPvarity(request.getParameter("pvarity"));
		vo.setPweight(request.getParameter("pweight"));
		if(dao.insert(vo)) {
			System.out.println("로그:펫등록 성공");
			ActionForward forward=new ActionForward();
			forward.setPath("/petSuccess.jsp");
			forward.setRedirect(true);
			return forward;
		}else {
			System.out.println("로그:펫등록 실패");
			ActionForward forward=new ActionForward();
			forward.setPath("/inputpet.jsp");
			forward.setRedirect(true);
			return forward;
		}
		
		
	}

}
