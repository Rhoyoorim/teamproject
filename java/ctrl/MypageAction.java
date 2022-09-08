package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;
import pet.PetDAO;
import pet.PetVO;

public class MypageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO mvo=new MemberVO();
		MemberDAO mdao=new MemberDAO();
		mvo.setMid(request.getSession().getAttribute("mid")+"");
		MemberVO user=mdao.selectOne(mvo);
		request.setAttribute("mname", user.getMname());
		request.setAttribute("mnick", user.getMnick());
		
		PetVO pvo=new PetVO();
		PetDAO pdao=new PetDAO();
		pvo.setMid(request.getSession().getAttribute("mid")+"");
		ArrayList<PetVO> datas=pdao.selectAll(pvo);
		request.setAttribute("datas", datas);
		
		ActionForward forward=new ActionForward();
		forward.setPath("/mypage.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
