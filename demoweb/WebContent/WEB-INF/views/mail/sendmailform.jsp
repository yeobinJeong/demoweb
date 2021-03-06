<%@page import="com.demoweb.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>메일보내기</title>
	<link rel="Stylesheet" href="/demoweb/styles/default.css" />
	<link rel="Stylesheet" href="/demoweb/styles/input2.css" />	
</head>
<body>

	<div id="pageContainer">
	
		<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		        <div class="inputsubtitle">메일보내기</div>
		        <form id="form" action="sendmail.action" method="post">
		        <table>
		            <tr>
		                <th>받는이</th>
		                <td>
		                    <input type="text" name="to" style="width:550px" />
		                </td>
		            </tr>
		            <tr>
		                <th>보내는이</th>
		                <td>
		                	<%= ((Member)session.getAttribute("loginuser")).getEmail() %>
		                </td>
		            </tr>		            
		            <tr>
		                <th>제목</th>
		                <td>
		                    <input type="text" name="subject" style="width:550px" />
		                </td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td>
		                    <textarea name="content" rows="20" cols="76"></textarea>
		                </td>
		            </tr>
		        </table>
		        <div class="buttons">		        	
		        	<a href="javascript:document.getElementById('form').submit();">보내기</a>
		        	&nbsp;&nbsp;
		        	<a href="/demoweb/">취소</a>
		        </div>
		        </form>
		    </div>
		</div>   	
	
	</div>
	</div>

</body>
</html>