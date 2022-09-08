package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class MemberChangeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO vo=new MemberVO();
		MemberDAO dao=new MemberDAO();
		vo.setMid(request.getSession().getAttribute("mid")+"");
		MemberVO user=dao.selectOne(vo);
		String arr[]=user.getMemail().split("@");
		request.setAttribute("mpw", user.getMpw());
		request.setAttribute("mname", user.getMname());
		request.setAttribute("mnick", user.getMnick());
		request.setAttribute("memail", arr[0]);
		request.setAttribute("mbirth", user.getMbirth());
		request.setAttribute("phone", user.getPhone());
		
		ActionForward forward=new ActionForward();
		forward.setPath("/memberChangeEx.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
