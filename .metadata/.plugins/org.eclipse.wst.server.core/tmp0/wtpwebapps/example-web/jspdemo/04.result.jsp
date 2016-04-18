<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
	
	<h2 style="text-align:center">최종 결과 페이지</h2>
	
	<div style="text-align:center">
		이전 처리기에서 받은 데이터 : <%= request.getAttribute("data") %>
	</div>

</body>
</html>