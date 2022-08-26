<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="mdto" class="com.shoe.member.shoe_memberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.shoe.member.shoe_memberDAO"></jsp:useBean>
    
<%
String mpwd=request.getParameter("mpwd");
String mpwd2=request.getParameter("mpwd2");
System.out.println(mpwd);
System.out.println(mpwd2);
String msg="";

if(!mpwd.equals(mpwd2)){
	
	%>
	<script>
	window.alert('비밀번호가 일치하지 않습니다!');
	window.location.href='/shoeStore/member/memberInfo.jsp';
	</script>
	<%
	
}else if(mpwd==""||mpwd2==""){
	
	%>
	<script>
	window.alert('비밀번호를 입력해주세요!');
	window.location.href='/shoeStore/member/memberInfo.jsp';
	</script>
	<%
	

}else{

	int result=mdao.memberUpdate(mdto);
	msg=result>0?"내정보가 수정되었습니다.":"정보수정에 실패하였습니다.";

}%>

<script>
window.alert('<%=msg%>');
window.location.href='/shoeStore/member/myPage.jsp';
</script>