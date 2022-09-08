package ctrl;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator {
	PasswordAuthentication pa;
	public MyAuthentication(){
		String id="구글계정"; // 구글계정
		String pw="구글 앱번호"; // 구글 앱번호
		
		pa = new PasswordAuthentication(id, pw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}



