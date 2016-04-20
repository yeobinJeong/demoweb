<%@ page language="java" 
	contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
	
	Request Data : <%= request.getAttribute("data1") %><br/>
	Request Data : <%= request.getAttribute("data2") %><br/>
	Request Data : <%= request.getAttribute("data3") %><br/>
	
	
	<hr/>
	
	request data : ${ requestScope.data1 }<br/>
	session data : ${ sessionScope.data2 }<br/>
	application data : ${ applicationScope.data3 }<br/>
	
	<hr/>
	request data : ${ persons.get(3).name }<br/> <!-- getName() -->
	request data : ${ persons[3].name }<br/> <!-- getName() -->
	request data : ${ personht["key3"].name }<br/> <!-- getName() -->
		
	
	
</body>
</html>