<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="mdto" class="com.shoe.member.shoe_memberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.shoe.member.shoe_memberDAO"></jsp:useBean>
<%
String mpwd=request.getParameter("mpwd");
String mpwd2=request.getParameter("mpwd2");
int pwd=Integer.parseInt(mpwd);
int pwd2=Integer.parseInt(mpwd2);
System.out.println(pwd);
System.out.println(pwd2);

if(pwd!=pwd2){
	%>
	<script>
	window.alert('비밀번호가 일치하지 않습니다!');
	window.location.href='/shoeStore/member/join.jsp';
	</script>
	<%
	
}else{
int result=mdao.memberJoin(mdto);
String msg=result>0?"회원가입을 축하합니다!":"회원가입에 실패하였습니다.";
%>

<script>
window.alert('<%=msg%>')
window.location.href='/shoeStore';
</script>
<%}%>