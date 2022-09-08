package ctrl;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import review.ReviewDAO;
import review.ReviewVO;

public class InsertRAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path="C:\\0607SON\\workspace\\jspProject\\src\\main\\webapp\\images";
		int maxSize=200000; //바이트 단위
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		ReviewVO vo=new ReviewVO();
		ReviewDAO dao=new ReviewDAO();
//		String mid=request.getParameter("mid");
//		String fileName=request.getParameter("fileName");
//		System.out.println("로그1 ["+fileName+"]");
		Enumeration<?> file=mr.getFileNames();
		if(file.hasMoreElements()) { // 파일 업로드를 했는지 확인
			String paramName=(String)file.nextElement();
			System.out.println("파라미터명 ["+paramName+"]");
			
			String serverFilename=mr.getFilesystemName(paramName);
			System.out.println("서버에 업로드된 파일명 ["+serverFilename+"]");
			
			String clientFilename=mr.getOriginalFileName(paramName);
			System.out.println("사용자가 업로드한 파일명 ["+clientFilename+"]");
			
			String fileType=mr.getContentType(paramName);
			System.out.println("파일의 타입 ["+fileType+"]");
			
			long length=mr.getFile(paramName).length();
			System.out.println("파일의 크기 ["+length+"]" ); // 바이트 단위	
			
			String iid=mr.getParameter("iid");
			System.out.println("iid:"+iid);
			vo.setRimg("images/"+serverFilename);
			vo.setIid(iid);
			System.out.println("별점: "+mr.getParameter("star"));
			Integer star=Integer.parseInt(mr.getParameter("star"));
			float starf=star.floatValue();
			vo.setStar(starf);
			vo.setContent(mr.getParameter("content"));
		}	
		 vo.setMid((String)(request.getSession().getAttribute("mid")));
		 vo.setWriter("");
		 
		 dao.insert(vo);
		 
		ActionForward forward=new ActionForward();
		forward.setPath("/detail.do?iid="+vo.getIid());
		forward.setRedirect(false);
		return forward;
	}

}
