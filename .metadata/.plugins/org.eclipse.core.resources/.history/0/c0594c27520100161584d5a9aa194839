package com.demoweb.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demoweb.common.Util;
import com.demoweb.dao.MemberDao;
import com.demoweb.dto.Member;

@WebServlet(value = "/member/register.action")
public class MemberRegisterServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("loginuser");
		if(session.getAttribute("loginuser") == null || !member.getUserType().equals("admin")){
			resp.sendRedirect("/demoweb/account/loginform.action");
			return;
		}
		//데이터 읽기
		String memberId = req.getParameter("memberId"); 
		String passwd = req.getParameter("passwd");
		passwd = Util.getHashedString(passwd, "SHA-256");
		String email = req.getParameter("email");
		String userType = req.getParameter("userType");
		//체크박스 등 속성값을 선택 하지 않은 경우 null 값이 입력 됨
		String active = req.getParameter("active");
		
		System.out.printf("[%s][%s][%s][%s][%s]", memberId, passwd ,email, userType, active);
		//데이터 처리 (DB에 데이터 저장)
		Member m = new Member();
		m.setMemberId(memberId);
		m.setPasswd(passwd);
		m.setEmail(email);
		m.setUserType(userType);
		m.setActive(active == null ? false : true);
		MemberDao dao = new MemberDao();
		
		dao.insertMember(m);
		
		
		
		
		
		//결과에 따라 이동
		
		resp.sendRedirect("/demoweb/member/list.action");

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);// 처리 내용이 같으므로 doGet으로 전달
	}

}
