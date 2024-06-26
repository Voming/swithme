package swithme.model.member.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.Authenticator;
import javax.mail.Session;
import javax.mail.Address;
import javax.mail.internet.InternetAddress;


/**
 * Servlet implementation class MailSendController
 */
@WebServlet("/mailsend")
public class MailSendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Properties prop = new Properties();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailSendController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 랜덤 문자열
				int leftLimit = 97; // 'a' 난수 생성
				int rightLimit = 122; // 'z' 난수 생성
				int codeLength = 8;
				
				
				Random random = new Random();
				StringBuilder sb = new StringBuilder(codeLength);
				
				for(int i = 0; i < codeLength; i++) {
					int randLimitInt = leftLimit + (int)(random.nextFloat() * (rightLimit - leftLimit + 1));
					sb.append((char)randLimitInt);
					}
				String code = sb.toString();
				InputStream input = getClass().getClassLoader().getResourceAsStream("mail.properties"); 
				try {
					prop.load(input);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				//회원 인증 이메일 발송 내용
				//발송인
				String from = prop.getProperty("google.mail");
				System.out.println("from:"+from);
				//수신인
				String to = request.getParameter("mailto");
				System.out.println("to:"+to);
				//메일 제목
				String subject = "인증코드메일";
				//메일 내용
				String content = "인증 코드를 작성해주세요 " + code;
				System.out.println("code"+code);
				
				
				//고정 부분, 수정X
				Properties prop = new Properties();
				prop.put("mail.smtp.user", from);
				prop.put("mail.smtp.host", "smtp.googlemail.com"); // google SMTP 주소
				prop.put("mail.smtp.port", "465");
				prop.put("mail.smtp.starttls.enable", "true");
				prop.put("mail.smtp.auth", "true");
				prop.put("mail.smtp.debug", "true");
				prop.put("mail.smtp.socketFactory.port", "465");
				prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				prop.put("mail.smtp.socketFactory.fallback", "false");
				prop.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 추가된 코드
				prop.put("mail.smtp.ssl.enable", "true");  // 추가된 코드
				
				try{
					Authenticator auth = new Gmail();
				    Session session = Session.getInstance(prop, auth);
				    session.setDebug(true);
				    MimeMessage msg = new MimeMessage(session); 
				    msg.setSubject(subject);		// 메일 제목 등록
				    Address fromAddr = new InternetAddress(from); 	// 보내는 사람 정보 등록
				    msg.setFrom(fromAddr);
				    Address toAddr = new InternetAddress(to);		// 받는 사람 정보 등록
				    msg.addRecipient(Message.RecipientType.TO, toAddr);
				    msg.setContent(content, "text/html;charset=UTF-8");
				    Transport.send(msg); // 메세지 전송
				    response.getWriter().append(code);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
	
	
	
}


