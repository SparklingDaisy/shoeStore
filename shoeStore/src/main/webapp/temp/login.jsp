<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

li{
	list-style-type:none;
}

label{
	width:80px;
	float:left;
}

div{
	text-align:right;
}

</style>
</head>
<%
String saveid="";
Cookie cks[]=request.getCookies();
if(cks!=null){
	for(int i=0;i<cks.length;i++){
		if(cks[i].getName().equals("saveid")){
			saveid=cks[i].getValue();
		}
	}
}
%>
<body>
	<form name="login" action="login_ok.jsp">
		<fieldset>
			<legend>Login</legend>
			<ul>
				<li><label>ID</label>
					<input type="text" name="userid" value="<%=saveid%>">
				</li>
				<li><label>Password</label>
					<input type="password" name="userpwd">
				</li>
			</ul>
				<div>
				<input type="checkbox" name="saveid" value="on" <%=saveid.equals("")?"":"checked" %>>
				ID 기억하기
				<input type="submit" value="login">
				</div>
		</fieldset>
	</form>
</body>
</html>