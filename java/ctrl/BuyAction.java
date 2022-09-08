package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adress.AddressDAO;
import adress.AddressVO;
import member.MemberDAO;
import member.MemberVO;

public class BuyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO mvo=new MemberVO();
		MemberDAO mdao=new MemberDAO();
		AddressVO avo=new AddressVO();
		AddressDAO adao=new AddressDAO();
		mvo.setMid((String)request.getSession().getAttribute("mid"));
		MemberVO member=mdao.selectOne(mvo);
		request.setAttribute("member", member);
		avo.setMid((String)request.getSession().getAttribute("mid"));
		System.out.println(adao.selectOne(avo));
		if(adao.selectOne(avo)!=null) {
			System.out.println(adao.selectOne(avo).getAddress());
			request.setAttribute("aname", adao.selectOne(avo).getAname());
			request.setAttribute("address", adao.selectOne(avo).getAddress());
			request.setAttribute("aphone", adao.selectOne(avo).getAphone());
		}
		
		ActionForward forward=new ActionForward();
		forward.setPath("buypage.jsp");
		forward.setRedirect(true);
		return forward;
	}

}
