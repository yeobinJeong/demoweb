<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>자료업로드</title>
	<link rel="Stylesheet" href="/demoweb/styles/default.css" />
	<link rel="Stylesheet" href="/demoweb/styles/input.css" />
</head>
<body>

	<div id="pageContainer">
	
		<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		        <div class="inputsubtitle">업로드 자료 정보</div>
		        
		        <table>
		            <tr>
		                <th>제목</th>
		                <td></td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td></td>
		            </tr>
		            <tr>
		            	<th>조회수</th>
		            	<td></td>
		            </tr>
		            <tr>
		            	<th>등록일자</th>
		            	<td></td>
		            </tr>
		            <tr>
		                <th>첨부자료</th>
		                <td>
		                	
		                </td>
		            </tr>
		            <tr>
		                <th>자료설명</th>
		                <td></td>
		            </tr>
		        </table>
		        <div class="buttons">
		        	<input type="button" value="편집" style="height:25px" />
		        	<input type="button" value="취소" style="height:25px" 
		        		onclick="location.href='list.action';" />
		        </div>
		    </div>
		</div>   	
	
	</div>
	</div>

</body>
</html>