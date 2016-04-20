package com.demoweb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demoweb.dao.BoardDao;
import com.demoweb.dto.Board;
import com.demoweb.dto.BoardComment;
import com.demoweb.dto.Member;


@WebServlet("/board/updatecomment.action")
public class BoardUpdateCommentServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		
		String boardNo = req.getParameter("boardno");
		String content = req.getParameter("content");
		String commentNo = req.getParameter("commentno");
		int iBoardNo = Integer.parseInt(boardNo);
		int pageNo = (int)req.getAttribute("pageno");
		int iCommentNo = Integer.parseInt(commentNo);
		
		Member member = 
			(Member)req.getSession().getAttribute("loginuser");
		String memberId = member.getMemberId();
		//2. 데이터 저장
		
		BoardComment comment = new BoardComment();
		comment.setBoardNo(iBoardNo);
		comment.setCommentNo(iCommentNo);
		comment.setContent(content);
		comment.setWriter(member.getMemberId());
		
		BoardDao dao = new BoardDao();
		dao.updateComment(comment);			
		
		//3. 목록으로 이동
		resp.sendRedirect("detail.action?boardno="+ iBoardNo +"&pageno=" + pageNo);
		/*RequestDispatcher dispatcher = 
			req.getRequestDispatcher("/WEB-INF/views/board/list.jsp");
		dispatcher.forward(req, resp);*/
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		
		doGet(req, resp);
	}
	
}






