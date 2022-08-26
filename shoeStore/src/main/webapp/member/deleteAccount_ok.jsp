<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="mdao" class="com.shoe.member.shoe_memberDAO"></jsp:useBean>

   
<%
	String sid=(String)session.getAttribute("sid");
	if(sid==null){
		
		%>
		<script>
			window.alert('로그인 후 이용가능합니다.');
			window.location.href="/shoeStore";
		</script>
		<%
		return;
	}else{
		%>

	<script>
		<%int result=mdao.deleteAccount(sid);
		session.invalidate();
		%>
		alert('탈퇴되었습니다. 이용해주셔서 감사합니다.');
		window.location.href='/shoeStore';
	</script>
		<%
}%>