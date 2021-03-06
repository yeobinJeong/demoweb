package com.demoweb.servlet;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demoweb.dto.Member;

@WebServlet("/mail/sendmail.action")
public class SendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//아래 인증 코드는 필터로 이동
//		HttpSession session = req.getSession();
//		if (session.getAttribute("loginuser") == null) {
//			resp.sendRedirect(
//				"/demoweb/account/loginform.action?returnurl=" + 
//				req.getRequestURI());
//			return;
//		}
		
		RequestDispatcher d = 
			req.getRequestDispatcher("/WEB-INF/views/mail/sendmailform.jsp");
		d.forward(req, resp);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//1. 요청 데이터 읽기
		String to = request.getParameter("to");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String from = 
			((Member)(request.getSession().getAttribute("loginuser"))).getEmail();
		String cc = "jmam0513@naver.com";
		String bcc = "jmam0513@gmail.com";
		
		//2. 메일 서버 연결 계정 설정 및 연결
		Properties props = new Properties();
		props.put("mail.smtp.host", "localhost");
		Session session = Session.getDefaultInstance(props);
		
		//3. 메일 전송
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(MimeMessage.RecipientType.TO, to);
			message.setRecipients(MimeMessage.RecipientType.CC, cc);
			message.setRecipients(MimeMessage.RecipientType.BCC, bcc);
			message.setSubject(subject, "utf-8");//제목
			message.setText(content, "utf-8");//내용
			
			Transport.send(message);//전송
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		//4. 메일보내기 페이지로 이동
		/*response.sendRedirect("/WEB-INF/views/mail/sendmailform.jsp");*/
	}


}
