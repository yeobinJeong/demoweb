package com.exampleweb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.D2F;

//@어노테이션이름 
//-> 대상 클래스, 메서드, 변수를 어떻게 처리할 지에 대한 설명

// /requestmethod.action 요청이 발생하면 사용될 클래스 지정
@WebServlet(value = "/requestmethod.action")
public class RequestMethodServlet extends HttpServlet {
	
	@Override //-> 이 메서드는 재정의 메서드임을 지정
	protected void doPost(
		HttpServletRequest req,		//요청 정보를 담은 객체 
		HttpServletResponse resp) 	//응답 처리를 수행하는 객체
		throws ServletException, IOException {
		
		System.out.println("******** post request");
		
		//데이터를 읽을 때 euc-kr 인코딩을 사용하세요
		req.setCharacterEncoding("utf-8");
		
		//HttpServletRequest.getParameter("이름")
		//->요청 정보로부터 브라우저에서 전송된 데이터 읽는 명령		
		String data = req.getParameter("mydata");
		System.out.println("post : " + data);
		
		//응답컨텐츠를 기록할 때 euc-kr 인코딩을 사용하세요
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("post data : " + data);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("******** get request");
		
		String data = req.getParameter("mydata");
		System.out.println("get : " + data);
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("get data : " + data);
	
	}
	
}
