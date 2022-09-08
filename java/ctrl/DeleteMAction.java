package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
import member.MemberVO;
import pet.PetDAO;
import pet.PetVO;

public class DeleteMAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		HttpSession session=request.getSession();
		MemberVO vo=new MemberVO();
		MemberDAO dao=new MemberDAO();
		vo.setMid(request.getSession().getAttribute("mid")+"");
		
		if(dao.delete(vo)) {
		System.out.println("로그: 회원삭제 성공");
		session.invalidate();
		forward.setPath("/deleteMSuccess.jsp");
		forward.setRedirect(true);
		return forward;
		}else {
			System.out.println("로그: 회원삭제 실패");
			forward.setPath("/main.do");
			forward.setRedirect(true);
			return forward;
		}
	}

}
