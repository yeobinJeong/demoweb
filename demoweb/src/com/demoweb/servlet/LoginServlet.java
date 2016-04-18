package com.demoweb.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demoweb.common.Util;
import com.demoweb.dao.MemberDao;
import com.demoweb.dto.Member;

@WebServlet(value = "/account/login.action")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Data read
		String id = req.getParameter("memberId");
		String passwd = req.getParameter("passwd");
		passwd = Util.getHashedString(passwd, "SHA-256");
		
		//Data search
		MemberDao dao = new MemberDao();
		Member member = dao.selectMemberByIdAndPasswd(id, passwd);
		
		//if exist id = login
		//else if not exist id = login fail
		if (member != null){
			HttpSession session = req.getSession();
			session.setAttribute("loginuser", member);
			
			resp.sendRedirect("/demoweb/index.jsp");
		
		}else {
		     System.out.println("실패");
		     resp.sendRedirect("/demoweb/account/loginform.action");
		}
		
		
		
//		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/account/loginform.jsp");
//		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);// 처리 내용이 같으므로 doGet으로 전달
	}

}
