<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
//setAttribute : request ��ü�� "data"�� Ű�� "Data ..."�� ����
request.setAttribute("data", "Data from Forward Page");
//RequestDispatcher : ��û�� �ٸ� ������ �����ϴ� ��� �����ϴ� ��ü
RequestDispatcher d = request.getRequestDispatcher("04.result.jsp");
d.forward(request, response);//forward ������� �̵��ϴ� ���
%>