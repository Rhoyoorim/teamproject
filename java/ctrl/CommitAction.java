package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import adress.AddressDAO;
import adress.AddressVO;
import buylist.BuyListDAO;
import buylist.BuyListVO;
import item.ItemVO;
import member.MemberDAO;
import member.MemberVO;

public class CommitAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		AddressVO vo=new AddressVO();
		AddressDAO dao=new AddressDAO();
		BuyListVO bvo=new BuyListVO();
		BuyListDAO bdao=new BuyListDAO();
		MemberVO mvo=new MemberVO();
		MemberDAO mdao=new MemberDAO();
		mvo.setMid((String)request.getSession().getAttribute("mid"));
		vo.setMid((String)request.getSession().getAttribute("mid"));
		if(request.getParameter("address_sel").equals("false")) {
			if(dao.selectOne(vo)==null) {
				String address=request.getParameter("address1")+" "+request.getParameter("address2");
				vo.setAddress(address);
				vo.setAname(request.getParameter("aname"));
				vo.setAphone(request.getParameter("phone"));
				vo.setAflag("0");
				if(dao.insert(vo)) {
					System.out.println("로그: insertA 성공!");
				}else {
					System.out.println("로그: insertA 실패..");
				}
			}else {
				String address=request.getParameter("address1")+" "+request.getParameter("address2");
				vo.setAddress(address);
				vo.setAname(request.getParameter("aname"));
				vo.setAphone(request.getParameter("phone"));
				if(dao.update(vo)) {
					System.out.println("로그: updateA 성공!");
				}else {
					System.out.println("로그: updateA 실패..");
				}
			}
		}
		ArrayList<ItemVO> data=(ArrayList<ItemVO>)request.getSession().getAttribute("data");
		ArrayList<BuyListVO> datas=new ArrayList<BuyListVO>();
		for(ItemVO v:data) {
			bvo.setMid((String)request.getSession().getAttribute("mid"));
			bvo.setIid(v.getIid());
			bdao.insert(bvo);
			System.out.println("로그: insertB 성공!");
		}

		GmailSend gs=new GmailSend();
		System.out.println(mdao.selectOne(mvo).getMemail());
		gs.GmailSet(mdao.selectOne(mvo).getMemail(), "펫키지 구매내역", "<!doctype html>\r\n"
				+ "<html lang=\"en\">\r\n"
				+ "<head>\r\n"
				+ "<meta charset=\"utf-8\">\r\n"
				+ "<meta name=\"viewport\"\r\n"
				+ "	content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n"
				+ "<meta name=\"author\" content=\"Untree.co\">\r\n"
				+ "<link rel=\"shortcut icon\" href=\"favicon.png\">\r\n"
				+ "\r\n"
				+ "<meta name=\"description\" content=\"\" />\r\n"
				+ "<meta name=\"keywords\" content=\"free template, bootstrap, bootstrap4\" />\r\n"
				+ "<link\r\n"
				+ "	href=\"https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Single+Day&display=swap\"\r\n"
				+ "	rel=\"stylesheet\">\r\n"
				+ "<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\">\r\n"
				+ "<link\r\n"
				+ "	href=\"https://fonts.googleapis.com/css2?family=Crimson+Text:ital@0;1&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap\"\r\n"
				+ "	rel=\"stylesheet\">\r\n"
				+ "\r\n"
				+ "<link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\r\n"
				+ "<link rel=\"stylesheet\" href=\"css/animate.min.css\">\r\n"
				+ "<link rel=\"stylesheet\" href=\"css/owl.carousel.min.css\">\r\n"
				+ "<link rel=\"stylesheet\" href=\"css/owl.theme.default.min.css\">\r\n"
				+ "<link rel=\"stylesheet\" href=\"fonts/icomoon/style.css\">\r\n"
				+ "<link rel=\"stylesheet\" href=\"fonts/feather/style.css\">\r\n"
				+ "<link rel=\"stylesheet\" href=\"fonts/flaticon/font/flaticon.css\">\r\n"
				+ "<link rel=\"stylesheet\" href=\"css/jquery.fancybox.min.css\">\r\n"
				+ "<link rel=\"stylesheet\" href=\"css/aos.css\">\r\n"
				+ "<link rel=\"stylesheet\" href=\"css/style.css\">\r\n"
				+ "\r\n"
				+ "<title>펫키지</title>\r\n"
				+ "<script src=\"https://code.jquery.com/jquery-3.6.0.js\"\r\n"
				+ "	integrity=\"sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=\"\r\n"
				+ "	crossorigin=\"anonymous\"></script>\r\n"
				+ "<!-- memberchange만의 특수 style설정 -->\r\n"
				+ "<style type=\"text/css\">\r\n"
				+ ".modal {\r\n"
				+ "	position: fixed;\r\n"
				+ "	top: 50%;\r\n"
				+ "	left: 50%;\r\n"
				+ "	width: 100%;\r\n"
				+ "	height: 100%;\r\n"
				+ "	display: none;\r\n"
				+ "	background-color: rgba(0, 0, 0, 0.4);\r\n"
				+ "	transform: translate(-50%, -50%);\r\n"
				+ "}\r\n"
				+ "\r\n"
				+ ".modal.show {\r\n"
				+ "	display: block;\r\n"
				+ "}\r\n"
				+ "\r\n"
				+ ".modal_body {\r\n"
				+ "	position: absolute;\r\n"
				+ "	top: 50%;\r\n"
				+ "	left: 50%;\r\n"
				+ "	width: 100%;\r\n"
				+ "	height: 100vh;\r\n"
				+ "	padding: 40px;\r\n"
				+ "	text-align: center;\r\n"
				+ "	background-color: rgb(255, 255, 255);\r\n"
				+ "	border-radius: 10px;\r\n"
				+ "	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);\r\n"
				+ "	transform: translateX(-50%) translateY(-50%);\r\n"
				+ "}\r\n"
				+ "</style>\r\n"
				+ "</head>\r\n"
				+ "<body>\r\n"
				+ "	<ryo:header />\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "	<ryo:menu type=\"receipt\" />\r\n"
				+ "\r\n"
				+ "	<div class=\"container pt-3 pb-3 mb-3 border-bottom\">\r\n"
				+ "		<div class=\"row justify-content-center\">\r\n"
				+ "			<form>\r\n"
				+ "				<table border=\"2\"\r\n"
				+ "					style=\"width: 450px; height: 500px; border-color: black;\">\r\n"
				+ "					<tr style=\"background-color: white;\">\r\n"
				+ "						<td colspan=\"2\" align=\"center\"><h5 style=\"padding-left: 10px;\">영수증</h5></td>\r\n"
				+ "					</tr>\r\n"
				+ "					<tr>\r\n"
				+ "						<td align=\"center\" >\r\n"
				+ "							<h5 style=\"text-align: center\">제품 이름</h5>\r\n"
				+ "						</td>\r\n"
				+ "						<td>\r\n"
				+ "							<h5 style=\"text-align: center;\">제품 가격</h5>\r\n"
				+ "						</td>\r\n"
				+ "					</tr>\r\n"
				+ "					<!-- 여백 -->\r\n"
				+ "					<tr>\r\n"
				+ "						<td colspan=\"2\"></td>\r\n"
				+ "					</tr>\r\n"
				+ "					\r\n"
				+ "					<tr>\r\n"
				+ "						<td align=\"center\">\r\n"
				+ "							<h5 style=\"text-align: center\">"+data.get(0).getIname()+" 외 "+(data.size()-1)+"</h5>\r\n"
				+ "						</td>\r\n"
				+ "						<td style=\"text-align:right;\">\r\n"
				+ "							<h5 style=\"text-align: right; padding-right: 10px;\">\r\n"
				+ "								"+data.get(0).getIprice()+"</h5>\r\n"
				+ "						</td>\r\n"
				+ "					</tr>\r\n"
				+ "			\r\n"
				+ "					<!-- 여백 -->\r\n"
				+ "					<tr>\r\n"
				+ "						<td colspan=\"2\"></td>\r\n"
				+ "					</tr>\r\n"
				+ "					<!-- 여백 -->\r\n"
				+ "					<!-- 펫 리스트 반복 -->\r\n"
				+ "					<tr>\r\n"
				+ "						<td>\r\n"
				+ "							<h5 style=\"text-align: center; padding-left: 10px;\">총 합계</h5>\r\n"
				+ "						</td>\r\n"
				+ "						<td>\r\n"
				+ "							<h5 style=\"text-align: right; padding-right: 10px;\">"+request.getParameter("total_price")+"원"+"</h5>\r\n"
				+ "						</td>\r\n"
				+ "					</tr>\r\n"
				+ "				</table>\r\n"
				+ "			</form>\r\n"
				+ "			<!-- <div>\r\n"
				+ "			<a><input type=\"button\" class=\"btn btn-outline-black btn-block\" value=\"메인으로 가기\"></a>\r\n"
				+ "			</div> -->\r\n"
				+ "\r\n"
				+ "		</div>\r\n"
				+ "	</div>\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "	<ryo:footer />\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "</body>\r\n"
				+ "</html>");
		System.out.println("로그:mailsend 성공!");
		ArrayList<ItemVO> data2=new ArrayList<ItemVO>();
		request.getSession().setAttribute("data", data2);
		ActionForward forward=new ActionForward();
		forward.setPath("ordersuccess.jsp");
		forward.setRedirect(true);
		return forward;

	}

}
