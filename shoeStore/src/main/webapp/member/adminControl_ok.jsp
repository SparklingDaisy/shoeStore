<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="mdto" class="com.shoe.member.Shoe_memberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.shoe.member.Shoe_memberDAO"></jsp:useBean>
    
<%
int result=mdao.memberUpdate(mdto);
String msg=result>0?"정보가 수정되었습니다.":"정보수정에 실패하였습니다.";

%>

<script>
window.alert('<%=msg%>');
window.location.href='/shoeStore/member/myPage.jsp';
</script>