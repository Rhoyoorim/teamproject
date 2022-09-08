package ctrl;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

public class GmailSend{
	public void GmailSet(String user, String title, String content){
		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true"); // 로그인 시 TLS를 사용할 것인지 설정
		p.put("mail.smtp.host", "smtp.gmail.com"); // 이메일 발송을 처리해줄 SMTP 서버
		p.put("mail.smtp.auth","true"); // SMTP 서버의 인증을 사용한다는 의미
		p.put("mail.smtp.port", "587"); // TLS의 포트번호는 587 SSL의 포트번호는 465이다.
		p.put("mail.smtp.ssl.protocols", "TLSv1.2"); // TLS 버전 맞추기
		Authenticator auth = new MyAuthentication();
		Session session = Session.getDefaultInstance(p, auth);
		MimeMessage msg = new MimeMessage(session);
		String fromName = "admin"; // 송신자 닉네임
		String charSet = "UTF-8"; // 인코딩
		try{
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress() ; 
			from = new InternetAddress(new String(fromName.getBytes(charSet), "8859_1") + "<admin@gmail.com>");
			msg.setFrom(from);
			// Message 클래스의 setFrom() 메소드를 사용하여 발송자를 지정한다. 
			// 발송자의 메일, 발송자명InternetAddress 클래스는 이메일 주소를 나타날 때 사용하는 클래스이다.
			InternetAddress to = new InternetAddress(user); // 수신자의 메일 생성
			msg.setRecipient(Message.RecipientType.TO, to); // 수신자
			// Message 클래스의 setRecipient() 메소드를 사용하여 수신자를 설정한다. 
			// setRecipient() 메소드로 수신자, 참조, 숨은 참조 설정이 가능하다.
			msg.setSubject(title, "UTF-8"); // 이메일 제목
			msg.setContent(content,"text/html; charset=UTF-8"); // 이메일 내용
			Transport.send(msg);
			System.out.println("메일 발송을 완료하였습니다.");
		}catch (AddressException addr_e) {
			JOptionPane.showMessageDialog(null, "메일을 입력해주세요", "메일주소입력", JOptionPane.ERROR_MESSAGE);
			addr_e.printStackTrace();
		}catch (MessagingException msg_e) {
			JOptionPane.showMessageDialog(null, "메일을 제대로 입력해주세요.", "오류발생", JOptionPane.ERROR_MESSAGE);
			msg_e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
}

