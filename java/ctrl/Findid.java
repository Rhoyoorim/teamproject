package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class Findid implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDAO dao=new MemberDAO();
		MemberVO vo=new MemberVO();
		ActionForward forward=new ActionForward();

		vo.setMnick(request.getParameter("mnick"));

		vo = dao.selectOne_id(vo);
		if(vo!=null) {
//			System.out.println("로그 1 [" + vo.getMid()+ "]");
			request.setAttribute("member", vo);
			forward.setPath("idfindresult.jsp");
			forward.setRedirect(false);
			return forward;
		}
		
		int flag=1;
		request.setAttribute("check", flag);
		forward.setPath("idfind.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
