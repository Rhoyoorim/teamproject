package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pet.PetDAO;
import pet.PetVO;

public class DeletePAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		PetVO vo=new PetVO();
		PetDAO dao=new PetDAO();
		System.out.println("로그 pid:"+request.getParameter("pid"));
		vo.setPid(Integer.parseInt(request.getParameter("pid").replaceAll("[^0-9]", "")));
		
		if(dao.delete(vo)) {
		System.out.println("로그: 펫삭제 성공");
		forward.setPath("/deletePSuccess.jsp");
		forward.setRedirect(true);
		return forward;
		}else {
			System.out.println("로그: 펫삭제 실패");
			forward.setPath("/main.do");
			forward.setRedirect(true);
			return forward;
		}
	}

}
