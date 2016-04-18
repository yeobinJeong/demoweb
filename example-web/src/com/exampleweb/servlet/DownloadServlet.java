package com.exampleweb.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadServlet
 */
@WebServlet("/jspdemo/download.action")
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// selected file download at list page 처리

		// String fileName = request.getParameter("file");
		// URLDecoder.decode(fileName, "utf-8");
		// response.setContentType("text/html;charset=utf-8");
		// //out.println과 같은 효과
		// response.getWriter().println(fileName);

		// 1. 요청 정보에서 다운로드할 파일 이름 읽기
		// (목록페이지에서 선택된 파일 이름)
		// 파일 이름을 읽지 못하면 -> 목록으로 이동
		String file = request.getParameter("file");
		if (file == null || file.length() == 0) {
			response.sendRedirect("07.filelist.jsp");
			return;
		}

		// 2. 다운로드 처리
		// req.getServletContext() : jsp에서 사용한 application 객체 반환
		ServletContext application = request.getServletContext();
		String path = application.getRealPath("/jspdemo/files");

		// 응답 컨텐츠의 종류를 지정
		// resp.setContentType("application/octet-stream");
		response.setContentType("application/unknown");

		// 다운로드되는 파일의 이름을 설정 파일의 이름을 설정 (다운로드 창에 표시될 이름)
		// utf-8 형식의 문자열을 iso-8859-1 형식의 문자열로 변경
		String f2 = new String(file.getBytes("utf-8"), "ISO-8859-1");
		f2 = f2.replace("+", "%20");// 위 처리는 공백을 +로 처리 -> +를 %20으로 변경

		response.addHeader("Content-Disposition",
				// "attachment;filename=" + URLEncoder.encode(file, "utf-8"));
				"attachment;filename=\"" + f2 + "\"");

		// 파일을 응답 컨텐츠로 기록
		File f = new File(path, file);// path와 file을 이어서 경로를 구성
		FileInputStream fis = new FileInputStream(f);
		OutputStream os = response.getOutputStream();
		while (true) {
			int data = fis.read(); // 파일에서 1byte 읽기
			if (data == -1)
				break; // 읽은 데이터가 없으면 중단
			os.write(data);// 응답에 1byte 쓰기
		}
		fis.close();
		os.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		doGet(request, response);
	}

}
