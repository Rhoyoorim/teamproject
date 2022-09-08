package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.net.ApplicationBufferHandler;

import item.ItemDAO;
import item.ItemVO;

public class MainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ItemVO ivo=new ItemVO();
		ItemDAO idao=new ItemDAO(); 
		ivo.setIdate("");
		String weather="";
		if(request.getParameter("text")!=null) {
			String text=request.getParameter("text");
			request.getSession().setAttribute("text", text);
			int idx=text.indexOf(" ");;
			weather=text.substring(idx+1);
			while(true) {
				idx=weather.indexOf(" ");
				weather=weather.substring(idx+1);
				if(weather.contains(" ")==false) {
					System.out.println("풀네임:"+text);
					System.out.println("날씨:"+weather);
					break;
				}
			}
		}else {
			String text=(String)request.getSession().getAttribute("text");
			int idx=text.indexOf(" ");;
			weather=text.substring(idx+1);
			while(true) {
				idx=weather.indexOf(" ");
				weather=weather.substring(idx+1);
				if(weather.contains(" ")==false) {
					System.out.println("풀네임:"+text);
					System.out.println("날씨:"+weather);
					break;
				}
			}
		}
		if(weather.equals("rain")){
			ItemVO vo=new ItemVO();
			vo.setIname("053011");
			ArrayList<ItemVO> recommend=idao.selectAll(vo);
			request.setAttribute("ITEMB", recommend);
		}else if(weather.equals("snow")) {
			ItemVO vo=new ItemVO();
			vo.setIname("053009");
			ArrayList<ItemVO> recommend=idao.selectAll(vo);
			request.setAttribute("ITEMB", recommend);
		}else {
			ItemVO vo=new ItemVO();
			vo.setIname("053010");
			ArrayList<ItemVO> recommend=idao.selectAll(vo);
			request.setAttribute("ITEMB", recommend);
		}
		ArrayList<ItemVO> datas=idao.selectAll(ivo);
		request.setAttribute("ITEMN", datas);

		ActionForward forward=new ActionForward();
		forward.setPath("/main.jsp");
		forward.setRedirect(false);
		return forward;

	}

}
