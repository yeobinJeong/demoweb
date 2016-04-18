<%@page import="com.demoweb.dto.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
    <title></title>
    <link rel="Stylesheet" href="/demoweb/styles/default.css" />
</head>
<body>

	<% String bg = request.getParameter("background"); %>
	<% if (bg==null || bg.length()==0) {%>
		<div id="header">
	<%} else { %>
		<div id="header" style='background-color: <%= bg %>'>		 
	<%} %>
    	
            <div class="title">
                <a href="/demoweb/">DEMO WEBSITE</a>
            </div>
            <div class="links">
            <% Member member = (Member)session.getAttribute("loginuser");%> 
			<% if( member != null) { %>
			<%= member.getMemberId() %>
				<a href="/demoweb/account/logout.action">로그아웃</a>
			<% }else { %>
            	<a href="/demoweb/account/loginform.action">로그인</a>
                <a href="#">등록</a>
            <%} %>
            </div>
        </div>        
        <div id="menu">
            <div>
                <ul>
                    <li><a href="/demoweb/member/list.action">사용자관리</a></li>
					<li><a href="/demoweb/mail/sendmailform.action">메일보내기</a></li>
					<li><a href="/demoweb/upload/list.action">자료실</a></li>
					<li><a href="/demoweb/board/list.action">게시판</a></li>
                </ul>
            </div>
		</div>
		
		
    	
        

        

    
</body>
</html>









