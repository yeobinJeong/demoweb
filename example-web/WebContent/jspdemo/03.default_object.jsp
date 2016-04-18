<%@ page language="java" 
	contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>

	<% if (session != null) { %>
	<% out.write("Session 객체가 존재합니다.\r\n"); %>
	<% } %>
	<hr />
	<% if (application != null) { 
	out.write("application 객체가 존재합니다.\r\n"); 
	} %>
	<hr />
	<%= request.getRequestURI() %>

</body>
</html>













