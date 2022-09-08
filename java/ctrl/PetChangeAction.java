package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pet.PetDAO;
import pet.PetVO;

public class PetChangeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PetVO vo=new PetVO();
		PetDAO dao=new PetDAO();
		vo.setPid(Integer.parseInt(request.getParameter("pid")));
		PetVO pet=dao.selectOne(vo);
		request.setAttribute("pet", pet);
		
		ActionForward forward=new ActionForward();
		forward.setPath("/petchange.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
