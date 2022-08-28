<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdao" class="com.shoe.bbs.Shoe_bbsDAO" scope="session"></jsp:useBean>
<%
int bref=Integer.parseInt(request.getParameter("bref"));
String bimg=request.getParameter("bimg");
String path=request.getRealPath("");
int result=bdao.bbsDelete(bref, bimg, path);
String msg=result>0?"게시글 삭제 성공!":"게시글 삭제 실패";
%>
<script>
window.alert('<%=msg%>');
window.location.href='bbsList.jsp';
</script>