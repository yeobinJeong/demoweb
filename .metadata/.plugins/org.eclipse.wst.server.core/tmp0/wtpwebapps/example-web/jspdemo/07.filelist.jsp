
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8"%>
    	 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>파일 목록</title>
</head>
<body>
	<% 
	//가상 경로- >  물리 경로를 찾는 메소드 
	String path = application.getRealPath("jspdemo/files/");
	//디렉터리 또는 파일을 관리하는 객체를 만들기.
	File file = new File(path);
	String[] files = null;
	
	if(!file.exists()){
		out.println("디렉터리 없음");
		return;
	}
	else{
		if(file.isDirectory()){
			//지정된 디렉터리의 파일 목록을 반환 
			files=file.list();
		
			
		}else{
			out.println("디렉터리 아님");
			return;
		}
		
		
	}
	
	%>
	<div style="padding:50px">
		<h4><a href='07.fileuploadform.jsp' 
			style="text-decoration: none">파일 업로드</a></h4>
		<hr />
		
		<% if(files.length == 0) {%>
			<h4>파일이 없습니다.</h4>
		<% } else { %>
		
			<%for(String  f: files){ %>
			 
			<a href='download.action?file=<%= URLEncoder.encode(f, "utf-8") %>'><%= f %></a>
			<br/>
			
			
			<% }	%>
		<% } %>
	</div>

</body>
</html>








