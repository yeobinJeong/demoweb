package com.demoweb.servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.demoweb.common.Util;
import com.demoweb.dao.ScheduleDao;
import com.demoweb.dao.UploadDao;
import com.demoweb.dto.Schedule;
import com.demoweb.dto.Upload;
import com.demoweb.dto.UploadFile;

@WebServlet("/schedule/register.action")
public class SchedulerWriteServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		
//		req.setCharacterEncoding("utf-8");

		//파일 업로드를 포함하는지 확인
		if (!ServletFileUpload.isMultipartContent(req)) {
			resp.sendRedirect("/schedule/register.action");
			return;
		}

		//1. 전송데이터 읽기
		//application.getRealPath (ServletContext.getRealPath)
		//-> 가상경로(http://......) -> 물리경로(C:\\......)
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/WEB-INF/schedule/");//실제 파일을 저장할 경로
		String tempPath = application.getRealPath("/WEB-INF/temp");//임시 파일을 저장할 경로

		//전송 데이터 각 요소를 분리해서 개별 객체를 만들때 사용할 처리기
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024 * 1024 * 2);//임시 파일 생성 여부를 결정하는 파일 크기
		factory.setRepository(new File(tempPath));//임시 파일 저장 경로 설정

		//요청 파서 (요청 정보를 읽고 개별 요소를 구성하는 역할 수행)
		ServletFileUpload uploader = new ServletFileUpload(factory);
		uploader.setFileSizeMax(1024* 1024 * 50);//업로드 최대 파일 크기 설정

		//요청 정보를 파싱하고 분해해서 FileItem객체의 리스트로 반환
		List<FileItem> items= null;
		//upload table에 insert 하려는 데이터를 저장하는 객체 dto; 
		Schedule schedule = new Schedule();
		
		
		//uploadfile table에 insert 하려는 데이터를 저장하는 객체
		ArrayList<UploadFile> files = new ArrayList<>();
		
		
		try {
			
			items = uploader.parseRequest(req);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		for (FileItem item : items) {
			if (item.isFormField()) {//일반 form-data인 경우
				
				if(item.getFieldName().equals("sclass")){
					schedule.setsClass(item.getString("utf-8"));
				}else if(item.getFieldName().equals("scontent")){
					schedule.setsContent(item.getString("utf-8"));
				}else if(item.getFieldName().equals("swriter")){
					schedule.setsWriter(item.getString("utf-8"));
				}else if(item.getFieldName().equals("sdate")){
				}
				
				System.out.println(
					"DATA " + item.getFieldName() + " : " + item.getString("utf-8"));
			}//파일인 경우 
			else {
				//파일의 내용이 존재하는 경우
				if (item.getSize() > 0) {			
					String fileName = item.getName();
					
					//C:\\AAA\\BBB\\CCC.txt -> CCC.txt
					if (fileName.contains("\\")) {
						fileName = fileName.substring(
							fileName.lastIndexOf("\\") + 1);
					}
					String uniqueFileName = Util.getUniqueFileName(fileName);
					//파일을 로컬 경로에 저장
					try {
						System.out.println(uniqueFileName);
						item.write(new File(path, uniqueFileName));
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					//임시 파일을 삭제
					item.delete();		
					UploadFile f = new UploadFile();
					f.setSavedFileName(uniqueFileName);
					System.out.println("filename : " + fileName);
					f.setUserFileName(fileName);
					files.add(f);
				}
			}
		}
		
		//데이터 베이스에 data를 insert하는부분
		ScheduleDao dao = new ScheduleDao();
		int newUploadNo = dao.insertSchedule(schedule);
		for (UploadFile f : files){

			f.setUploadNo(newUploadNo);
			dao.insertUploadFile(f);
			
		}

//		RequestDispatcher dispatcher = 
//				req.getRequestDispatcher("/WEB-INF/views/upload/uploadlist.jsp");
//			dispatcher.forward(req, resp);
		
		resp.sendRedirect("list.action");
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		
//		req.setCharacterEncoding("utf-8");
		
		
			
			RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/scheduler/register.jsp");
			dispatcher.forward(req, resp);
			
		
		/*doGet(req, resp);*/
	}
	
}






