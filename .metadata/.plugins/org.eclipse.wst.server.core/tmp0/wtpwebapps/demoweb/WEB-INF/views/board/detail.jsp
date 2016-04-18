<%@page import="com.demoweb.dto.Member"%>
<%@page import="com.demoweb.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" session="true"%>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8" />
	<title>글쓰기</title>
	<link rel="Stylesheet" href="/demoweb/styles/default.css" />
	<link rel="Stylesheet" href="/demoweb/styles/input2.css" />
	
	 <script type="text/javascript">
		        function doDelete(boardNo, pageNo){
		        	yes = confirm(boardNo + '번 글을 삭제할까요 ?');
		        	if(yes){
		        		location.href = 'delete.action?boardno=' + boardNo + '&pageno='+ pageNo;
		        	}
		        }
	 </script>	
</head>[]
<body>

	<div id="pageContainer">
	
		<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		        <div class="inputsubtitle">게시판 글 내용</div>
		        <% Board board = (Board)request.getAttribute("board"); %>       
		        <table>
		            <tr>
		                <th>제목</th>
		                <td><%= board.getTitle() %></td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td><%= board.getWriter() %></td>
		            </tr>
		            <tr>
		                <th>작성일</th>
		                <td><%= board.getRegDate() %></td>
		            </tr>
					<tr>
		                <th>조회수</th>
		                <td><%= board.getReadCount() %></td>
		            </tr>
		            
		            <tr>
		                <th>내용</th>
		                <td style="height:200px;vertical-align:top">		                    
		                    <%= board.getContent().replace("\r\n", "<br>").replace(" ", "&nbsp;") %>		                    
		                </td>
		            </tr>
		        </table>
		       
		        <div class="buttons">		        
		         	<% Member member = (Member)session.getAttribute("loginuser"); %>
		         	<% if (member.getMemberId().equals(board.getWriter() )) {%>
		         		<a href='javaScript:doDelete(<%=board.getBoardNo() %>, <%=request.getAttribute("pageno") %>)'>삭제</a>&nbsp;&nbsp;
		         		<a href='edit.action?boardno=<%= board.getBoardNo()%>&pageno=<%=request.getAttribute("pageno")%>'>수정</a>&nbsp;&nbsp;
		        	<% } %>
                 		<a href="list.action?pageno=<%= request.getAttribute("pageno")%>">목록보기</a>
		        </div>
		    </div>
		</div>
				
		<br /><br />
		
		
	</div>
	</div>

</body>
</html>