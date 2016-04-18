<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<body>
	<a href="09.listener.jsp">새로고침</a>
	<h3>
	<%
	if (session.getAttribute("test") != null) {
		//timeout or 
		//session.invalidate() 호출될 때 sessionDestroyed 이벤트 발생
		session.invalidate();
		out.println("유효한 Session이 존재했었고 제거했습니다."); 
	} else {
		//첫번째 세션 객체 접근 시점에 sessionCreated 이벤트 발생
		session.setAttribute("test", "test");
		out.println("유효한 Session이 없어서 새로 등록했습니다.");
	}
	%>
	</h3>	
</body>
</html>

    