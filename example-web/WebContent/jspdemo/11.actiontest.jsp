<%@page import="com.exampleweb.dto.Person2"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  
<%--   
<%
//요청데이터 읽기 
//데이터를 DTO객체에 저장
//1.
Person person = new Person();
//2.
person.setId(request.getParameter("id"));
person.setPasswd(request.getParameter("passwd"));
person.setEmail(request.getParameter("email"));
person.setPhone(request.getParameter("phone"));
person.setUserType(request.getParameter("userType"));
if (request.getParameter("active") != null && 
	request.getParameter("active").length() > 0) {
	person.setActive(true);
} else {
	person.setActive(false);
}

//....
%>
--%>

<%-- Person p = new Person() --%>
<jsp:useBean id="p" class="com.exampleweb.dto.Person2" />

<%-- 요청 데이터의 각 항목에 해당(이름이 같은)하는 
	person객체의 모든 property에 데이터 저장 (setXxx 메서드 사용) --%>
<jsp:setProperty name="p" property="*" />


    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%-- ID : person.getId() --%>
	
	ID : <jsp:getProperty property="id" name="p" /><br />
	Passwd : <jsp:getProperty property="passwd" name="p" /><br />
	Email : <jsp:getProperty property="email" name="p" /><br />
	Phone : <jsp:getProperty property="phone" name="p" /><br />
	UserType : <jsp:getProperty property="userType" name="p" /><br />
	Active : <jsp:getProperty property="active" name="p" /><br />	
	
	
</body>
</html>