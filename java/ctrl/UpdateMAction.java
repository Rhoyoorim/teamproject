package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class UpdateMAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO vo=new MemberVO();
		MemberDAO dao=new MemberDAO();
		vo.setMid(request.getSession().getAttribute("mid")+"");
		vo.setMpw(request.getParameter("mpw"));
		vo.setMname(request.getParameter("mname"));
		vo.setMnick(request.getParameter("mnick"));
		vo.setMbirth(request.getParameter("mbirth"));
		vo.setMemail(request.getParameter("memailid")+"@"+request.getParameter("memailAd"));
		vo.setPhone(request.getParameter("phone"));
		
		ActionForward forward=new ActionForward();
		if(dao.update(vo)) {
			System.out.println("로그: 성공");
			forward.setPath("/updateMSuccess.jsp");
			forward.setRedirect(true);
			return forward;
		}else {
			System.out.println("로그: 실패");
			forward.setPath("/memberChangeEx.jsp");
			forward.setRedirect(false);
			return forward;
		}
		
		
	}

}
