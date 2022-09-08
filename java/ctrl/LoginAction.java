package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import item.ItemVO;
import member.MemberDAO;
import member.MemberVO;

public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDAO dao=new MemberDAO();
		MemberVO vo=new MemberVO();
		HttpSession session=request.getSession();
		session.setMaxInactiveInterval(60*60);
		ActionForward forward=new ActionForward();
		String flag="1";
		ArrayList<ItemVO> datas=new ArrayList<ItemVO>();
		session.setAttribute("data", datas);
		if(request.getParameter("amid")!=null) {
			vo.setMid(request.getParameter("amid"));
			if(dao.check(vo)==2) {
				if(dao.APIinsert(vo)) {
				System.out.println("로그: APIinsert 완료");
				}
			}
			System.out.println(request.getParameter("amid"));
			session.setAttribute("mid", request.getParameter("amid"));
			forward.setPath("main.do");
			forward.setRedirect(false);
			return forward;
		}else if(request.getParameter("amid")==null){
				vo.setMid(request.getParameter("mid"));
				vo.setMpw(request.getParameter("mpw"));
				MemberVO mVO=dao.selectOne(vo);
				if(mVO==null) {
					System.out.println("로그: 로그인 실패");
					request.setAttribute("flag", flag);
					forward.setPath("login.jsp");
					forward.setRedirect(true);
					return forward;
				}else {
					session.setAttribute("mid", mVO.getMid());
					session.setAttribute("mpw", mVO.getMpw());
					forward.setPath("main.do");
					forward.setRedirect(false);
					return forward;
				}
			}else{
				throw new Exception("login 오류");
			}
		}
	}

