<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/shoeStore/css/sign.css">
  <script>
 function openIdCheck(){
	 window.open('idCheck.jsp','idCheck','width=450,height=150');
 }
  </script>
</head>
<body>
<div class="login-wrap">
  <div class="login-html">
    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
    <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
    <div class="login-form">
      <div class="sign-in-htm">
	      <form name="signIn" action="signIn_ok.jsp">
	        <div class="group">
	          <label for="user" class="label">ID</label>
	          <input id="user" type="text" class="input" name="userid" value="<%=saveid%>">
	        </div>
	        <div class="group">
	          <label for="pass" class="label">Password</label>
	          <input id="pass" type="password" class="input" name="userpwd">
	        </div>
	        <div class="group">
	          <input id="check" type="checkbox" class="check" name="saveid" value="on" <%=saveid.equals("")?"":"checked" %>>
	          <label for="check"><span class="icon"></span> remember ID</label>
	        </div>
	        <div class="group">
	          <input type="submit" class="button" value="Sign In">
	        </div>
	        <div class="hr"></div>
	        <div class="foot-lnk">
	          <a href="#forgot">Forgot Password?</a>
	        </div>
	      </form>
      </div>
      <div class="sign-up-htm">
      	<form name="sign-up" action="signUp_ok.jsp">
	        <div class="group">
	          <label for="user" class="label">ID</label>
	          <input id="userId" type="text" class="id" name="mid" readonly>
	          <input type="button" class="button_id" value="check" onclick="openIdCheck();">
	        </div>
	        <div class="group">
	          <label for="pass" class="label">Password</label>
	          <input id="pass" type="password" class="input" name="mpwd">
	        </div>
    	     <div class="group">
	          <label for="pass" class="label">Repeat Password</label>
	          <input id="pass" type="password" class="input" name="mpwd2">
	        </div>
	        <div class="group">
	          <label for="pass" class="label">Name</label>
	          <input id="pass" type="text" class="input" name="mname">
	        </div>
	        <div class="group">
	          <label for="pass" class="label">birthdate</label>
	          <input id="pass" type="text" class="birth" name="mbirthdate" onfocus="this.placeholder='ex)910422'"
	          onfocus="this.placeholder=''" onblur="this.placeholder='ex)910422'">
	          <input type="radio" name="mgender" value="man" checked>meil
			<input type="radio" name="mgender" value="woman">femeil
	        </div>
			<div class="group">
	          <label for="pass" class="label">Phone number</label>
	          <input id="pass" type="text" class="input" name="mtel">
	        </div>
			<div class="group">
	          <label for="pass" class="label">Address</label>
	          <input id="pass" type="text" class="input" name="maddr">
	        </div>
			 <div class="group">
	          <label for="pass" class="label">Email Address</label>
	          <input id="pass" type="text" class="input" name="memail">
	        </div>
			<div class="group">
	          <input id="check" type="checkbox" name="mad" value="on" checked>
	          <label>mailing service</label>
	        </div>
	        <div class="group">
	          <input type="submit" class="button" value="Sign Up">
	        </div>
      	</form>
      </div>
    </div>
  </div>
</div>
</body>
</html>