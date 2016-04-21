<%@page import="com.demoweb.dto.Board"%>
<%@page import="com.demoweb.dto.Member"%>
<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>글쓰기</title>
	<link rel="Stylesheet" href="/demoweb/styles/default.css" />
	<link rel="Stylesheet" href="/demoweb/styles/input2.css" />	
</head>
<body>

	<div id="pageContainer">
	
		<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		        <div class="inputsubtitle">게시판 글 수정</div>
		        <form action="update.action" 
		        	  method="post">
		        <%-- <% Board board = (Board)request.getAttribute("board"); %> --%>
		         <input type='hidden' name="boardno" value="${ board.boardNo }" />
		        <table>
		            <tr>
		                <th>제목</th>
		                <td>
		                    <input type="text" name="title" style="width:480px" value="${ board.title }"/>
		                </td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td>
		                	<%-- <%= ((Member)session.getAttribute("loginuser")).getMemberId() %> --%>
		                	${ loginuser.memberId }
		                </td>
		            </tr>		            
		            <tr>
		                <th>내용</th>
		                <td>		                    
		                    <textarea 
		                    	name="content" cols="76" rows="15" >${ board.content }</textarea>
		                </td>
		            </tr>
		        </table>
		        <div class="buttons">
		        	<!-- 아래 a 링크는 input type='submit' 버튼을 누르는 효과 발생 -->		        	
		        	<a href="javascript:document.forms[0].submit();">글수정</a>
		        	&nbsp;&nbsp;
		        	      
		        	<a href='detail.action?boardno=${ board.boardNo }&pageno=${ pageno }'>취소 </a>
		        </div>
		        </form>
		    </div>
		</div>   	
	
	</div>
	</div>

</body>
</html>