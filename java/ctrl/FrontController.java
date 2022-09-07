package ctrl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do") // *.do 요청을 수행하면 어노테이션에 의해 FC로 오게됨
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontController() {
		// ★FrontController fc=new FrontController(); xxx
		// 객체화를 하지않았는데, 메서드를 사용할수있었다.
		// 서블릿 컨테이너(==객체를 관리하는 것) == 웹 서버 == 톰캣이 객체화해주고있었음

		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String uri=request.getRequestURI();

		String cp=request.getContextPath();

		String command=uri.substring(cp.length());


		ActionForward forward=null;

		// 메인을 이동하는 로직 ================================
		if(command.equals("/findid.do")) {
			try {
				forward=new Findid().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/findPw.do")) {
			try {
				forward=new Findpw().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			// 로그 아웃하는 로직 =================================
			//		}else if(command.equals("/logout.do")) {
			//			 try {
			//				forward=new LogoutAction().execute(request, response);
			//			} catch (Exception e) {
			//				// TODO Auto-generated catch block
			//				e.printStackTrace();
			//			}
			//		
			//		// 글을 등록하는 로직 ================================
			//		}else if(command.equals("/insertB.do")) {
			//			try {
			//				forward=new InsertBAction().execute(request, response);
			//			} catch (Exception e) {
			//				// TODO Auto-generated catch block
			//				e.printStackTrace();
			//			}
			//		
			//		// 댓글을 등록하는 로직 ===============================
			//		}else if(command.equals("/insertR.do")) {
			//			try {
			//				forward=new InsertRAction().execute(request, response);
			//			} catch (Exception e) {
			//				// TODO Auto-generated catch block
			//				e.printStackTrace();
			//			}
			//		
			//		// 글을 삭제하는 로직 ================================
			//		}else if(command.equals("/deleteB.do")) {
			//			try {
			//				forward=new DeleteBAction().execute(request, response);
			//			} catch (Exception e) {
			//				// TODO Auto-generated catch block
			//				e.printStackTrace();
			//			}
			//			
			//		// 댓글을 삭제하는 로직 ==============================
			//		}else if(command.equals("/deleteR.do")) {
			//			try {
			//				forward=new DeleteRAction().execute(request, response);
			//			} catch (Exception e) {
			//				// TODO Auto-generated catch block
			//				e.printStackTrace();
			//			}
			//			
			//		// 좋아요 수를 늘리는 로직 =============================
			//		}else if(command.equals("/fav.do")) {
			//			try {
			//				forward=new FavAction().execute(request, response);
			//			} catch (Exception e) {
			//				// TODO Auto-generated catch block
			//				e.printStackTrace();
			//			}
			//			
			//		// 회원등록할 때 사용하는 로직 ============================
			//		}else if(command.equals("/insert.do")) {
			//			try {
			//				forward=new InserAction().execute(request, response);
			//			} catch (Exception e) {
			//				// TODO Auto-generated catch block
			//				e.printStackTrace();
			//			}
			//			
			//		// 로그인하는 로직 =====================================
			//		}else if(command.equals("/login.do")) {
			//			try {
			//				forward=new LoginAction().execute(request, response);
			//			} catch (Exception e) {
			//				// TODO Auto-generated catch block
			//				e.printStackTrace();
			//			}
			//			
			//		// 회원을 삭제하는 로직 =================================
			//		}else if(command.equals("/deleteM.do")) {
			//			try {
			//				forward=new DeleteMAction().execute(request, response);
			//			} catch (Exception e) {
			//				// TODO Auto-generated catch block
			//				e.printStackTrace();
			//			}
			//		}

			// 만약 forward에 값이 없다면 에러 창으로 이동 =============
			if(forward==null) { 
				forward=new ActionForward();
				forward.setPath("error/error.jsp"); 
				forward.setRedirect(false);
			}

			RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
			dispatcher.forward(request, response); 
			//타겟페이지(인자)로 request,response 객체를 전달하는 메서드 
			//제어권을 넘겨줌->클라이언트가 응답을 확인 할 수 있음 

		}

	
}
