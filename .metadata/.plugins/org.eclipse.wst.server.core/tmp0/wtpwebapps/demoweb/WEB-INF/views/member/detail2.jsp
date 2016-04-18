<%@page import="com.demoweb.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>사용자 정보</title>
	<link rel="Stylesheet" href="/demoweb/styles/default.css" />
	<link rel="Stylesheet" href="/demoweb/styles/input.css" />		
</head>
<body>

	<div id="pageContainer">
		
		<div id="header">
            <div class="title">
                <a href="/demoweb/">DEMO WEBSITE</a>
            </div>
            <div class="links">
            	<a href="/demoweb/account/loginform.action">로그인</a>
                <a href="#">등록</a>
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
		
		<div id="inputcontent">
			<br /><br />
		    <div id="inputmain">
		        <div class="inputsubtitle">회원기본정보</div>
		        <% Member member = (Member)request.getAttribute("member"); %>
				
		        <table>
		            <tr>
		                <th>아이디(ID)</th>
		                <td><%= member.getMemberId() %></td>
		            </tr>
		            <tr>
		                <th>이메일</th>
		                <td><%= member.getEmail() %></td>
		            </tr>
		            <tr>
		                <th>사용자구분</th>
		                <td><%= member.getUserType() %></td>
		            </tr>		            
		            <tr>
		                <th>활성화여부</th>
		                <td><%= member.isActive() %></td>
		            </tr>
		            <tr>
		                <th>등록일자</th>
		                <td><%= member.getRegDate() %></td>
		            </tr>		            		            
		        </table>
		        <div class="buttons">
		        	<a href="list.action">목록</a>
		        </div>
		    </div>
		</div>   		
		
	</div>

</body>
</html>