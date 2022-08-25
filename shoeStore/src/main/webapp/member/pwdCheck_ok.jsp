<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mdao" class="com.shoe.member.shoe_memberDAO"></jsp:useBean>
<%
String pwd=request.getParameter("pwd");
String pwd2=request.getParameter("pwd2");

if(pwd==pwd2){
	
	%>
	<script>
	window.alert('비밀번호가 일치합니다.');
	window.location.href='join.jsp';
	opener.document.join.pwd.value='<%=pwd%>';
	opener.document.join.pwd2.value='<%=pwd2%>';
	</script>
	<%
	
}else{
	
	%>
	<script>
	window.alert('비밀번호가 일치하지 않습니다!');
	window.location.href='join.jsp';
	</script>
	<%
}


%>