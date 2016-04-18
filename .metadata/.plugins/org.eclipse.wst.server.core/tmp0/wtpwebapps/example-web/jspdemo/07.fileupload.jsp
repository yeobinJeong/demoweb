<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
    
<%
//요청 데이터를 읽을 때 사용할 문자 인코딩 설정
request.setCharacterEncoding("utf-8");

//파일 업로드를 포함하는지 확인
if (!ServletFileUpload.isMultipartContent(request)) {
	response.sendRedirect("07.fileuploadform.jsp");
	return;
}

//1. 전송데이터 읽기
//application.getRealPath (ServletContext.getRealPath)
//-> 가상경로(http://......) -> 물리경로(C:\\......)
String path = application.getRealPath("/jspdemo/files");//실제 파일을 저장할 경로
String tempPath = application.getRealPath("/jspdemo/temp");//임시 파일을 저장할 경로

//전송 데이터 각 요소를 분리해서 개별 객체를 만들때 사용할 처리기
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setSizeThreshold(1024 * 1024 * 2);//임시 파일 생성 여부를 결정하는 파일 크기
factory.setRepository(new File(tempPath));//임시 파일 저장 경로 설정

//요청 파서 (요청 정보를 읽고 개별 요소를 구성하는 역할 수행)
ServletFileUpload uploader = new ServletFileUpload(factory);
uploader.setFileSizeMax(1024* 1024 * 50);//업로드 최대 파일 크기 설정

//요청 정보를 파싱하고 분해해서 FileItem객체의 리스트로 반환
List<FileItem> items = uploader.parseRequest(request);

for (FileItem item : items) {
	if (item.isFormField()) {//일반 form-data인 경우
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
			//파일을 로컬 경로에 저장
			item.write(new File(path, fileName));
			//임시 파일을 삭제
			item.delete();			
		}
	}
}

response.sendRedirect("07.filelist.jsp");

%>






