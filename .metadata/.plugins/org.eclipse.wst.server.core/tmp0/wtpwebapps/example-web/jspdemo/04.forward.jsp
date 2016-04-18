<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
//setAttribute : request 객체에 "data"를 키로 "Data ..."을 저장
request.setAttribute("data", "Data from Forward Page");
//RequestDispatcher : 요청을 다른 곳으로 전달하는 기능 수행하는 객체
RequestDispatcher d = request.getRequestDispatcher("04.result.jsp");
d.forward(request, response);//forward 방식으로 이동하는 명령
%>