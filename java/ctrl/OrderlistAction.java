package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buylist.BuyListDAO;
import buylist.BuyListVO;
import item.ItemVO;

public class OrderlistAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BuyListVO vo=new BuyListVO();
		BuyListDAO dao=new BuyListDAO();
		int pageSize=5; // 한번에 보여질 페이지 갯수
		int pageNum;  // 현재 페이지 번호
		int startNum;  // 페이지 블록 시작 번호(ex.1 , 6 , 10 , ...)
		int endNum;  // 페이지 블록 끝 번호(ex.5 , 9 , 14, ...)
		int pageCount; // 전체 페이지 갯수
		int totalcnt; // 데이터 총 갯수
		
		vo.setMid((String)request.getSession().getAttribute("mid"));
		if(request.getParameter("pageNum")!=null){ // View에서 pageNum 전달
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}else{ // View에서 pageNum 전달 X -> 페이지 첫 진입
			pageNum=1;	// 현재 페이지 번호를 1로 설정
		}
		startNum=((pageNum-1)/pageSize)*pageSize+1; // 페이지블록 시작 번호
		endNum=(((pageNum-1)/pageSize)+1)*pageSize; // 페이지블록 끝 번호
		totalcnt=dao.count(vo); // 데이터 총 갯수
		pageCount=totalcnt/pageSize+(totalcnt%pageSize==0?0:1); // 페이지 갯수
		// 전체 데이터 갯수가 pageSize로 나누어 떨어지지 않으면 페이지 갯수 +1
		if(pageCount<endNum){ // 페이지 블록 끝 번호가 전체 페이지 갯수보다 크다면 
			endNum=pageCount; // 페이지 블록 끝 번호를 페이지 갯수로 설정
		}
		request.setAttribute("startNum", startNum);
		request.setAttribute("endNum", endNum);
		request.setAttribute("pcnt", pageCount);
		vo.setStartnum((pageNum-1)*pageSize); // 페이지마다 불러올 데이터 시작 번호
		ArrayList<ItemVO> datas=dao.selectAll(vo);
		if(datas.size()!=0){
			request.setAttribute("datas", datas);
		}

		ActionForward forward=new ActionForward();
		forward.setPath("orderlist.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
