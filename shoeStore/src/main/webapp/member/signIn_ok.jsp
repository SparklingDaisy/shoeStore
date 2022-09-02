<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mdao" class="com.shoe.member.Shoe_memberDAO" scope="page"></jsp:useBean>

<%
String getId=request.getParameter("userid");
String userpwd=request.getParameter("userpwd");
String saveid=request.getParameter("saveid");

int result=mdao.loginCheck(getId,userpwd);

if(result==mdao.LOGIN_OK&&getId!="adminster"){
	String dbname=mdao.getUserInfo(getId);
	session.setAttribute("sid", getId);
	session.setAttribute("sname", dbname);
	
	if(saveid!=null){
		Cookie ck=new Cookie("saveid",getId);
		ck.setMaxAge(60*60*24*30);
		response.addCookie(ck);
	}else{
		Cookie ck=new Cookie("saveid",getId);
		ck.setMaxAge(0);
		response.addCookie(ck);
	}
	
	
	%>
	<script>
	window.alert('<%=dbname%>님 환영합니다.~');
	opener.location.reload();
	window.self.close();
	</script>
	<%
	
	}else if(result==mdao.LOGIN_OK&&getId=="adminster"){
		session.setAttribute("aid", getId);
		session.setAttribute("sname", "admin");
		
		%>
		<script>
		window.alert('관리자로 접속');
		opener.location.reload();
		window.self.close();
		</script>
		<%
	

	if(saveid!=null){
		Cookie ck=new Cookie("saveid",getId);
		ck.setMaxAge(60*60*24*30);
		response.addCookie(ck);
	}else{
		Cookie ck=new Cookie("saveid",getId);
		ck.setMaxAge(0);
		response.addCookie(ck);
	}
	
	
}else if(result==mdao.NOT_ID||result==mdao.NOT_PWD){
	%>
	<script>
	window.alert('ID또는 비밀번호가 잘못되었습니다.');
	window.location.href='sign.jsp';
	</script>
	<%
}else if(result==mdao.ERROR){
	out.println("고객센터 연락바람~");
}

%>