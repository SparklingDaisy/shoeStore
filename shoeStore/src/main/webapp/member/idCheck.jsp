<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="mdto" class="com.shoe.member.shoe_memberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<body>
		<form name="idCheck" action="idCheck_ok.jsp">
			<fieldset>
				<legend>아이디 중복검사</legend>
				<table>
					<tr>
						<td><input type="text" name="mid"></td>
						<td><input type="submit" value="검사"></td>
					<tr>
				</table>
			</fieldset>
		</form>
	</body>
</html>