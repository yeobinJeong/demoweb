<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  
<%
int cookieData = 1, sessionData = 1, applicationData = 1;

//1. Cookie
//��û��ü�κ��� �������� ������ ��Ű ����� ��ȯ
Cookie[] cookies = request.getCookies();//��û ������ ���Ե� ��Ű ������ ��ȯ
if (cookies != null) {
	for (int i = 0; i < cookies.length; i++) {
		//�̸��� cookiedata�� ��Ű�� ã�Ƽ�
		if (cookies[i].getName().equals("cookiedata")) {
			//��Ű�� ���� ������ ����
			String data = cookies[i].getValue();//��Ű�� �׻� ���ڿ�
			data = URLDecoder.decode(data, "utf-8");//�񿵹��� ó��
			cookieData = Integer.parseInt(data);//���ڿ� -> ����
		}
	}
}

//�̸��� cookiedata�� ��Ű ��ü �����ϰ� ���� ����
Cookie cookie = 
	new Cookie("cookiedata", 
		URLEncoder.encode(String.format("%d", cookieData + 1), "utf-8"));

//����ð��� �����ϸ� ��Ű�� ���Ϸ� ���
//-> �������� �����ϰ� �ٽ� �����ص� ��Ű ���� ���� �� �ֽ��ϴ�.
//cookie.setMaxAge(60 * 10);
//cookie.setMaxAge(0); //--> ��Ű ���� 

response.addCookie(cookie);//���� ��ü�� ��Ű�� ���

//2. Session
//���ǿ� ���� ����ִٸ� �� ���� �о ������ ����
if (session.getAttribute("sessiondata") != null) {
	//���⼭ �д� ���� ���� ��û���� ����� ������
	sessionData = (Integer)session.getAttribute("sessiondata");
}

//���ǿ� ���� ����
session.setAttribute(
	"sessiondata", Integer.valueOf(sessionData + 1));


//3. Application
if (application.getAttribute("applicationdata") != null) {
	applicationData = 
		(Integer)application.getAttribute("applicationdata");
}

application.setAttribute(
	"applicationdata", Integer.valueOf(applicationData + 1));

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR" />
</head>
<body>
	<a href="06.statemanagement.jsp">���ΰ�ħ</a>
	&nbsp;&nbsp;
	<a href="06.statemanagement2.jsp">�̵�</a>
	<hr />
	COOKIE DATA : <%= cookieData %><br />
	SESSION DATA : <%= sessionData %><br />
	APPLICATION DATA : <%= applicationData %><br />
</body>
</html>