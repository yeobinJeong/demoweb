<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	try { 
		/* Thread.sleep(5000); */
	} catch (Exception ex) {}

	out.println(new Date().toString());
	
	//throw new Exception("test exception");
%>