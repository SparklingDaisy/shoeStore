<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>basket.jsp</h1>
<%
String iid = request.getParameter("id");
String iidx = request.getParameter("iidx");
String iname = request.getParameter("iname");
String iprice = request.getParameter("iprice");
String isize = request.getParameter("isize");
String icnt = request.getParameter("icnt");
%>
<%=iid %>
<%=iidx %>
<%=iname %>
<%=iprice %>
<%=isize %>
<%=icnt %>
</body>
</html>