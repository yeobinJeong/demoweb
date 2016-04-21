<%@page import="com.demoweb.dto.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
       
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>게시물 목록</title>
	<link rel="Stylesheet" href="/demoweb/styles/default.css" />
	
</head>
<body>

	<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
	
	<div id="pageContainer">
		
		<div style="padding-top:25px;text-align:center">

			<a href='writeform.action'>글쓰기</a>
			<br /><br />
			
			<table border="1" align="center">
				<tr style="background-color:beige;height:25px">
					<th style="width:50px">번호</th>
					<th style="width:300px">제목</th>
					<th style="width:150px">작성자</th>
					<th style="width:120px">작성일</th>
					<th style="width:80px">조회수</th>
				</tr>
				
				<c:if test=" ${ empty boards }">
					
				</c:if>
				<c:if test="${ not empty boards }">
					<c:forEach var="b" items="${boards}">
						${ b.depth }
					<tr style="background-color:white;height:25px">
						<td style="width:50px">${b.boardNo}</td>
						<td style="width:300px; text-align: left; padding-left:5px">
							
							<c:if test="${  b.depth != 0}">
							       <img src = "/demoweb/image/re.gif"/>
							       			       
							       <c:forEach var="i" begin="1" end="${b.depth}" step="1">
					                  &nbsp;&nbsp;
					                
					      		   </c:forEach>
				          	</c:if>
				          	 
							<c:choose>
								<c:when test="${ b.deleted == true}">		                
									<span style="color: lightgray;" onclick="alert('삭제된 글입니다');">${ b.title }(삭제된 글)</span>
								</c:when>
								<c:otherwise>
									<a href='detail.action?boardno=${ b.boardNo }&pageno=${ pageno }'>
									${ b.title }
									</a>
								</c:otherwise>
							</c:choose>
								
							
						</td>
						<td style="width:150px">${ b.writer }</td>
						<td style="width:120px">${ b.regDate }</td>
						<td style="width:80px">${ b.readCount }</td>
					</tr>
					
					</c:forEach>
				</c:if>
			</table>
		
			<br /><br />
			<%-- 아래는 페이지 번호 출력 --%>
			<%= request.getAttribute("pager").toString() %>
	
		</div>
	</div>

</body>
</html>













