<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	//setAttribute : request 객체에 "data"를 키로 "Data ..."을 저장
	request.setAttribute("data", "Data from Redirect Page");
	//sendRedirect : 지정된 경로로 redirect 이동하는 명령
	response.sendRedirect("04.result.jsp");
%>