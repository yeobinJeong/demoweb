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
import com.demoweb.dto.Member;


@WebServlet("/board/update.action")
public class BoardUpdateServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		
		String boardNo = req.getParameter("boardno");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		int iBoardNo = Integer.parseInt(boardNo);
		
		
		Member member = 
			(Member)req.getSession().getAttribute("loginuser");
		String memberId = member.getMemberId();
		//2. 데이터 저장
		
		Board board = new Board();
		board.setBoardNo(iBoardNo);
		board.setTitle(title);
		board.setWriter(memberId);
		board.setContent(content);
		BoardDao dao = new BoardDao();
		dao.updateBoard(board);			
		
		//3. 목록으로 이동
		resp.sendRedirect("detail.action?boardno="+ board.getBoardNo() +"&pageno=" + req.getAttribute("pageno"));
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






