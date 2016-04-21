<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>로그인</title>
	<link rel="Stylesheet" href="/demoweb/styles/default.css" />
	<link rel="Stylesheet" href="/demoweb/styles/input.css" />	
</head>
<body>
	
	<div id="pageContainer">
	
		<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
		
		<div id="inputcontent">
			<br /><br />
		    <div id="inputmain">
		        <div class="inputsubtitle">로그인정보</div>
		        
		        <form action="login.action" method="post">
		        
		        
		        <c:set var= "returnURL" value="${ param.returnurl }"></c:set>
		         
		         
		        <c:if test=" ${ empty returnURL }">
		        
		        	<c:set var= "returnURL" value=""></c:set>
		        
		        </c:if>
		        
		        
		        
		        <%-- <% String returnURL = request.getParameter("returnurl");
		         
		        if(returnURL == null) {
		        	returnURL = "";
		        	
		        }
		        %> --%>

				<input type="hidden" name="returnurl" value="${ returnURL }" />
		        <table>
		            <tr>
		                <th>아이디(ID)</th>
		                <td>
		                    <input type="text" name="memberId" style="width:280px" />
		                </td>
		            </tr>
		            <tr>
		                <th>비밀번호</th>
		                <td>
		                	<input type="password" name="passwd" style="width:280px" />
		                </td>
		            </tr>
		        </table>
		        <div class="buttons">
		        	<input type="submit" value="로그인" style="height:25px" />
		        	<input type="button" value="취소" style="height:25px"
		        		onclick="location.href='/demoweb/';" />
		        </div>
		        </form>
		        
		    </div>
		</div>   	
	
	</div>

</body>
</html>