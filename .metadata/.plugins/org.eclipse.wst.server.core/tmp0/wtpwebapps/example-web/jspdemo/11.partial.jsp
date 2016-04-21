<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8"%>

    	 
<h3 style="color:red">
이 페이지는 include 또는 forward로 처리되었습니다.<br />
수신한 데이터 : <%= request.getParameter("mydata") %>
</h3>