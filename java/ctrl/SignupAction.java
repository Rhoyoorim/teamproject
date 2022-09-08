package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class SignupAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDAO dao=new MemberDAO();
		MemberVO vo=new MemberVO();

		ActionForward forward=new ActionForward();
			vo.setMid(request.getParameter("mid"));
			vo.setMpw(request.getParameter("mpw"));
			vo.setMname(request.getParameter("mname"));
			vo.setMnick(request.getParameter("mnick"));
			vo.setMemail(request.getParameter("memailid")+request.getParameter("memailAd"));
			vo.setMbirth(request.getParameter("mbirth"));
			vo.setPhone(request.getParameter("phone"));
			if(dao.insert(vo)){			
				forward.setPath("/signSuccess.jsp");
				forward.setRedirect(true);
				return forward;
			}
			else{
				forward.setPath("/signup.jsp");
				forward.setRedirect(false);
				return forward;
			}
		}
	}

