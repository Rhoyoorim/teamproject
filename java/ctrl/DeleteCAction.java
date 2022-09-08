package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.ItemVO;

public class DeleteCAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String index=request.getParameter("index");
		String arr[]=index.split("/");
		System.out.println("로그 배열길이:"+arr.length);
		ArrayList<ItemVO> data=(ArrayList<ItemVO>)request.getSession().getAttribute("data");
		System.out.println("로그 리스트길이:"+data.size());
		for(int i=arr.length-1;i>=0;i--) {
				int num=Integer.parseInt(arr[i]);
				System.out.println(num);
				data.remove(num);
		}
		request.getSession().setAttribute("data", data);
		ActionForward forward=new ActionForward();
		forward.setPath("cart.jsp");
		forward.setRedirect(true);
		return forward;
	}

}
