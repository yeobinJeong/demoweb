package com.demoweb.servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.print.attribute.ResolutionSyntax;
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


@WebServlet("/board/writecomment.action")
public class BoardWriteCommentServlet extends HttpServlet {

	@Override
	protected void doGet(
		HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

		String boardNo = request.getParameter("boardno");
		
		
		if( boardNo == null || boardNo.length() == 0){
			response.sendRedirect("list.action");
			return ;
		}
		
		int iBoardNo = Integer.parseInt(boardNo);
		BoardDao dao = new BoardDao();
		int pageNo = (int)request.getAttribute("pageno");
		Member member = (Member)request.getSession().getAttribute("loginuser");
		String content = request.getParameter("content");
		BoardComment comment = new BoardComment();
		
		
		comment.setBoardNo(iBoardNo);
		comment.setWriter(member.getMemberId());
		comment.setContent(content);
		
		
		
		dao.insertComment(comment);
		
		
		
		
		
		
		
		response.sendRedirect("detail.action?boardno=" + iBoardNo +"&pageno="+pageNo );
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		doGet(req, resp);
	}
	
}






