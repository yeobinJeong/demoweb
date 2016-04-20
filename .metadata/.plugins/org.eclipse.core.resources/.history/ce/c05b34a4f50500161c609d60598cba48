package com.demoweb.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(value = "/mail/sendmailform.action")
public class SendMailFormServlet extends HttpServlet {
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
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
