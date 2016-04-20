package com.demoweb.servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.demoweb.common.Util;
import com.demoweb.dao.BoardDao;
import com.demoweb.dao.UploadDao;
import com.demoweb.dto.Board;
import com.demoweb.dto.BoardComment;
import com.demoweb.dto.Member;
import com.demoweb.dto.Upload;
import com.demoweb.dto.UploadFile;


@WebServlet("/board/reply.action")
public class BoardReplyServlet extends HttpServlet {

	@Override
	protected void doGet(
		HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

		String boardNo = request.getParameter("boardno");
		String title =  request.getParameter("title");
		String content = request.getParameter("content"); 
		int iBoardNo = Integer.parseInt(boardNo);
		BoardDao dao = new BoardDao();
		Board board = dao.selectBoardByBoardNo(iBoardNo);
		//1. 데이터 읽기
		String reply = request.getParameter("reply");
		
		BoardComment comment = new BoardComment();
		Member member = 
			(Member)request.getSession().getAttribute("loginuser");
		board.setWriter(member.getMemberId());
		board.setContent(content);
		board.setTitle(title);
		
		int replyNo = dao.insertReply(board);
		
		
		
		
		
		
		
			
		
		//3. 목록으로 이동
		response.sendRedirect("detail.action?boardno="+ replyNo +"&pageno=" + request.getAttribute("pageno"));
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		doGet(req, resp);
	}
	
}






