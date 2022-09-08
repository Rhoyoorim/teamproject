package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pet.PetDAO;
import pet.PetVO;

public class UpdatePAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		PetVO vo=new PetVO();
		PetDAO dao=new PetDAO();
		vo.setPid(Integer.parseInt(request.getParameter("pid")));
		vo.setPage(request.getParameter("page"));
		vo.setPbirth(request.getParameter("pbirth"));
		vo.setPname(request.getParameter("pname"));
		vo.setPvarity(request.getParameter("pvarity"));
		vo.setPweight(request.getParameter("pweight"));
		
		if(dao.update(vo)) {
			System.out.println("로그: 펫수정 성공");
			forward.setPath("/updatePSuccess.jsp");
			forward.setRedirect(true);
			return forward;			
		}else {
			System.out.println("로그: 펫수정 실패");
			forward.setPath("/main.do");
			forward.setRedirect(true);
			return forward;	
		}
	}

}
