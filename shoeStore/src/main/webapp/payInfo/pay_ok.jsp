<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.shoe.payInfo.*" %>
<%@page import="com.shoe.member.*" %>
<%String id=(String)session.getAttribute("sid"); %>
<jsp:useBean id="pdto" class="com.shoe.payInfo.Shoe_payInfoDTO"/>
<jsp:setProperty property="*" name="pdto"/>
<jsp:useBean id="pdao" class="com.shoe.payInfo.Shoe_payInfoDAO"/>
<jsp:useBean id="mdto" class="com.shoe.member.Shoe_memberDTO"/>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.shoe.member.Shoe_memberDAO"/>
<%
mdto=mdao.myInfo(id);
int result=pdao.goPay(pdto, mdto);
String msg=result>0?"결제완료!":"오류임";
int update=pdao.chargeUp(pdto,mdto);
%>
<script>
window.alert('<%=msg%>');
opener.parent.location.reload();
window.close();
</script>
