<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	//setAttribute : request ��ü�� "data"�� Ű�� "Data ..."�� ����
	request.setAttribute("data", "Data from Redirect Page");
	//sendRedirect : ������ ��η� redirect �̵��ϴ� ���
	response.sendRedirect("04.result.jsp");
%>