<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
	<div style="padding:50px">
	<form action="07.fileupload.jsp" 
		  method="post"
		  enctype="multipart/form-data">
		파일 1 : <input type="file" name="file1" /><br />
		파일 2 : <input type="file" name="file2" /><br />
		메시지 : <input type="text" name="message" /><br />
		<input type="submit" value="전송" />
	</form>
	</div>
</body>
</html>