<%@page import="java.util.Date"%>
<%@ page language="java" 
	contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<%!	// 선언문 : 변수, 메서드를 선언하는 영역
int x;
String getTimeString() {
	return new Date().toString();
}

%>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
	
	<div style='text-align:center'>
		<%-- Scriptlet : 실행문을 작성하는 영역 --%>
		<h2><% out.println(new Date().toString()); %></h2>
	
		<%-- Expression : 출력문을 작성하는 영역
		                  out.println( 을 생략한 구문 --%>
		<h2><%= new Date().toString() %></h2>
		
		<h2><%= getTimeString() %></h2>
	</div> <%-- out.write("</div>") --%>
	
	<%-- JSP 주석 : 서버에서 주석으로 처리 (브라우저로 전송 X) --%>
	<!-- HTML 주석 : 서버에서는 문자열로 처리 -->
	
</body>
</html>