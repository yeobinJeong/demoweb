package com.demoweb.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demoweb.dao.BoardDao;
import com.demoweb.dto.Board;
import com.demoweb.dto.Member;

@WebServlet("/board/edit.action")
public class BoardEditFormServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 요청 데이터 읽기 (상세 정보를 표시할 글 번호)
		// 읽지 못하면 리스트로 이동
		// 1. 요청 데이터 읽기 (상세 정보를 표시할 자료 번호)
		// 아이디를 읽지 못하면 리스트로 이동
		String boardno = req.getParameter("boardno");
		if (boardno == null || boardno.length() == 0) {
			resp.sendRedirect("/demoweb/board/list.action");
			return;
		}

		HttpSession session = req.getSession();
//		Member member2 = (Member) session.getAttribute("loginuser");
//		if (session.getAttribute("loginuser") == null || !member2.getUserType().equals("admin")) {
//			resp.sendRedirect("/demoweb/account/loginform.action");
//			return;
//		}

		// 문자열을 숫자로 변경
		int iBoardNo = Integer.parseInt(boardno);

		// 2. 자료 번호로 자료 정보 조회 (DAO)
		// 없으면 목록으로
		BoardDao dao = new BoardDao();
		Board board = dao.selectBoardByBoardNo(iBoardNo);

		if (board == null) {
			resp.sendRedirect("list.action");
			return;
		}

		// jsp에서 읽을 수 있뜨로고 request에 저장
		req.setAttribute("board", board);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/editform.jsp");
		dispatcher.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);
	}

}
