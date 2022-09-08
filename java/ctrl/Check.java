package ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Check
 */
@WebServlet("/check.do")
public class Check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Check() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		System.out.println("로그1 ["+ request.getParameter("phoneNumber") +"]");
		// tip! getParameter안에 꺾세가로를 넣음 => 오류가 나지 않고 null값을 받아오기 때문에 꺾세가 []붙어나옴
		
		SendSMS sms = new SendSMS();
		String phoneNumber = request.getParameter("phoneNumber");
		String numStr=sms.sendSMS(phoneNumber);
//		System.out.println("로그2[" +numStr+"]");
		
		response.setContentType("application/x-json; charset=UTF-8");
		
		response.getWriter().write(numStr.toString()); 
	}

}
