package com.ajaxdemoweb.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajaxdemoweb.model.dao.MemberDao;
import com.ajaxdemoweb.model.dto.Member;

@WebServlet("/searchmember.action")
public class SearchMember extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/plain;charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		//요청 데이터 읽어서 변수에 저장 (없으면 오류 반환)
		String id = request.getParameter("id");
		if (id == null || id.length() == 0) {
			writer.print("error");
			return;
		}
		//요청된 데이터로 검색 (검색 실패하면 오류 반환)
		MemberDao dao = new MemberDao();
		Member member = dao.getMemberById(id);
		if (member == null) {
			writer.print("error");
			return;
		}
		//검색 결과를 문자열 형태로 반환
		writer.print(String.format("%s$%s$%s$%s$%s", 
			member.getMemberId(), 
			member.getEmail(), 
			member.getUserType(), 
			member.isActive() ? "활성사용자" : "비활성사용자", 
			member.getRegDate().toString()));
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}









