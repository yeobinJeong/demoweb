<%@page import="com.demoweb.dto.Board"%>
<%@page import="com.demoweb.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 
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
		        <div class="inputsubtitle">게시판 답글쓰기</div>
		        <form action="reply.action" 
		        	  method="post">
		        <% Board board = (Board)request.getAttribute("board"); %>
		         <input type='hidden' name="boardno" value="<%= board.getBoardNo() %>" />
		        <table>
		            <tr>
		                <th>제목</th>
		                <td>
		                    <input type="text" name="title" style="width:480px" value="RE: <%=board.getTitle()%>"/>
		                </td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td>
		                	<%= ((Member)session.getAttribute("loginuser")).getMemberId() %>
		                </td>
		            </tr>		            
		            <tr>
		                <th>내용</th>
		                <td>		                    
		                    <textarea 
		                    	name="content" cols="76" rows="15" >


========== 게시글 ===========
<%=board.getContent() %></textarea>
		                </td>
		            </tr>
		            <!-- <tr>
		           		<th>댓글</th>
		            	<td><input type="text" name="reply" style="width:480px" value=""/></td>
		            </tr> -->
		        </table>
		        <div class="buttons">
		        	<!-- 아래 a 링크는 input type='submit' 버튼을 누르는 효과 발생 -->		        	
		        	<a href="javascript:document.forms[0].submit();"> 답글쓰기</a>
		        	&nbsp;&nbsp;
		        	      
		        	<a href='detail.action?boardno=<%=board.getBoardNo()%>&pageno=<%=request.getAttribute("pageno")%>'>취소 </a>
		        </div>
		        </form>
		    </div>
		</div>   	
	
	</div>
	</div>

</body>
</html>