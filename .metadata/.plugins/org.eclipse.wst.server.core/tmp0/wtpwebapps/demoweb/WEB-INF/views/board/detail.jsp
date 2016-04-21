<%@page import="com.demoweb.dto.BoardComment"%>
<%@page import="com.demoweb.dto.Member"%>
<%@page import="com.demoweb.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" session="true"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
</head>
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
		                <td>${ board.title }</td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td>${ board.writer }</td>
		            </tr>
		            <tr>
		                <th>작성일</th>
		                <td>${ board.regDate }</td>
		            </tr>
					<tr>
		                <th>조회수</th>
		                <td>${ board.readCount }</td>
		            </tr>
		            
		            <tr>
		                <th>내용</th>
		                <td style="height:200px;vertical-align:top">		                    
		                    <%-- <%= board.getContent().replace("\r\n", "<br>").replace(" ", "&nbsp;") %> --%>
		                    ${ fn:replace(board.content, "
", "<br/>")}
		                   <%--  ${ fn:replace(board.content, " ", "&nbsp;")} --%>		                    
		                </td>
		            </tr>
		        </table>
		        <% Member member = (Member)session.getAttribute("loginuser"); %>
		        
		       
				
				
				
				
				
		<%--여기서부터 버튼 --%>
		        <div class="buttons">		        
		         	
		         	<%-- <% if (member.getMemberId().equals(board.getWriter() )) {%> --%>
		           <c:choose>
		           	<c:when test="${ loginuser.memberId.equals(board.writer) }">
		         		<a href='javaScript:doDelete(${ board.boardNo }, ${ pageno })'>삭제</a>&nbsp;&nbsp;
		         		<a href='edit.action?boardno=${ board.boardNo }&pageno=${ pageno }'>수정</a>&nbsp;&nbsp;
		         	</c:when>
		        	<c:otherwise>
		        		<%-- 작성자가 자신의 글에 댓글을 쓸 수 없다면 이곳에 --%> 
		        	</c:otherwise>
		           </c:choose>
		        		<a href='replyform.action?borardno=${ board.boardNo }&pageno=${ pageno }'>답글쓰기</a><br /><br />
                 		<a href='list.action?pageno=${ pageno }'>목록보기</a>
                 		
                 	
		        </div>
		    </div>
		</div>
		
		 
				<br /><br />
		
				<form id="commentform" 
					action="writecomment.action" method="post">
					<input type="hidden" name="boardno"
						value="${ board.boardNo }" />
					<input type="hidden" name="pageno"
						value="${ pageno }" />
					<table style="width:600px;border:solid 1px;margin:0 auto">
			            <tr>
			                <td style="width:550px">	                	
			                    <textarea name="content" 
			                    	style="width:550px" rows="3"></textarea>
			                </td>
			                <td style="width:50px;vertical-align:middle">
			                	<a href="javascript:document.getElementById('commentform').submit();"
			                		style="text-decoration:none">
			                		댓글<br />등록
			                	</a>
			                </td>
			            </tr>                    
			        </table>
		        </form>        
		        
		        <hr align="center" style="width:600px;" />	
		       
		        <%-- <% if (board.getComments().size() == 0) { %> --%>
			        <c:if test="${ board.comments.size() == 0 }">
				        <h4 id="nodata" style="text-align:center">
				            작성된 댓글이 없습니다.
				        </h4>
			        </c:if>
			        <c:if test="${ board.comments.size() != 0 }">      
						<!-- comment 표시 영역 -->
						<script type="text/javascript">
						var v = null, e = null;
						function toggleCommentStatus(commentNo, edit){
							if(v != null){
								v.style.display = edit ? 'block' : 'none';
								e.style.display = edit ? 'none': 'block';
								
							}
							v = document.getElementById("commentview" + commentNo);
							e = document.getElementById("commentedit" + commentNo);
							
							v.style.display = edit ? 'none' : 'block';
							e.style.display = edit ? 'block': 'none';
							
						}
						function deleteComment(commentNo, boardNo, pageNo){
							var yes = confirm(commentNo+"번 댓글을 삭제하시겠습니까?");
							
							if(yes){
								location.href = 'deletecomment.action?commentno=' + commentNo + '&boardno=' + boardNo + '&pageno='+pageNo;
							}
						}
						</script>
						<table style="width:600px;border:solid 1px;margin:0 auto">
						<c:forEach var="bcomment" items="${ board.comments }">
				        	<tr>
				        		<td style="text-align:left;margin:5px;border-bottom: solid 1px">
				        		
				        		<div id='commentview${ bcomment.commentNo }'>
				                    ${ bcomment.writer } &nbsp;&nbsp;
				                    [ ${ bcomment.regDate } ]
				                    <br /><br />
				                    <span>
				                        ${ fn:replace(bcomment.content, "
", "<br/>")}
				                    </span>
				                    <br /><br />
				                   
				                    <c:choose>
				                     <c:when test="${ loginuser.memberId.equals(bcomment.writer) }">
				                    	<c:set var="display" value="block" />
				                     </c:when>
				                     <c:otherwise>
				                     	<c:set var="display" value="none" />
				                     </c:otherwise>
				                    </c:choose>
				                    <div style="display: ${display}">
				                    	<a href="javascript:toggleCommentStatus(${ bcomment.commentNo }, true);">편집</a>
				                    	&nbsp;
				                    	<a href="javascript:deleteComment(${ bcomment.commentNo }, ${ board.boardNo }, ${ pageno })">삭제</a>
				                    </div>
				                </div>
				                
				                <div id='commentedit${ bcomment.commentNo }' style="display: none">
									${ bcomment.writer }&nbsp;&nbsp; 
									[${ bcomment.regDate }] 
									<br /><br />
									<form id="commenteditform${ bcomment.commentNo }" 
										action="updatecomment.action" method="post">
										<input type="hidden" name="boardno"
											value="${ board.boardNo }" />
										<input type="hidden" name="pageno"
											value="${ pageno }" />
										<input type="hidden" name="commentno"
											value="${ bcomment.commentNo }" />
										<textarea name="content" style="width: 600px" rows="3" 
											maxlength="200">${ bcomment.content }</textarea>
									</form>
									<br />
									<div>
										<a href="javascript:document.getElementById('commenteditform${ bcomment.commentNo }').submit();">수정</a> 
										&nbsp; 
										<a href="javascript:toggleCommentStatus(${ bcomment.commentNo }, false);">취소</a>
									</div>
								</div>
					
								</td>
				        	</tr>
				        </c:forEach>
				        </table>		
					</c:if>	 <!-- else 끝 -->
				
		
		
	</div>
	</div>

</body>
</html>