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

import java.util.*;

import com.demoweb.dao.MemberDao;
import com.demoweb.dto.Member;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

@WebServlet(value = "/member/list.action")
public class MemberListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//if not login  link to login form
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("loginuser");
		if(session.getAttribute("loginuser") == null || !member.getUserType().equals("admin")){
			resp.sendRedirect("/demoweb/account/loginform.action");
			return;
		}
		
		// 데이터 처리 만들기.
		// List<Member>형식 받기
		MemberDao dao = new MemberDao();
		List<Member> members = dao.selectMember();
		
		
		//JSP에서 사용할 수 있도록 데이터를 request 객체에 저장
		req.setAttribute("members", members);
		
		//
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/member/list2.jsp");
				dispatcher.forward(req, resp);
						
				

		System.out.println(members.get(1).getEmail() + " : email");

		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		
//		out.println("<!DOCTYPE html>                                                                   ");
//		out.println("                                                                                  ");
//		out.println("<html>                                                                            ");
//		out.println("<head>                                                                            ");
//		out.println("	<meta charset='utf-8' />                                                       ");
//		out.println("	<title>Home</title>                                                            ");
//		out.println("	<link rel='Stylesheet' href='/demoweb/styles/default.css' />                   ");
//		out.println("</head>                                                                           ");
//		out.println("<body>                                                                            ");
//		out.println("                                                                                  ");
//		out.println("	<div id='pageContainer'>                                                       ");
//		out.println("	                                                                               ");
//		out.println("		<div id='header'>                                                          ");
//		out.println("            <div class='title'>                                                   ");
//		out.println("                <a href='/demoweb/'>DEMO WEBSITE</a>                              ");
//		out.println("            </div>                                                                ");
//		out.println("            <div class='links'>                                                   ");
//		out.println("            	                                                                   ");
//		out.println("            	<a href='/demoweb/account/loginform.action'>로그인</a>              ");
//		out.println("                <a href='#'>등록</a>                                               ");
//		out.println("                                                                                  ");
//		out.println("            </div>                                                                ");
//		out.println("        </div>                                                                    ");
//
//		out.println("        <div id='menu'>                                                           ");
//		out.println("            <div>                                                                 ");
//		out.println("                <ul>                                                              ");
//		out.println("                    <li><a href='/demoweb/member/list.action'>사용자관리</a></li>   ");
//		out.println("					<li><a href='#'>메일보내기</a></li>                              ");
//		out.println("					<li><a href='#'>자료실</a></li>                                 ");
//		out.println("					<li><a href='#'>게시판</a></li>                                 ");
//		out.println("                </ul>                                                             ");
//		out.println("            </div>                                                                ");
//		out.println("		</div>                                                                     ");
//		out.println("		                                                                           ");
//		out.println("		<div id='content'>                                                         ");
//		out.println("			<br /><br />                                                           ");
//		out.println("			<div style='font-size: 15px; color: hotpink'>                                        ");
//		out.println("<table align='center' style='text-align:left; ' border='solid 3px'>");
//		
//		out.println("<tr><td colspan='3' > saved-data </td></tr>");
//		out.println("<br>");
//		for (Member member : members) {
//	         out.println("<tr style='height:30px;'>");
//	         out.println("<td>");
//	         out.println("<a href='detail.action?memberid=" + member.getMemberId() + "'>");
//	                  //<a href= '         ?   이름    =      "    값      '" 
//	         out.println(member.getMemberId());
//	         out.println("</a>");
//	         out.println("</td>");
//	         out.println("<td>" + member.getEmail() + "</td>");
//	         out.println("<td>" + member.getUserType() + "</td>");
//	         out.println("<td>" + member.isActive() + "</td>");
//	         out.println("<td>" + member.getRegDate() + "</td>");
//	         out.println("</tr>");
//	      }
//		out.println("<tr><td colspan='3'> ----------------------- </td></tr>");	
//		out.println("</table>");
//		out.println("			[ <a href='registerform.action'>사용자 등록</a> ]                          ");
//		out.println("			</div>                                                                 ");
//		out.println("		</div>                                                                     ");
//		out.println("	</div>                                                                         ");
//		out.println("                                                                                  ");
//		out.println("</body>                                                                           ");
//		out.println("</html>                                                                           ");

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);// 처리 내용이 같으므로 doGet으로 전달
	}

}
