package com.demoweb.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demoweb.dao.BoardDao;
import com.demoweb.dto.Board;


@WebServlet("/board/replyform.action")
public class BoardReplyFormServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		
		String boardNo = req.getParameter("borardno");
		int iBoardNo = Integer.parseInt(boardNo);
		BoardDao dao = new BoardDao();
		Board board = dao.selectBoardByBoardNo(iBoardNo);
		req.setAttribute("board", board);
		
		RequestDispatcher dispatcher = 
			req.getRequestDispatcher("/WEB-INF/views/board/replyform.jsp");
		dispatcher.forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		
		doGet(req, resp);
	}
	
}






