package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class Findpw implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDAO dao=new MemberDAO();
		MemberVO vo=new MemberVO();

		vo.setMid(request.getParameter("mid"));

		vo = dao.selectOne_pw(vo);

		ActionForward forward=new ActionForward();
		
		forward.setPath("pwfindresult.jsp");
		request.setAttribute("member", vo);
		forward.setRedirect(false);
		return forward;
	}

}
