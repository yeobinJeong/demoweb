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

import com.demoweb.dto.Member;

//Annotation(전달인자 목록 : 대상을 다룰때 필요한 데이터)
//여기서 value는 web.xml의 <url-pattern>을 대신하는 전달인자)
@WebServlet(value = "/member/registerform.action")
public class MemberRegisterFormServlet extends HttpServlet {

	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. 요청 처리		
		//2. 응답 컨텐츠 생성
		resp.setContentType("text/html;charset=utf-8");		
		PrintWriter writer = resp.getWriter();
		
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("loginuser");
		if(session.getAttribute("loginuser") == null || !member.getUserType().equals("admin")){
			resp.sendRedirect("/demoweb/account/loginform.action");
			return;
		}
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/member/registerform2.jsp");
				dispatcher.forward(req, resp);
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
//		writer.println("		                    <input type='text' name='memberId' style='width:280px' />");
//		writer.println("		                </td>");
//		writer.println("		            </tr>");
//		writer.println("		            <tr>");
//		writer.println("		                <th>비밀번호</th>");
//		writer.println("		                <td>");
//		writer.println("		                	<input type='password' name='passwd' style='width:280px' />");
//		writer.println("		                </td>");
//		writer.println("		            </tr>");
//		writer.println("		            <tr>");
//		writer.println("		                <th>비밀번호 확인</th>");
//		writer.println("		                <td>");
//		writer.println("		                    <input type='password' name='confirm' style='width:280px' />");
//		writer.println("		                </td>");
//		writer.println("		            </tr>");
//		writer.println("		            <tr>");
//		writer.println("		                <th>이메일</th>");
//		writer.println("		                <td>");
//		writer.println("		                	<input type='text' name='email' style='width:280px' />");
//		writer.println("		                </td>");
//		writer.println("		            </tr>");
//		writer.println("		            <tr>");
//		writer.println("		                <th>사용자구분</th>");
//		writer.println("		                <td>");
//		writer.println("		                	<input type='radio' name='userType' value='user' checked='checked'>사용자</input>");
//		writer.println("		                	<input type='radio' name='userType' value='admin'>관리자</input>");
//		writer.println("		                </td>");
//		writer.println("		            </tr>");
//		writer.println("		            <tr>");
//		writer.println("		                <th>활성화여부</th>");
//		writer.println("		                <td>");
//		writer.println("		                	<input type='checkbox' name='active' value='y'>활성사용자</input>");
//		writer.println("		                </td>");
//		writer.println("		            </tr>");
//		writer.println("		        </table>");
//		writer.println("		        <div class='buttons'>");
//		writer.println("		        	<input type='submit' value='등록' style='height:25px' />");
//		writer.println("		        	<input type='button' value='취소' style='height:25px'");
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
		doGet(req, resp);// 처리 내용이 같으므로 doGet으로 전달
	}

}
