package com.demoweb.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demoweb.dao.UploadDao;
import com.demoweb.dto.Member;
import com.demoweb.dto.Upload;

@WebServlet(value = "/upload/detail.action")
public class UploadDetailServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//1. 요청 데이터 읽기 (상세 정보를 표시할 사용자 아이디)
		//   아이디를 읽지 못하면 리스트로 이동
		String uploadno = req.getParameter("uploadno");
		if(uploadno == null || uploadno.length() == 0) {
			resp.sendRedirect("/demoweb/upload/list.action");
			return;
		}
		//로그인 안되어 있으면 보냄 
		HttpSession session = req.getSession();
		Member member2 = (Member)session.getAttribute("loginuser");
		if(session.getAttribute("loginuser") == null || !member2.getUserType().equals("admin")){
			resp.sendRedirect("/demoweb/account/loginform.action");
			return;
		}
		
		
		
		//2. 사용자 아이디로 사용자 정보 조회 (DAO)
		int iUploadNo =Integer.parseInt(uploadno);
		UploadDao dao = new UploadDao();
		Upload upload = dao.selectUploadByUploadNo(iUploadNo);
		dao.increaseUploadReadCount(iUploadNo); //다운로드 했을시 카운트 증가함수
	    upload.setReadCount(upload.getReadCount() + 1);
		
		req.setAttribute("upload", upload);
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/upload/uploadview.jsp");
				dispatcher.forward(req, resp);
				
				
				
		//3. 조회된 정보 표시
//		resp.setContentType("text/html;charset=utf-8");
//		PrintWriter writer = resp.getWriter();
		
		

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
