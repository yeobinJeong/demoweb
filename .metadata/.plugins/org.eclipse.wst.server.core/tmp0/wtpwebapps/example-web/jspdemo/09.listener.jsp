<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<body>
	<a href="09.listener.jsp">���ΰ�ħ</a>
	<h3>
	<%
	if (session.getAttribute("test") != null) {
		//timeout or 
		//session.invalidate() ȣ��� �� sessionDestroyed �̺�Ʈ �߻�
		session.invalidate();
		out.println("��ȿ�� Session�� �����߾��� �����߽��ϴ�."); 
	} else {
		//ù��° ���� ��ü ���� ������ sessionCreated �̺�Ʈ �߻�
		session.setAttribute("test", "test");
		out.println("��ȿ�� Session�� ��� ���� ����߽��ϴ�.");
	}
	%>
	</h3>	
</body>
</html>

    