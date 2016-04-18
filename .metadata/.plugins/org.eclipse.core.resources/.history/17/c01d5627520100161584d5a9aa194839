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

import com.demoweb.dao.MemberDao;
import com.demoweb.dto.Member;

@WebServlet(value = "/member/detail.action")
public class MemberDetailServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//1. 요청 데이터 읽기 (상세 정보를 표시할 사용자 아이디)
		//   아이디를 읽지 못하면 리스트로 이동
		String memberId = req.getParameter("memberid");
		if(memberId == null || memberId.length() == 0) {
			resp.sendRedirect("/demoweb/member/list.action");
			return;
		}
		HttpSession session = req.getSession();
		Member member2 = (Member)session.getAttribute("loginuser");
		if(session.getAttribute("loginuser") == null || !member2.getUserType().equals("admin")){
			resp.sendRedirect("/demoweb/account/loginform.action");
			return;
		}
		//2. 사용자 아이디로 사용자 정보 조회 (DAO)
		MemberDao dao = new MemberDao();
		Member member = dao.selectMemberById(memberId);
		req.setAttribute("member", member);
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/member/detail2.jsp");
				dispatcher.forward(req, resp);
		//3. 조회된 정보 표시
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter writer = resp.getWriter();
		
//		writer.println("<!DOCTYPE html>");
//		writer.println("<html>");
//		writer.println("<head>");
//		writer.println("<meta charset='utf-8' />");
//		writer.println("<title>사용자등록</title>");
//		writer.println("<link rel='Stylesheet' href='/demoweb/styles/default.css' />");
//		writer.println("<link rel='Stylesheet' href='/demoweb/styles/input.css' />");
//		writer.println("</head>");
//		writer.println("<body>");
//
//		writer.println("	<div id='pageContainer'>");
//		writer.println("		<div id='header'>");
//		writer.println("			<div class='title'>");
//		writer.println("				<a href='#'>CSS DEMO WEBSITE</a>");
//		writer.println("			</div>");
//		writer.println("			<div class='links'>");
//		writer.println("				<a href='#'>로그인</a>");
//		writer.println("				<a href='#'>등록</a>");
//		writer.println("			</div>");
//		writer.println("		</div>");
//		writer.println("		<div id='menu'>");
//		writer.println("			<ul>");		
//		writer.println("				<li><a href='/demoweb/member/list.action'>사용자관리</a></li>");
//		writer.println("				<li><a href='#'>메일보내기</a></li>");
//		writer.println("				<li><a href='#'>자료실</a></li>");
//		writer.println("				<li><a href='#'>게시판</a></li>");
//		writer.println("			</ul>");
//		writer.println("		</div>");
//		writer.println("		<div id='inputcontent'>");
//		writer.println("			<br /><br />");
//		writer.println("		    <div id='inputmain'>");
//		writer.println("		        <div class='inputsubtitle'>회원기본정보</div>");
//		
//		writer.println("		        <form action='register.action' method='post'><!-- 상대경로표시 -->");
//		writer.println("		        <table>");
//		writer.println("		            <tr>");
//		writer.println("		                <th>아이디(ID)</th>");
//		writer.println("		                <td>");
//		writer.println("		                    " + member.getMemberId());
//		writer.println("		                </td>");
//		writer.println("		            </tr>");
//		
//		writer.println("		            <tr>");
//		writer.println("		                <th>이메일</th>");
//		writer.println("		                <td>");
//		writer.println("		                	" + member.getEmail());
//		writer.println("		                </td>");
//		writer.println("		            </tr>");
//		writer.println("		            <tr>");
//		writer.println("		                <th>사용자구분</th>");
//		writer.println("		                <td>");
//		writer.println("		                	" + member.getUserType());
//		
//		writer.println("		                </td>");
//		writer.println("		            </tr>");
//		writer.println("		            <tr>");
//		writer.println("		                <th>활성화여부</th>");
//		writer.println("		                <td>");
//		writer.println("		                	" + member.isActive());
//		writer.println("		                </td>");
//		writer.println("		            </tr>");
//		writer.println("		            <tr>");
//		writer.println("		                <th>등록일자</th>");
//		writer.println("		                <td>");
//		writer.println("		                	" + member.getRegDate());
//		writer.println("		                </td>");
//		writer.println("		            </tr>");
//		writer.println("		        </table>");
//		writer.println("		        <div class='buttons'>");
//		writer.println("		        	<input type='button' value='변경' style='height:25px' />");
//		writer.println("		        	<input type='button' value='목록보기' style='height:25px'");
//		writer.println("		        		onclick=\"location.href='list.action';\" />");
//		writer.println("		        </div>");
//		writer.println("		        </form>");
//		writer.println("		    </div>");
//		writer.println("		</div>");
//		
//		writer.println("	</div>");
//
//		writer.println("</body>");
//		writer.println("</html>");
		

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
