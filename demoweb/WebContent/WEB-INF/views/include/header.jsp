<%@page import="com.demoweb.dto.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
    <title></title>
    <link rel="Stylesheet" href="/demoweb/styles/default.css" />
</head>
<body>

	<% String bg = request.getParameter("background"); %>
	<c:if test="${ empty param['background'] }">
		<div id="header">
	</c:if>
	<c:if test="${ not empty param['background'] }">
		<div id="header" style="background-color: ${param['background'] }">		 
	
    	
            <div class="title">
                <a href="/demoweb/">DEMO WEBSITE</a>
            </div>
            <div class="links">
            	<c:choose>
            		<c:when test="${ loginuser != null }">
            			${ loginuser.memberId } 
						<a href="/demoweb/account/logout.action">로그아웃</a>
					</c:when>
				    <c:otherwise>
            			<a href="/demoweb/account/loginform.action">로그인</a>
            			<a href="#">등록</a>
            	 	</c:otherwise> 
            	</c:choose>    
            
            </div>
        
      </c:if>
      </div>        
        <div id="menu">
            <div>
                <ul>
                    <li><a href="/demoweb/member/list.action">사용자관리</a></li>
					<li><a href="/demoweb/mail/sendmail.action">메일보내기</a></li>
					<li><a href="/demoweb/upload/list.action">자료실</a></li>
					<li><a href="/demoweb/board/list.action">게시판</a></li>
					<li><a href="/demoweb/schedule/register.action">Scheduler</a></li>
					<li><a href="/demoweb/dot/input.action">DotInput</a></li>
					<li><a href="/demoweb/dot/display.action">DotDisplay</a></li>
                </ul>
            </div>
		</div>
		
		
		
		
		
		<div style ="text-align: right; padding: 5px; margin-top: 1px; border:solid 1px;">
		[ Total : <%=application.getAttribute("total") %> Current : <%= application.getAttribute("current") %> ]
		</div>
    	
        

        

    
</body>
</html>









