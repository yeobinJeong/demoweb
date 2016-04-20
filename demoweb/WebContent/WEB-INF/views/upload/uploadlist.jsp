<%@page import="com.demoweb.dto.Upload"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>자료 목록</title>
	<link rel="Stylesheet" href="/demoweb/styles/default.css" />
</head>
<body>

	<div id="pageContainer">
	
	<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
	
		<div style="padding-top:25px;text-align:center">
			[ <a href="/demoweb/upload/write.action">자료 등록</a> ]
			<br /><br />
			
			
								
			<table border="1" style="width:600px" align="center">
				<tr style="background-color:orange;height:30px">
					<th style="width:50px">번호</th>
					<th style="width:400px">제목</th>
					<th style="width:150px;text-align:center">작성일</th>
				</tr>
				<%-- <%
					List<Upload> uploads = (List<Upload>)request.getAttribute("uploads");
				%> --%>

				
				<%-- <%
					if (uploads.size() == 0) {
				%> --%>
				<c:choose>
					<c:when test="${empty uploads }">
					</c:when>
					
					<c:otherwise>
				
					<c:forEach var="u" items="${ uploads }">
				<tr>
					<td>
						${ u.uploadNo }
					</td>
					<td>
						<a href="detail.action?uploadno=${u.uploadNo }">
							${u.title }
						</a>
					</td>
					<td>
						${u.regDate }
					</td>
				
				</tr>
					</c:forEach>
					
				</c:otherwise>
				</c:choose>
			</table>
			<br /><br /><br /><br />
			
		</div>
		
	</div>
		

</body>
</html>











