<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="java.io.*" %>
<jsp:useBean id="bdto" class="com.shoe.bbs.Shoe_bbsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="com.shoe.bbs.Shoe_bbsDAO" scope="session"></jsp:useBean>
<%
String path=request.getRealPath("/img");
MultipartRequest mr=
	new MultipartRequest(request,path,1024*1024*10,"utf-8");
String bid=mr.getParameter("bid");
String bsubject=mr.getParameter("bsubject");
String bcontent=mr.getParameter("bcontent");
String bimg=mr.getFilesystemName("upload");
int result=bdao.bbsWrite(bid, bsubject, bcontent, bimg);
String msg=result>0?"글쓰기 성공!":"글쓰기 실패!";
%>
<script>
window.alert('<%=msg%>')
location.href="bbsList.jsp"
</script>